package com.lms.service;

import com.lms.Entity.Instructor;

import java.util.List;

public interface InstructorService {

    void addInstructor(Instructor instructor);

    List<Instructor> getInstructors();


    Instructor findInstructorById(int id);

    void deleteById(int id);
}

