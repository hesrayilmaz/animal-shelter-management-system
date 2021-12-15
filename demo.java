package cmpe232_group65;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class demo {

	private static Connection connect = null;
    private static Statement statement= null;
    private static ResultSet resultSet=null;

    final private static String host="jdbc:postgresql://10.98.98.61:5432/group65";
    final private static String user= "group65";
    final private static String password="";
	
    
    public static void main(String[] args) throws SQLException {

    	Scanner input=new Scanner(System.in);
    	
    	
		try {
			connect = DriverManager.getConnection(host,user,password);
			System.out.println("Java JDBC PostgreSQL Example");
			System.out.println("Connected to PostgreSQL database!");
		} catch(SQLException e) {
			System.out.println("Connection failure.");
			e.printStackTrace();
		} 
		
		
		try {
			statement=connect.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		int userInput;
		String[] user;
		
		System.out.println("Choose one of them: (1,2,3,4,5,6,7)");
		System.out.println("1-List the information of animals");
		System.out.println("2-Insert an animal");
		System.out.println("3-List the information of employees");
		System.out.println("4-Update phone number of an employee");
		System.out.println("5-List the information of receive table");
		System.out.println("6-Delete from receive table");
		System.out.println("7-Exit from the program");
			
		userInput=input.nextInt();
		input.nextLine();
		
		while(userInput!=7) {
			
			switch(userInput) {
			
			case 1:
				resultSet=statement.executeQuery("select * from \"Animal\"; ");
				writeResultSet(resultSet);
				System.out.println();
				System.out.println("Successfully executed.");
				System.out.println();
				break;
			
			case 2: 
				
				System.out.println("insert in form: id, breed, species, birthdate, height, weight, sex, date ");
				user=input.nextLine().split(",");
				
				statement.executeUpdate("insert into \"Animal\" values( " +user[0]+ " , '"+user[1]+"' , '"+user[2]+"' , "
					+ " date '"+user[3]+"', "+user[4]+", "+user[5]+", '"+user[6]+"', date '"+user[7]+"')");
				System.out.println();
				System.out.println("Successfully executed.");
				System.out.println();
				resultSet=statement.executeQuery("select * from \"Animal\"; ");
				writeResultSet(resultSet);
				break;
			
			case 3:
				resultSet=statement.executeQuery("select * from \"Employee\"; ");
				writeResultSet(resultSet);
				System.out.println();
				System.out.println("Successfully executed.");
				System.out.println();
				break;
				
			case 4:
				
				System.out.println("insert in form: employee id, phone number");
				user=input.nextLine().split(",");
				statement.executeUpdate("update \"Employee\" set phone_number='"+user[1]+"' where id='"+user[0]+"'");
				System.out.println();
				System.out.println("Successfully executed.");
				System.out.println();  
				resultSet=statement.executeQuery("select * from \"Employee\"; ");
				writeResultSet(resultSet);
				break;
				
			case 5:
				resultSet=statement.executeQuery("select * from \"Receive\"; ");
				writeResultSet(resultSet);
				System.out.println();
				System.out.println("Successfully executed.");
				System.out.println();
				break;
				
			case 6:
				System.out.println("insert a shot id");
				userInput=input.nextInt();
				statement.executeUpdate("delete from \"Receive\" where shot_id= '"+userInput+"'");
				System.out.println();
				System.out.println("Successfully executed.");
				System.out.println();
				resultSet=statement.executeQuery("select * from \"Receive\"; ");
				writeResultSet(resultSet);
				break;
				
			case 7:
				close();
				break;
				
			default:
				System.out.println();
				System.out.println("Please enter an appropriate input");
				break;
			}
			
			if(userInput==7)
				break;
			
			System.out.println("Choose one of them: (1,2,3,4,5,6,7)");
		
			userInput=input.nextInt();
			input.nextLine();
		}
			
		System.out.println("Process is finished");

		
		
		
		
		
	}
    private static void close() {
        try {
            if(resultSet!=null) {
                resultSet.close();
            }
            if(statement!=null) {
                statement.close();

            }
            if(connect!=null) {
                connect.close();
            }
        }catch(Exception e) {

            }
 
    }
    private static void writeResultSet(ResultSet resultSet) throws SQLException{
        ResultSetMetaData rsmd= resultSet.getMetaData();
        int columnsNumber=rsmd.getColumnCount();
        for (int i=1; i<=columnsNumber;i++) {
        	System.out.print(rsmd.getColumnName(i));
        	if(i!=columnsNumber) {
        		System.out.print(", ");
        	}
        }
         System.out.println();
         
        while(resultSet.next()) {
            for(int i = 1; i<=columnsNumber;i++) {
                System.out.print(resultSet.getString(i));
                if(i!=columnsNumber) {
            		System.out.print(", ");
            	}
            }
            System.out.println();
        }

    }

    
}

