package com.lms.DAO;

import com.lms.Entity.Lesson;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LessonDAOImpl implements LessonDAO {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public Lesson getLessonByID(Integer id) {

        Session session = sessionFactory.getCurrentSession();
        try {
            return session.createQuery("from Lesson where id=:lessonID", Lesson.class)
                    .setParameter("lessonID", id)
                    .getSingleResult();

        } catch (Exception ex) {
            System.out.println("Lesson not found with id: " + id);
        }
        return null;
    }
}
