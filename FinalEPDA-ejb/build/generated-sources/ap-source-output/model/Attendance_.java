package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-25T01:00:29")
@StaticMetamodel(Attendance.class)
public class Attendance_ { 

    public static volatile SingularAttribute<Attendance, Integer> studentId;
    public static volatile SingularAttribute<Attendance, String> date;
    public static volatile SingularAttribute<Attendance, Integer> classId;
    public static volatile SingularAttribute<Attendance, Integer> id;
    public static volatile SingularAttribute<Attendance, String> status;

}