/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import java.util.List;
import javax.ejb.Local;
import model.Department;

/**
 *
 * @author asqar
 */
@Local
public interface DepartmentFacadeLocal {

    void create(Department department);

    void edit(Department department);

    void remove(Department department);

    Department find(Object id);

    List<Department> findAll();

    List<Department> findRange(int[] range);

    int count();
    
    int isHos(int id);
}
