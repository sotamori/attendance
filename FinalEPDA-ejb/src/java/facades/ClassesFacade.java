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
import model.Classes;

/**
 *
 * @author asqar
 */
@Stateless
public class ClassesFacade extends AbstractFacade<Classes> implements ClassesFacadeLocal {

    @PersistenceContext(unitName = "FinalEPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ClassesFacade() {
        super(Classes.class);
    }

    @Override
    public List<Classes> byLecturerId(int id) {
        Query query = em.createNamedQuery("Classes.findByLecturerId").setParameter("lecturerId", id);
        List<Classes> list = query.getResultList();
        return list;
    }

    @Override
    public List<Classes> byDepId(int id) {
        Query query = em.createNamedQuery("Classes.findByDepartmentId").setParameter("departmentId", id);
        List<Classes> list = query.getResultList();
        return list;
    }    
}
