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
import model.Lecturers;

/**
 *
 * @author asqar
 */
@Stateless
public class LecturersFacade extends AbstractFacade<Lecturers> implements LecturersFacadeLocal {

    @PersistenceContext(unitName = "FinalEPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LecturersFacade() {
        super(Lecturers.class);
    }

    @Override
    public int login(String email, String password){
        List<Lecturers> list = em.createNamedQuery("Lecturers.login")
                .setParameter("email", email)
                .setParameter("password", password).getResultList();
        
        if(list.isEmpty()) return 0;
        else return list.get(0).getId();
    }
    
}
