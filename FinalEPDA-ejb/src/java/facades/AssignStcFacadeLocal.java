/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import java.util.List;
import javax.ejb.Local;
import model.AssignStc;

/**
 *
 * @author asqar
 */
@Local
public interface AssignStcFacadeLocal {

    void create(AssignStc assignStc);

    void edit(AssignStc assignStc);

    void remove(AssignStc assignStc);

    AssignStc find(Object id);

    List<AssignStc> findAll();

    List<AssignStc> findRange(int[] range);

    int count();
    
    List<AssignStc> byStudentId(int id);
    
    List<AssignStc> byClassId(int id);
    
    int byStudentAndClassId(int student_id, int class_id);
}
