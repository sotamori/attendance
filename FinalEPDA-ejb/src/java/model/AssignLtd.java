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
@Table(name = "assign_ltd", catalog = "attendancesystem", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AssignLtd.findAll", query = "SELECT a FROM AssignLtd a")
    , @NamedQuery(name = "AssignLtd.findById", query = "SELECT a FROM AssignLtd a WHERE a.id = :id")
    , @NamedQuery(name = "AssignLtd.findByLecturerId", query = "SELECT a FROM AssignLtd a WHERE a.lecturerId = :lecturerId")
    , @NamedQuery(name = "AssignLtd.isLATD", query = "SELECT a FROM AssignLtd a WHERE a.lecturerId = :lecturerId AND a.departmentId = :departmentId")
    , @NamedQuery(name = "AssignLtd.findByDepartmentId", query = "SELECT a FROM AssignLtd a WHERE a.departmentId = :departmentId")})
public class AssignLtd implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lecturer_id")
    private int lecturerId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "department_id")
    private int departmentId;

    public AssignLtd() {
    }

    public AssignLtd(Integer id) {
        this.id = id;
    }

    public AssignLtd(Integer id, int lecturerId, int departmentId) {
        this.id = id;
        this.lecturerId = lecturerId;
        this.departmentId = departmentId;
    }
    
    public AssignLtd(int lecturerId, int departmentId) {
        this.lecturerId = lecturerId;
        this.departmentId = departmentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getLecturerId() {
        return lecturerId;
    }

    public void setLecturerId(int lecturerId) {
        this.lecturerId = lecturerId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
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
        if (!(object instanceof AssignLtd)) {
            return false;
        }
        AssignLtd other = (AssignLtd) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.AssignLtd[ id=" + id + " ]";
    }
    
}
