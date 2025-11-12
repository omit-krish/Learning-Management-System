package com.lms.controller;

import com.lms.DTO.PageDTO;
import com.lms.Entity.Course;
import com.lms.Entity.Instructor;
import com.lms.service.CourseService;
import com.lms.service.InstructorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes("pageDTO")
public class CourseController {
    private final CourseService courseService;
    private final InstructorService instructorService;

    // Constructor injection (preferred over field injection)
    public CourseController(CourseService courseService, InstructorService instructorService) {
        this.instructorService = instructorService;
        this.courseService = courseService;
    }


    @GetMapping("/viewCourse")
    public String showCourse(@RequestParam("courseID") Integer id, Model model) {
        System.out.println("inside showCourse method with courseID: " + id);
        Course course = courseService.getCourseByID(id);

        if (course == null) {
            // course not found - redirect to a not-found page or home
            return "redirect:/";
        }

        PageDTO pageDTO = new PageDTO();

        if (course.getLessons() != null && !course.getLessons().isEmpty()) {
            pageDTO.setFirstLessonId(course.getLessons().get(0).getId());
            pageDTO.setLastLessonId(course.getLessons().get(course.getLessons().size() - 1).getId());
        } else {
            // No lessons available - set nulls or handle accordingly
            pageDTO.setFirstLessonId(null);
            pageDTO.setLastLessonId(null);
        }

        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("course", course);

        System.out.println(">>>>>>>>>>>>" + pageDTO);
        return "course";
    }


    @GetMapping("/addCourse")
    public String addCourse(@ModelAttribute("course") Course course, Model model) {

        System.out.println("inside addCourse method");
        List<Instructor> instructors = instructorService.getInstructors();
        model.addAttribute("instructors", instructors);
        return "addCoursePage";
    }


    @PostMapping("/saveCourse")
    public String saveCourse(@ModelAttribute("course") Course course) {
        System.out.println("inside saveCourse method" + course);
        courseService.addCourse(course);
        return "redirect:/instructors";
    }

}




