/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author asqar
 */
@Entity
@Table(name = "attendance", catalog = "attendancesystem", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Attendance.findAll", query = "SELECT a FROM Attendance a")
    , @NamedQuery(name = "Attendance.findById", query = "SELECT a FROM Attendance a WHERE a.id = :id")
    , @NamedQuery(name = "Attendance.findByStatus", query = "SELECT a FROM Attendance a WHERE a.status = :status")
    , @NamedQuery(name = "Attendance.findByClassId", query = "SELECT a FROM Attendance a WHERE a.classId = :classId")
    , @NamedQuery(name = "Attendance.classAtt", query = "SELECT a FROM Attendance a WHERE a.classId = :classId AND a.date = :date")
    , @NamedQuery(name = "Attendance.clean", query = "DELETE FROM Attendance a WHERE a.classId = :classId AND a.date = :date")
    , @NamedQuery(name = "Attendance.classAttPresent", query = "SELECT a FROM Attendance a WHERE a.classId = :classId AND a.date = :date AND a.status = 'Present'")
    , @NamedQuery(name = "Attendance.findByStudentId", query = "SELECT a FROM Attendance a WHERE a.studentId = :studentId")
    , @NamedQuery(name = "Attendance.groupByDate", query = "SELECT a FROM Attendance a GROUP BY a.date, a.classId")
    , @NamedQuery(name = "Attendance.presentsByStdAndCls", query = "SELECT a FROM Attendance a WHERE a.studentId = :studentId AND a.classId = :classId AND a.status = 'Present'")
    , @NamedQuery(name = "Attendance.totalByStdAndCls", query = "SELECT a FROM Attendance a WHERE a.studentId = :studentId AND a.classId = :classId")
    , @NamedQuery(name = "Attendance.findByDate", query = "SELECT a FROM Attendance a WHERE a.date = :date")})
public class Attendance implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "status")
    private String status;
    @Basic(optional = false)
    @NotNull
    @Column(name = "class_id")
    private int classId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "student_id")
    private int studentId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "date")
    private String date;

    public Attendance() {
    }

    public Attendance(Integer id) {
        this.id = id;
    }

    public Attendance(Integer id, String status, int classId, int studentId, String date) {
        this.id = id;
        this.status = status;
        this.classId = classId;
        this.studentId = studentId;
        this.date = date;
    }
    
    public Attendance(String status, int classId, int studentId, String date) {
        this.status = status;
        this.classId = classId;
        this.studentId = studentId;
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Attendance)) {
            return false;
        }
        Attendance other = (Attendance) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Attendance[ id=" + id + " ]";
    }
    
}
