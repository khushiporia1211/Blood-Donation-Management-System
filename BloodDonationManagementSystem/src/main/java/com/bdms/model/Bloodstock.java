package com.bdms.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class Bloodstock {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="stock_id")
	private Long id;
	
	@NotBlank(message = "blood group is required")
	@Column(name="blood_group", nullable=false, length=5,unique = true)
	private String bloodGroup;
	
	
	@NotNull(message = "units available is required")
	@Min(value=0,message="Units can not be negative")
	@Column(name="units_available")
	private Integer unitsAvailable;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated")
	private Date lastUpdated;


	public Bloodstock() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Bloodstock(Long id, @NotBlank(message = "blood group is required") String bloodGroup,
			@NotNull(message = "units available is required") @Min(value = 0, message = "Units can not be negative") Integer unitsAvailable,
			Date lastUpdated) {
		super();
		this.id = id;
		this.bloodGroup = bloodGroup;
		this.unitsAvailable = unitsAvailable;
		this.lastUpdated = lastUpdated;
	}
	public Bloodstock(String bloodGroup, Integer unitsAvailable) {
        this.bloodGroup = bloodGroup;
        this.unitsAvailable = unitsAvailable;
    }


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getBloodGroup() {
		return bloodGroup;
	}


	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}


	public Integer getUnitsAvailable() {
		return unitsAvailable;
	}


	public void setUnitsAvailable(Integer unitsAvailable) {
		this.unitsAvailable = unitsAvailable;
	}


	public Date getLastUpdated() {
		return lastUpdated;
	}


	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	
	
	public boolean isLowStock() {
        return unitsAvailable != null && unitsAvailable < 5;
    }


	@Override
	public String toString() {
		return "Bloodstock [id=" + id + ", bloodGroup=" + bloodGroup + ", unitsAvailable=" + unitsAvailable
				+ ", lastUpdated=" + lastUpdated + "]";
	}
	
	

}
