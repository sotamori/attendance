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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author asqar
 */
@Entity
@Table(name = "lecturers", catalog = "attendancesystem", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Lecturers.findAll", query = "SELECT l FROM Lecturers l")
    , @NamedQuery(name = "Lecturers.findById", query = "SELECT l FROM Lecturers l WHERE l.id = :id")
    , @NamedQuery(name = "Lecturers.findByName", query = "SELECT l FROM Lecturers l WHERE l.name = :name")
    , @NamedQuery(name = "Lecturers.findByGender", query = "SELECT l FROM Lecturers l WHERE l.gender = :gender")
    , @NamedQuery(name = "Lecturers.findByPhone", query = "SELECT l FROM Lecturers l WHERE l.phone = :phone")
    , @NamedQuery(name = "Lecturers.findByIc", query = "SELECT l FROM Lecturers l WHERE l.ic = :ic")
    , @NamedQuery(name = "Lecturers.findByEmail", query = "SELECT l FROM Lecturers l WHERE l.email = :email")
    , @NamedQuery(name = "Lecturers.login", query = "SELECT l FROM Lecturers l WHERE l.email = :email AND l.ic = :password")
    , @NamedQuery(name = "Lecturers.findByAddress", query = "SELECT l FROM Lecturers l WHERE l.address = :address")})
public class Lecturers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "gender")
    private String gender;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "phone")
    private String phone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "IC")
    private String ic;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "address")
    private String address;

    public Lecturers() {
    }

    public Lecturers(Integer id) {
        this.id = id;
    }

    public Lecturers(Integer id, String name, String phone, String ic, String email, String address) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.ic = ic;
        this.email = email;
        this.address = address;
    }
    
    public Lecturers(String name, String gender, String phone, String ic, String email, String address) {
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.ic = ic;
        this.email = email;
        this.address = address;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIc() {
        return ic;
    }

    public void setIc(String ic) {
        this.ic = ic;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
        if (!(object instanceof Lecturers)) {
            return false;
        }
        Lecturers other = (Lecturers) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Lecturers[ id=" + id + " ]";
    }
    
}
