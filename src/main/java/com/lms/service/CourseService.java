package com.lms.service;

import com.lms.Entity.Course;

public interface CourseService {

    Course getCourseByID(Integer id);

    Integer addCourse(Course course);
}
