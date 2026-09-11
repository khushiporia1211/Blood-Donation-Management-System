package com.bdms.model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="donor")
public class Donor {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="donor_id")
	private Long id;
	
	@NotBlank(message = "Name is required")
	@Column(name="name",nullable=false,length=100)
	private String name;
	
	@NotNull(message = "Age is required")
	@Min(value = 18, message="Donor must be at least 18 years old")
	@Max(value = 65,message="Donor must be under 65 years old")
	@Column(name="age",nullable=false,length=10)
	private Integer age;
	
	@NotBlank(message="Gender is required")
	@Column(name="gender",nullable=false,length=10)
	private String gender;
	
	@NotBlank(message = "Blood group is required")
	@Column(name="blood_group",nullable=false,length=5)
	private String bloodGroup;
	
	@NotBlank(message="Contact number is required")
	@Pattern(regexp = "^[0-9]{10}$",message="Contact must be 10 digits")
	@Column(name="contact_number",nullable=false,length=15)
	private String contactNumber;
	
	
	@Email(message="Enter a valid email address")
	@Column(name="email",length=100)
	private String email;
	
	@NotBlank(message="Address is required")
	@Column(name="address",nullable=false,length=255)
	private String address;
	
	@Temporal(TemporalType.DATE)
	@Column(name="lasr_donation_date")
	private Date lastDonationDate;
	
	
	@Column(name="registered_on")
	@Temporal(TemporalType.TIMESTAMP)
	private Date registeredOn;


	public Donor() {
		super();
		
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getAge() {
		return age;
	}


	public void setAge(Integer age) {
		this.age = age;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBloodGroup() {
		return bloodGroup;
	}


	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}


	public String getContactNumber() {
		return contactNumber;
	}


	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
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


	


	public Date getLastDonationDate() {
		return lastDonationDate;
	}


	public void setLastDonationDate(Date lastDonationDate) {
		this.lastDonationDate = lastDonationDate;
	}


	public Date getRegisteredOn() {
		return registeredOn;
	}


	public void setRegisteredOn(Date registeredOn) {
		this.registeredOn = registeredOn;
	}
	
	public boolean isEligibleToDonate() {
		if(lastDonationDate==null) {
			return true;
		}
		long msSinceLastDonation = new Date().getTime()-lastDonationDate.getTime();
		long daysSinceLastDonation = msSinceLastDonation/(1000L * 60 *60*24);
		return daysSinceLastDonation >=90;
	}


	@Override
	public String toString() {
		return "Donor [id=" + id + ", name=" + name + ", age=" + age + ", gender=" + gender + ", bloodGroup="
				+ bloodGroup + ", contactNumber=" + contactNumber + ", email=" + email + ", address=" + address
				+ ", lastDonationDate=" + lastDonationDate + ", registeredOn=" + registeredOn + "]";
	}
	
	
}
