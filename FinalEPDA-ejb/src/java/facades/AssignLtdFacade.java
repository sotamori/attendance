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
import model.AssignLtd;

/**
 *
 * @author asqar
 */
@Stateless
public class AssignLtdFacade extends AbstractFacade<AssignLtd> implements AssignLtdFacadeLocal {

    @PersistenceContext(unitName = "FinalEPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AssignLtdFacade() {
        super(AssignLtd.class);
    }

    @Override
    public boolean isLATD(int lecturer_id, int department_id) {
        Query query = em.createNamedQuery("AssignLtd.isLATD").setParameter("lecturerId", lecturer_id).setParameter("departmentId", department_id);
        List<AssignLtd> list = query.getResultList();
        if(list.isEmpty()) return false;
        else return true;
    }

    @Override
    public int getByLecturerId(int id) {
        Query query = em.createNamedQuery("AssignLtd.findByLecturerId").setParameter("lecturerId", id);
        List<AssignLtd> list = query.getResultList();
        if(list.isEmpty()) return 0;
        else return list.get(0).getId();
    }

    @Override
    public List<AssignLtd> getByDepartment(int id) {
        Query query = em.createNamedQuery("AssignLtd.findByDepartmentId").setParameter("departmentId", id);
        List<AssignLtd> list = query.getResultList();
        return list;
    }
    
}
