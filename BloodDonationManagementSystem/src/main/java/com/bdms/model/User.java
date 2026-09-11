package com.bdms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "app_user", uniqueConstraints = @UniqueConstraint(columnNames = "username"))
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_id")
	private Long id;

	@NotBlank(message="username is required")
	@Column(name ="username",nullable=false,length=20)
	private String username;

	@NotBlank(message="password is required")
	@Size(min=4,message="password must be at least of 4 characters")
	@Column(name="password" ,nullable=false, length=100)
	private String password;

	@NotBlank(message = "Role is required")
	@Column(name="role",nullable = false,length= 20)
	private String role;

	@Column(name = "donor_id")
	private Long donorId;

	public User() {
		super();

	}

	public User(@NotBlank(message = "username is required") String username,
			@NotBlank(message = "password is required") @Size(min = 4, message = "password must be at least of 4 characters") String password,
			@NotBlank(message = "Role is required") String role) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
	}

	public User(@NotBlank(message = "username is required") String username,
			@NotBlank(message = "password is required") @Size(min = 4, message = "password must be at least of 4 characters") String password,
			@NotBlank(message = "Role is required") String role,
			Long donorId) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
		this.donorId = donorId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Long getDonorId() {
		return donorId;
	}

	public void setDonorId(Long donorId) {
		this.donorId = donorId;
	}

	public boolean isAdmin() {
		return "ADMIN".equalsIgnoreCase(role);
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", role=" + role + ", donorId=" + donorId + "]";
	}

}