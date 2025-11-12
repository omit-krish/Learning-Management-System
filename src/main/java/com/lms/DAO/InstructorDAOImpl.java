package com.lms.DAO;

import com.lms.Entity.Instructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class InstructorDAOImpl implements InstructorDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Instructor> getInstructors() {

        Session session = sessionFactory.getCurrentSession();

//        session.getTransaction().begin();

        //HQL Query working here..
        Query<Instructor> query = session.createQuery("from Instructor", Instructor.class);

//        session.getTransaction().commit();
        return query.getResultList();
    }

    @Override
    public void addInstructor(Instructor instructor) {

        Session session = sessionFactory.getCurrentSession();

        session.persist(instructor);
        System.out.println("data stored successfully.....!!!!!!");
    }

    @Override
    public Instructor findInstructorById(int id) {

        Session session = sessionFactory.getCurrentSession();

        Query<Instructor> instructorQuery = session.createQuery("from Instructor s where s.id=:ID ", Instructor.class).setParameter("ID", id);

        List<Instructor> list = instructorQuery.getResultList();
        return list.get(0);
    }

    @Override
    public void deleteById(int id) {

        Session session = sessionFactory.getCurrentSession();

        session.createMutationQuery("delete from Instructor s where s.id=:ID").setParameter("ID", id)
                .executeUpdate();

        System.out.println("instructor got deleted successfully");
    }
}
