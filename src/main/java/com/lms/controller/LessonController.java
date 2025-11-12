package com.lms.controller;

import com.lms.Entity.Course;
import com.lms.Entity.Lesson;
import com.lms.service.CourseService;
import com.lms.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LessonController {

    @Autowired
    private LessonService lessonService;

    @GetMapping("/openLesson")
    public String openLessonPage(@RequestParam("lessonId") Integer lessonId, Model model) {

        Lesson lesson = lessonService.getLessonByID(lessonId);
        model.addAttribute("lesson", lesson);
        return "lesson";
    }
}
