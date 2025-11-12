package com.lms.service;

import com.lms.DAO.InstructorDAO;
import com.lms.Entity.Instructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class InstructorsServiceImpl implements InstructorService {

    @Autowired
    private InstructorDAO instructorDAO;

    @Transactional
    @Override
    public void addInstructor(Instructor instructor) {
        instructorDAO.addInstructor(instructor);
    }

    @Transactional
    @Override
    public List<Instructor> getInstructors() {

        return instructorDAO.getInstructors();
    }

    @Transactional
    @Override
    public Instructor findInstructorById(int id) {


        return instructorDAO.findInstructorById(id);
    }

    @Transactional
    @Override
    public void deleteById(int id) {
        instructorDAO.deleteById(id);
    }
}
