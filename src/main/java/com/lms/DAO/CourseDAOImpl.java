package com.lms.DAO;

import com.lms.Entity.Course;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CourseDAOImpl implements CourseDAO {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public Course getCourseByID(Integer id) {

        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Course where id=:courseID", Course.class)
                .setParameter("courseID", id)
                .getSingleResult();

    }

    @Override
    public Integer addCourse(Course course) {

        Session session = sessionFactory.getCurrentSession();
        session.persist(course);

        return course.getId();
    }
}
