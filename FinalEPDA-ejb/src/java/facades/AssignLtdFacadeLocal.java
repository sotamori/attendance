/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import java.util.List;
import javax.ejb.Local;
import model.AssignLtd;

/**
 *
 * @author asqar
 */
@Local
public interface AssignLtdFacadeLocal {

    void create(AssignLtd assignLtd);

    void edit(AssignLtd assignLtd);

    void remove(AssignLtd assignLtd);

    AssignLtd find(Object id);

    List<AssignLtd> findAll();

    List<AssignLtd> findRange(int[] range);

    int count();
    
    boolean isLATD(int lecturer_id, int department_id);
    
    int getByLecturerId(int id);
    
    List<AssignLtd> getByDepartment(int id);
}
