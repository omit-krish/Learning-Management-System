package com.lms.service;

import com.lms.DAO.CourseDAO;
import com.lms.Entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseDAO courseDAO;

    @Transactional
    @Override
    public Course getCourseByID(Integer id) {
        return courseDAO.getCourseByID(id);
    }

    @Transactional
    @Override
    public Integer addCourse(Course course) {

        return courseDAO.addCourse(course);
    }
}
