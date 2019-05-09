/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import java.util.List;
import javax.ejb.Local;
import model.Lecturers;

/**
 *
 * @author asqar
 */
@Local
public interface LecturersFacadeLocal {

    void create(Lecturers lecturers);

    void edit(Lecturers lecturers);

    void remove(Lecturers lecturers);

    Lecturers find(Object id);

    List<Lecturers> findAll();

    List<Lecturers> findRange(int[] range);

    int count();
    
    int login(String email, String passwors);
}
