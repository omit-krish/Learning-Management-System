package com.lms.controller;

import com.lms.Entity.Course;
import com.lms.Entity.Lesson;
import com.lms.service.CourseService;
import com.lms.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LessonController {

    @Autowired
    private LessonService lessonService;

    @Autowired
    private CourseService courseService;

    @GetMapping("/openLesson")
    public String openLessonPage(@RequestParam("lessonId") Integer lessonId, Model model) {

        Lesson lesson = lessonService.getLessonByID(lessonId);
        model.addAttribute("lesson", lesson);
        return "lesson";
    }


//    addLesson

    @GetMapping("/addLesson")
    public String addLesson(@RequestParam("courseId") int courseId,
                            @RequestParam(name = "lessonId", required = false) Integer lessonId,
                            Model model) {

        Course course = courseService.getCourseByID(courseId);
        Lesson lesson;

        if (lessonId != null) {
            lesson = lessonService.getLessonByID(lessonId); // editing existing lesson
        } else {
            lesson = new Lesson(); // creating new lesson
        }

        lesson.setCourse(course);
        model.addAttribute("lesson", lesson); // ✅ bind to form

        return "addLesson"; // JSP page
    }

    //    save/lesson
    @PostMapping("save/lesson")
    public String saveLesson(Lesson lesson) {

        System.out.println("lesson: " + lesson);

        lessonService.saveLesson(lesson);

        return "redirect:/viewCourse?courseID=" + lesson.getCourse().getId();


    }

}

