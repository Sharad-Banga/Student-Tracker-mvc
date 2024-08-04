package pkg1;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.sql.DataSource;


@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    private StudentDbUtil studentDbUtil;

    @Resource(name="jdbc/web_student_tracker")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            studentDbUtil = new StudentDbUtil(dataSource);
        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        try {
        	//read the command from add student
        	String theCommand= request.getParameter("command");
        	
        	//if command is missing, then default to listing students
        	if(theCommand==null) {
        		theCommand="LIST"; 
        	}
        	
        	//route to appropriate method
        	switch(theCommand) {
        	
        	case "LIST":
        		listStudents(request, response);
        		break;
        		
        	case "ADD":
        		addStudent(request,response);
        		break;
        	case "LOAD":
        		loadStudent(request,response);
        		break;
        	case "UPDATE":
        		updateStudent(request,response);
        		break;
        		
        	case "DELETE":
        		deleteStudent(request,response);
        		break;
        		
        	default: 
        		listStudents(request, response);
        	}
        	
            
        } catch (Exception exc) {
            throw new ServletException(exc);
        }
        
        
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
    		//tread the student id from form data
    	
    	String theStudentId  = request.getParameter("studentId");
    	
    	// delete student from database
    	studentDbUtil.deleteStudent(theStudentId);
    	
    	//send them back to "list students " page
    	listStudents(request, response);
    	
    //
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {

    	
    	//read infp from form data
    	int id = Integer.parseInt(request.getParameter("studentId"));
    	String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		
		//create a new student object
		Student theStudent=new Student(id,firstName, lastName, email);
		
		//add the student to he database
		studentDbUtil.updateStudent(theStudent);
		
		//send backl to main page
		listStudents(request, response);
	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
    		
    	//read student id from form data
    	String theStudentId = request.getParameter("studentId");
    	
    	//get student from database (DB util)
    	Student theStudent = StudentDbUtil.getStudent(theStudentId);
    	
    	//place student in request attribute
    	request.setAttribute("THE_STUDENT", theStudent);
    	//send to JSP page : update-student-form.jsp
    	RequestDispatcher dispatcher=request.getRequestDispatcher("/update-student-form.jsp");
    	dispatcher.forward(request, response);
    	
    	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {

    	//read infp from form data
    	String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		
		//create a new student object
		Student theStudent=new Student(firstName, lastName, email);
		
		//add the student to he database
		studentDbUtil.addStudent(theStudent);
		
		//send backl to main page
		listStudents(request, response);
    	
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Student> students = studentDbUtil.getStudents();
        request.setAttribute("STUDENT_LIST", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
        dispatcher.forward(request, response);
    }
}
