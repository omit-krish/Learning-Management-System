package com.lms.service;

import com.lms.DAO.LessonDAO;
import com.lms.Entity.Lesson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LessonServiceImpl implements LessonService {

    @Autowired
    private LessonDAO lessonDAO;

    @Transactional
    @Override
    public Lesson getLessonByID(Integer id) {
        return lessonDAO.getLessonByID(id);
    }

    @Transactional
    @Override
    public void saveLesson(Lesson lesson) {

        lessonDAO.saveLesson(lesson);
    }
}
