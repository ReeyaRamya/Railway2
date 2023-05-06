package dto;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.Data;

@Entity
@Data
public class User {
	@Id
	//when v use normally generatedvalue--- it wil start by default one
	//when v use SequenceGenerator--- we can decide from which number it should start---  generator , name and sequenceName value should be same like x
	
	@GeneratedValue(generator="x")
	@SequenceGenerator(name="x", sequenceName="x", initialValue=1214561, allocationSize=1)
	int id;
	String firstname;
	String lastname;
	String email;
	long mobile;
	String gender;
	String password;
	Date dob;
	int age;
	double wallet;
	
}
