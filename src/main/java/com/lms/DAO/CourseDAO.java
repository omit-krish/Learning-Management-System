package com.lms.DAO;

import com.lms.Entity.Course;

public interface CourseDAO {


    Course getCourseByID(Integer id);

    Integer addCourse(Course course);

}
