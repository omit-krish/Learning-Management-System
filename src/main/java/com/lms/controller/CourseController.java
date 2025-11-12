package com.lms.controller;

import com.lms.DTO.PageDTO;
import com.lms.Entity.Course;
import com.lms.Entity.Instructor;
import com.lms.Entity.Lesson;
import com.lms.service.CourseService;
import com.lms.service.InstructorService;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes({"course", "pagedListHolder", "pageDTO"})
public class CourseController {
    private final CourseService courseService;
    private final InstructorService instructorService;

    // Constructor injection (preferred over field injection)
    public CourseController(CourseService courseService, InstructorService instructorService) {
        this.instructorService = instructorService;
        this.courseService = courseService;
    }


    private static PageDTO getPageDTO(Course course) {
        PageDTO pageDTO = new PageDTO();

        assert course != null;
        if (course.getLessons() != null && !course.getLessons().isEmpty()) {
            pageDTO.setFirstLessonId(course.getLessons().get(0).getId());
            pageDTO.setLastLessonId(course.getLessons().get(course.getLessons().size() - 1).getId());
        } else {
            // No lessons available - set nulls or handle accordingly
            pageDTO.setFirstLessonId(null);
            pageDTO.setLastLessonId(null);
        }
        return pageDTO;
    }

    @GetMapping("/viewCourse")
    public String showCourse(@RequestParam("courseID") Integer id,
                             @RequestParam(name = "pageNum", required = false) Integer pageNum, Model model) {
        System.out.println("inside showCourse method with courseID: " + id);
        Course course = null;
        PagedListHolder<Lesson> pagedListHolder = null;
        if (pageNum == null) {
            pagedListHolder = new PagedListHolder<>();
            course = courseService.getCourseByID(id);
            model.addAttribute("course", course);
            model.addAttribute("pagedListHolder", pagedListHolder);
            pagedListHolder.setSource(course.getLessons());
            pagedListHolder.setPage(0);
            pagedListHolder.setPageSize(2);
        } else {
            PagedListHolder<Lesson> pagedListHolder1 = ((PagedListHolder<Lesson>) model.getAttribute("pagedListHolder"));
            assert pagedListHolder1 != null;
            pagedListHolder1.setPage(pageNum);
            pagedListHolder1.setPageSize(2);
        }

        Course courseFromSession = ((Course) model.getAttribute("course"));
        PagedListHolder<Lesson> pagedListHolderFromSession = ((PagedListHolder<Lesson>) model.getAttribute("pagedListHolder"));

        assert courseFromSession != null;
        PageDTO pageDTO = getPageDTO(courseFromSession);

        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("course", courseFromSession);
        model.addAttribute("pagedListHolder", pagedListHolderFromSession);
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




