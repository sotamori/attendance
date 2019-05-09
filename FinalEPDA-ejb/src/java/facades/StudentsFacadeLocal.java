/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import java.util.List;
import javax.ejb.Local;
import model.Students;

/**
 *
 * @author asqar
 */
@Local
public interface StudentsFacadeLocal {

    void create(Students students);

    void edit(Students students);

    void remove(Students students);

    Students find(Object id);

    List<Students> findAll();

    List<Students> findRange(int[] range);

    int count();
    
    int login(String email, String password);
}
