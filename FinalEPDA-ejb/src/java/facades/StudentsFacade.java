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
import model.Students;

/**
 *
 * @author asqar
 */
@Stateless
public class StudentsFacade extends AbstractFacade<Students> implements StudentsFacadeLocal {

    @PersistenceContext(unitName = "FinalEPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StudentsFacade() {
        super(Students.class);
    }

    @Override
    public int login(String email, String password){
        List<Students> list = em.createNamedQuery("Students.login")
                .setParameter("email", email)
                .setParameter("password", password).getResultList();
        
        if(list.isEmpty()) return 0;
        else return list.get(0).getId();
    }
    
}
