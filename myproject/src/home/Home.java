package home;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Home {
	public static String s = new String();
	static Connection getConnection() {
		String dbURL = "jdbc:postgresql://localhost:5432/cs387";
		String dbUser = "dbuser1";
		String dbPass = "123456";
		Connection connection=null;
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
		} catch(ClassNotFoundException cnfe){
			System.out.println("JDBC Driver not found");
		} catch(SQLException sqle){
			System.out.println("Error in getting connetcion from the database");
		}

		return connection;
	}

	static void closeConnection(Connection connection) {
		try{
			connection.close();
		} catch(SQLException sqle) {
			System.out.println("Error in close database connetcion");
		}
	}

	public static List<String> getLocalities(){

		List<String> localitiesList = new ArrayList<String>();

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select distinct locality from locality order by locality asc");
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				localitiesList.add(rs.getString(1));
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting localities  in function getlocalities");
		} finally{
			closeConnection(connection);
		}


		return localitiesList;

	}
	
	public static List<String> getRestaurants(){

		List<String> RestaurantsList = new ArrayList<String>();

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select distinct restaurant_name from restaurant ");
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				RestaurantsList.add(rs.getString(1));
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting localities  in function getlocalities");
		} finally{
			closeConnection(connection);
		}


		return RestaurantsList;

	}
	
	public static List<String> getItems(){

		List<String> itemsList = new ArrayList<String>();

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select distinct item from menu order by item asc");
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				itemsList.add(rs.getString(1));
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting localities  in function getlocalities");
		} finally{
			closeConnection(connection);
		}


		return itemsList;

	}
	
	public static String get_orders() {
		
		String out = new String("");
				
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from orders");
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				out = out.concat("<tr>");
				out = out.concat("<td>");
				out = out.concat(Integer.toString(rs.getInt(1)));
				out = out.concat("</td>");
				out = out.concat("<td>");
				out = out.concat(rs.getString(2));
				out = out.concat("</td>");
				out = out.concat("<td>");
				out = out.concat(rs.getString(3));
				out = out.concat("</td>");
				out = out.concat("<td>");
				out = out.concat(rs.getString(4));
				out = out.concat("</td>");
				out = out.concat("<td>");
				out = out.concat(rs.getString(5));
				out = out.concat("</td>");
				out = out.concat("<td>");
				out = out.concat(Integer.toString(rs.getInt(6)));
				out = out.concat("</td>");
				out = out.concat("<td>");
				out = out.concat(Integer.toString(rs.getInt(7)));
				out = out.concat("<td>");
				out = out.concat("</tr>");
				
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting localities  in function getlocalities");
		} finally{
			closeConnection(connection);
		}
		
		System.out.println("-----------"+out+"-------------");

		return out;

	}
	
	
	public static void add_into_orders(int ph_num,String res_id,String address,int tot_cost,String tot_order,String usr_name) {
		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into orders (usr_name,restaurant_id,delivery_address,total_order,phone_num,total_cost) values (?,?,?,?,?,?)");
			pstmt.setString(1, usr_name);
			pstmt.setString(2, res_id);
			pstmt.setString(3, address);
			pstmt.setString(4, tot_order);
			pstmt.setInt(5, ph_num);
			pstmt.setInt(6, tot_cost);
			int rs= pstmt.executeUpdate();

		} catch(SQLException sqle){
			System.out.println("SQL exception when adding into orders in function add_into_orders");
		} finally{
			closeConnection(connection);
		}
	}
	
	public static List<RestaurantDetails> search_by_item(String s){
		
		List<String> restId = new ArrayList<String>();
		List<RestaurantDetails> detailList = new ArrayList<>();
		
		Connection connection=null;
		try{
			connection=getConnection();
			PreparedStatement pstmt1= connection.prepareStatement("select restaurant_id from menu where item = ?");
			
			pstmt1.setString(1, s);
			ResultSet rs1= pstmt1.executeQuery();

			while (rs1.next()){
				restId.add(rs1.getString(1));
			}

			for(int i=0;i<restId.size();i++){

				String id = restId.get(i);
				
				RestaurantDetails obj = new RestaurantDetails();
				
				obj.setRestaurantId(id);
				
				PreparedStatement pstmt2= connection.prepareStatement("select restaurant_name from restaurant where restaurant_id=?");
				pstmt2.setString(1, id);
				ResultSet rs2= pstmt2.executeQuery();

				while (rs2.next()){
					
					obj.setRestaurantName(rs2.getString(1));
				//	System.out.println("s1"+rs2.getString(1));
				}
				PreparedStatement pstmt3= connection.prepareStatement("select rating from restaurant where restaurant_id=?");
				pstmt3.setString(1, id);
				ResultSet rs3= pstmt3.executeQuery();

				while (rs3.next()){
					obj.setRating(rs3.getString(1));
				//	System.out.println("s2"+obj.getRating());

				}

				PreparedStatement pstmt4= connection.prepareStatement("select location from restaurant where restaurant_id=?");
				pstmt4.setString(1, id);
				ResultSet rs4= pstmt4.executeQuery();

				while (rs4.next()){
					obj.setLocation(rs4.getString(1));
				//	System.out.println("s3"+obj.getLocation());

				}

				PreparedStatement pstmt5= connection.prepareStatement("select count(restaurant_id) from reviews where restaurant_id=?");
				pstmt5.setString(1, id);
				ResultSet rs5= pstmt5.executeQuery();

				while (rs5.next()){
					obj.setVotes(rs5.getString(1));
				}
				
				
				
				//System.out.println(obj);
				detailList.add(obj);
				
			}
			
			//System.out.println(detailList);

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function getRestaurants");
		} finally{
			closeConnection(connection);
		}
		return detailList;


		
	}
	
	
	public static List<String> getMenu(String id){

		List<String> MenuList = new ArrayList<String>();

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select * from menu where restaurant_id = ?");
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				int cost = rs.getInt(3);
				String temp = Integer.toString(cost);
				MenuList.add(rs.getString(2) + "   Rs "+temp+" /-");
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting aasas in function getlocalities");
		} finally{
			closeConnection(connection);
		}


		return MenuList;
		

	}
	
	
	
	public static String getlocality(String id){
	

		String locality = "";

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select locality from locality where restaurant_id=?");
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				locality = rs.getString(1);
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting locality in function getlocality");
		} finally{
			closeConnection(connection);
		}


		return locality;

	}
	public static String getUSERID(String id){
		
		System.out.println("hi");

		String locality = "";

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select id from locality where restaurant_id=?");
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				locality = rs.getString(1);
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting locality in function getlocality");
		} finally{
			closeConnection(connection);
		}


		return locality;

	}
	
public static void del_res(String id){
		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("delete from restaurant where restaurant_name = ?");
			pstmt.setString(1, id);
			int  rs= pstmt.executeUpdate();
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting locality in function getlocality");
		} finally{
			closeConnection(connection);
		}

	}
	
	
public static void password(String a,String b){

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("update account set password1 = ? where user_id = ? ");
			pstmt.setString(1, b);
			pstmt.setString(2, a);
			int rs= pstmt.executeUpdate();
		

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting locality in function getlocality");
		} finally{
			closeConnection(connection);
		}

	}

	

	public static void addRestaurantDetails(String id,String name,String location,String menuLink,String phone,String cost){

		Connection connection=null;


		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into restaurant values(?,?,?,?,'0',?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, location);
			pstmt.setString(4, menuLink);
			pstmt.setString(5, phone);
			pstmt.setInt(6, Integer.parseInt(cost));
			int rs= pstmt.executeUpdate();
			/*	while (rs.next()){

			}*/

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant  in function addRestaurantDetails");
		} finally{
			closeConnection(connection);
		}

		return;
	}


	public static void addRestaurant(String id,String locality,String s){

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into locality values(?,?,?)");
			pstmt.setString(1, locality);
			pstmt.setString(2, id);
			pstmt.setString(3,Home.s);

			int rs= pstmt.executeUpdate();
			/*	while (rs.next()){

			}*/

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting locality in function addRestaurant");
		} finally{
			closeConnection(connection);
		}

		return;
	}
	

	public static List<RestaurantDetails> getRestaurants(String locality){

		List<String> restId = new ArrayList<>();

		List<RestaurantDetails> detailList = new ArrayList<>();


		Connection connection=null;
		try{
			connection=getConnection();
			PreparedStatement pstmt1= connection.prepareStatement("select restaurant_id from locality where locality=?");
			
			pstmt1.setString(1, locality);
			ResultSet rs1= pstmt1.executeQuery();

			while (rs1.next()){
				restId.add(rs1.getString(1));
			}

			for(int i=0;i<restId.size();i++){

				String id = restId.get(i);
				
				RestaurantDetails obj = new RestaurantDetails();
				
				obj.setRestaurantId(id);
				
				PreparedStatement pstmt2= connection.prepareStatement("select restaurant_name from restaurant where restaurant_id=?");
				pstmt2.setString(1, id);
				ResultSet rs2= pstmt2.executeQuery();

				while (rs2.next()){
					
					obj.setRestaurantName(rs2.getString(1));
				//	System.out.println("s1"+rs2.getString(1));
				}
				PreparedStatement pstmt3= connection.prepareStatement("select rating from restaurant where restaurant_id=?");
				pstmt3.setString(1, id);
				ResultSet rs3= pstmt3.executeQuery();

				while (rs3.next()){
					obj.setRating(rs3.getString(1));
				//	System.out.println("s2"+obj.getRating());

				}

				PreparedStatement pstmt4= connection.prepareStatement("select location from restaurant where restaurant_id=?");
				pstmt4.setString(1, id);
				ResultSet rs4= pstmt4.executeQuery();

				while (rs4.next()){
					obj.setLocation(rs4.getString(1));
				//	System.out.println("s3"+obj.getLocation());

				}

				PreparedStatement pstmt5= connection.prepareStatement("select count(restaurant_id) from reviews where restaurant_id=?");
				pstmt5.setString(1, id);
				ResultSet rs5= pstmt5.executeQuery();

				while (rs5.next()){
					obj.setVotes(rs5.getString(1));
				}
				
				
				
				//System.out.println(obj);
				detailList.add(obj);
				
			}
			
			//System.out.println(detailList);

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function getRestaurants");
		} finally{
			closeConnection(connection);
		}
		return detailList;

	}
	
	public static RestaurantDetails getAllDetails(String id){
		RestaurantDetails obj = new RestaurantDetails();

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select restaurant_name,location,menu,rating,phone_no,cost from restaurant where restaurant_id=?");
			pstmt.setString(1, id);
			ResultSet rs1= pstmt.executeQuery();

			while (rs1.next()){
				obj.setRestaurantName(rs1.getString(1));
				obj.setLocation(rs1.getString(2));
				obj.setMenu(rs1.getString(3));
				obj.setRating(rs1.getString(4));
				obj.setPhone(rs1.getString(5));
				obj.setCost(rs1.getString(6));
				
			}
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list   in function getAllDetails");
		} finally{
			closeConnection(connection);
		}
		return obj;
		
		
		
	}
	
	public static void addReviews(int rating,String review,String userId,String restaurantId)
	{
		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into reviews values(?,?,?,?)");
			pstmt.setString(1, userId);
			pstmt.setString(2, restaurantId);
			pstmt.setString(3, review);
			pstmt.setInt(4, rating);

			int rs1= pstmt.executeUpdate();

			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list   in function addReviews");
			System.out.println(sqle.getMessage());
		} finally{
			closeConnection(connection);
		}
		
	}
	
public static void addAccount(String id,String password){
		
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into account values(?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			//System.out.println(id + " " + password );
			
			pstmt.executeUpdate();
			
		
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting course1 list");
		} finally{
			closeConnection(connection);
		}
		
		return;
	}

public static int checkPassword(String id,String password){
		int res=0;
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select password1 from account where user_id=?");
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			//System.out.println(id + " " + password );
			while (rs.next()){
			
				String s = rs.getString(1);
				//System.out.println("s= "+s);

				
				if(s.equals(password))
				{	res=1;
				//System.out.println(res);
				}
			}
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting top courses list");
		} finally{
			closeConnection(connection);
		}
		
		return res;
	}

public static int checkPasswordadmin(String id,String password){
	int res=0;
	
	
	
	String s = "admin";
	

			
	if(s.equals(password) && s.equals(id)){	res=1;}
		
		
	
	
	return res;
}

	
}
