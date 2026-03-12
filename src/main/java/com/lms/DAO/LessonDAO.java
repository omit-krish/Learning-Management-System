package com.lms.DAO;

import com.lms.Entity.Lesson;

public interface LessonDAO {


    Lesson getLessonByID(Integer id);

    void saveLesson(Lesson lesson);
}
