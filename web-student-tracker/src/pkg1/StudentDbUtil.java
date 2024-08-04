package pkg1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


public class StudentDbUtil {
	
	private static  DataSource dataSource;
	
	public StudentDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	
	public List<Student> getStudents() throws Exception{
		
		List<Student> students = new ArrayList<>();
		
		Connection myConn=null;
		Statement myStmt=null;
		ResultSet myRs=null;
		
		try {
		// get a connection
			myConn = dataSource.getConnection();
			
			
		// create a sql statement
			String sql = "select * from student order by id";
			myStmt = myConn.createStatement();
		
			
		// execute query
			myRs=myStmt.executeQuery(sql);
		
			
		// process result set
			while(myRs.next()) {
				
				//retrieve data from result set row
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				
				//create new student object
				Student tempStudent = new Student(id,firstName, lastName, email);
				
				//add it to list of students
				students.add(tempStudent);
				}
			
		return students;
			
		}
		finally {
			// close JDBC
			close(myRs,myStmt,myConn);
		}
		
	}


	private static void close(ResultSet myRs, Statement myStmt, Connection myConn) {
	    try {
	        if (myRs != null) {
	            myRs.close();
	        }
	        if (myStmt != null) {
	            myStmt.close();
	        }
	        if (myConn != null) {
	            myConn.close();
	        }
	    } catch (Exception exc) {
	        exc.printStackTrace();
	    }
	}



	public void addStudent(Student theStudent) {

			Connection myConn=null;
			PreparedStatement myStmt=null;
		
			try {
				//get db connection
				myConn = dataSource.getConnection();
				
				String sql = "insert into student "
									+" (first_name, last_name,email)"
									+"values(?,?,?)";
				
				myStmt = myConn.prepareStatement(sql);
				
				
				myStmt.setString(1, theStudent.getFirstName());
				myStmt.setString(2, theStudent.getLastName());
				myStmt.setString(3, theStudent.getEmail());
				
				myStmt.execute();


			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				
				close(null, myStmt, myConn);
			}
		
	}


	public static  Student getStudent(String theStudentId) throws Exception{
			
		Student theStudent = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		int studentId;
		
		try {
			//convert student id to int
			studentId = Integer.parseInt(theStudentId);
			
			//get connection to database
			myConn = dataSource.getConnection();
			
			//create sql to get selected student
			String sql = "select * from student where id=?";
			
			//create prepared statement
			myStmt = myConn.prepareStatement(sql);
			
			//set params
			myStmt.setInt(1, studentId);
			
			//execute statement
			myRs = myStmt.executeQuery();
			
			//retrieve data from resultset
			
			if(myRs.next()) {
				
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				
				theStudent = new Student(studentId,firstName,lastName,email);
			}
			else {
				throw new Exception("could not find student id : "+studentId);
			}
			
			
			
			return theStudent;

		}
		finally {
			close(myRs,myStmt,myConn);
		}
		
		
	}


	public void updateStudent(Student theStudent) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		
		try {
			

			//get db connection
			myConn = dataSource.getConnection();
			
			
			// create SQL update statement
			String sql = "update student "+"set first_name=? , last_name=? ,email=?" +"where id=?";
			
			//prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setString(1, theStudent.getFirstName());
			myStmt.setString(2, theStudent.getLastName());
			myStmt.setString(3, theStudent.getEmail());
			myStmt.setInt(4, theStudent.getId());
			
			// execute SQL statement
			myStmt.execute();
			
		}finally {
			close(null, myStmt, myConn);
		}
		
	}


	public void deleteStudent(String theStudentId) throws SQLException {

		Connection myConn = null;
		PreparedStatement myStmt=null;
		
		try {
			
			int studentId = Integer.parseInt(theStudentId);

			myConn = dataSource.getConnection();
			String sql = " delete from student where id=?";

			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setInt(1, studentId);
			
			myStmt.execute();
		}
		finally {
			close(null, myStmt, myConn);
		}
	}
	
	
	
	
	
}




















