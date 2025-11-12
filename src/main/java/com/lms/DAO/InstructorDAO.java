package com.lms.DAO;

import com.lms.Entity.Instructor;

import java.util.List;

public interface InstructorDAO {
    public List<Instructor> getInstructors();

    void addInstructor(Instructor instructor);

    Instructor findInstructorById(int id);

    void deleteById(int id);
}

