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
import model.Department;

/**
 *
 * @author asqar
 */
@Stateless
public class DepartmentFacade extends AbstractFacade<Department> implements DepartmentFacadeLocal {

    @PersistenceContext(unitName = "FinalEPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DepartmentFacade() {
        super(Department.class);
    }

    @Override
    public int isHos(int id){
        List<Department> list = em.createNamedQuery("Department.findByLecturerId")
                .setParameter("lecturerId", id).getResultList();
        
        if(list.isEmpty()) return 0;
        else return list.get(0).getId();
    }
    
}
