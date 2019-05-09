/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Attendance;

/**
 *
 * @author asqar
 */
@Stateless
public class AttendanceFacade extends AbstractFacade<Attendance> implements AttendanceFacadeLocal {

    @PersistenceContext(unitName = "FinalEPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AttendanceFacade() {
        super(Attendance.class);
    }

    @Override
    public int getPercentageOfStdByCls(int student_id, int class_id) {
        List<Attendance> total = em.createNamedQuery("Attendance.totalByStdAndCls")
                .setParameter("studentId", student_id)
                .setParameter("classId", class_id).getResultList();
        
        List<Attendance> presents = em.createNamedQuery("Attendance.presentsByStdAndCls")
                .setParameter("studentId", student_id)
                .setParameter("classId", class_id).getResultList();
        
        if(total.size()==0) return 0;
        else return (presents.size()*100)/total.size();
    }

    @Override
    public List<Attendance> getClass(int class_id, String date) {
        List<Attendance> list = em.createNamedQuery("Attendance.classAtt")
                .setParameter("classId", class_id)
                .setParameter("date", date).getResultList();
        
        return list;
    }

    @Override
    public List<Attendance> getClassesGroupedByDate() {
        List<Attendance> list = em.createNamedQuery("Attendance.groupByDate").getResultList();
        
        return list;
    }

    @Override
    public List<Attendance> getByDate(String date) {
        List<Attendance> list = em.createNamedQuery("Attendance.findByDate")
                .setParameter("date", date).getResultList();
        
        return list;
    }

    @Override
    public List<Attendance> getClassPresent(int class_id, String date) {
        List<Attendance> list = em.createNamedQuery("Attendance.classAttPresent")
                .setParameter("classId", class_id)
                .setParameter("date", date).getResultList();
        
        return list;
    }

    @Override
    public void clean(int class_id, String date) {
        em.createNamedQuery("Attendance.clean")
                .setParameter("classId", class_id)
                .setParameter("date", date).executeUpdate();
    }

    @Override
    public List<Attendance> getByClass(int class_id) {
        List<Attendance> list = em.createNamedQuery("Attendance.findByClassId")
                .setParameter("classId", class_id).getResultList();
        
        return list;
    }
}
