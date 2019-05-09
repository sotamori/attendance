/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.AssignStc;

/**
 *
 * @author asqar
 */
@Stateless
public class AssignStcFacade extends AbstractFacade<AssignStc> implements AssignStcFacadeLocal {

    @PersistenceContext(unitName = "FinalEPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AssignStcFacade() {
        super(AssignStc.class);
    }

    @Override
    public List<AssignStc> byStudentId(int id) {
        Query query = em.createNamedQuery("AssignStc.findByStudentId").setParameter("studentId", id);
        List<AssignStc> list = query.getResultList();
        return list;
    }

    @Override
    public int byStudentAndClassId(int student_id, int class_id) {
        Query query = em.createNamedQuery("AssignStc.findByStudentAndClassId").setParameter("studentId", student_id).setParameter("classId", class_id);
        List<AssignStc> list = query.getResultList();
        if(list.isEmpty()) return 0;
        else return list.get(0).getId();
    }

    @Override
    public List<AssignStc> byClassId(int id) {
        Query query = em.createNamedQuery("AssignStc.findByClassId").setParameter("classId", id);
        List<AssignStc> list = query.getResultList();
        return list;
    }
    
}
