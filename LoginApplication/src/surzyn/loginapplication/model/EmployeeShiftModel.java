package surzyn.loginapplication.model;

import java.util.Date;

public class EmployeeShiftModel {

	private String employeeName;
	private Date shiftStart;
	private Date shiftEnd;
	
	public Date getShiftStart() {
		return shiftStart;
	}
	public void setShiftStart(Date shiftStart) {
		this.shiftStart = shiftStart;
	}
	public Date getShiftEnd() {
		return shiftEnd;
	}
	public void setShiftEnd(Date shiftEnd) {
		this.shiftEnd = shiftEnd;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	
	
}
