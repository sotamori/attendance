/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facades;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;
import model.Attendance;

/**
 *
 * @author asqar
 */
@Local
public interface AttendanceFacadeLocal {

    void create(Attendance attendance);

    void edit(Attendance attendance);

    void remove(Attendance attendance);

    Attendance find(Object id);

    List<Attendance> findAll();

    List<Attendance> findRange(int[] range);

    int count();
    
    int getPercentageOfStdByCls(int student_id, int class_id);
    
    void clean(int class_id, String date);
    
    List<Attendance> getClass(int class_id, String date);
    
    List<Attendance> getClassPresent(int class_id, String date);
    
    List<Attendance> getClassesGroupedByDate();
    
    List<Attendance> getByDate(String date);
    
    List<Attendance> getByClass(int class_id);
}
