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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author asqar
 */
@Entity
@Table(name = "assign_stc", catalog = "attendancesystem", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AssignStc.findAll", query = "SELECT a FROM AssignStc a")
    , @NamedQuery(name = "AssignStc.findById", query = "SELECT a FROM AssignStc a WHERE a.id = :id")
    , @NamedQuery(name = "AssignStc.findByClassId", query = "SELECT a FROM AssignStc a WHERE a.classId = :classId")
    , @NamedQuery(name = "AssignStc.findByStudentAndClassId", query = "SELECT a FROM AssignStc a WHERE a.classId = :classId AND a.studentId = :studentId")
    , @NamedQuery(name = "AssignStc.findByStudentId", query = "SELECT a FROM AssignStc a WHERE a.studentId = :studentId")})
public class AssignStc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "class_id")
    private int classId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "student_id")
    private int studentId;

    public AssignStc() {
    }

    public AssignStc(Integer id) {
        this.id = id;
    }

    public AssignStc(Integer id, int classId, int studentId) {
        this.id = id;
        this.classId = classId;
        this.studentId = studentId;
    }
    
    public AssignStc(int classId, int studentId) {
        this.classId = classId;
        this.studentId = studentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AssignStc)) {
            return false;
        }
        AssignStc other = (AssignStc) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.AssignStc[ id=" + id + " ]";
    }
    
}
