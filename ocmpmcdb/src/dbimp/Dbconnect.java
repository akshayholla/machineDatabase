package dbimp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dbconnect
 */
@WebServlet("/Dbconnect")
public class Dbconnect extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	ResultSet rs;
	public static int userLevel = 1;
	public static int entries = -1;
	private static Dbconnect connector_ = null;
	public String serial,hno, hname, ipaddr, rack, sysd, osver, ocver, cowner, remarks;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public static Dbconnect getInstance() throws Exception {
		if (connector_ == null) {
			connector_ = new Dbconnect();
		}
		return connector_;
	}

	public Dbconnect() {
		reconnect();
	}

	public void reconnect() {
		try {
			Class.forName("org.hsqldb.jdbc.JDBCDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace(System.out);
		}
		try {
			con = DriverManager.getConnection("jdbc:hsqldb:mydatabase2", "SA",
					"");
			con.createStatement()
					.executeUpdate(
							"create table cpedb (serial varchar(30),hno varchar(30),hname varchar(30),ipaddr varchar(30),rack varchar(30),sysd varchar(30),osver varchar(30),ocver varchar(30),cowner varchar(100),remarks varchar(200))");

		} catch (SQLException e) {
			e.printStackTrace(System.out);
			System.out.println("Aku - > table exists!");
		}
	}

	public void enterMsg(String serial,String hno,String hname,String ipaddr,String rack,String sysd,String osver,String ocver,String cowner,String remarks) throws Exception {
		PreparedStatement pst = con
				.prepareStatement("insert into cpedb values(?,?,?,?,?,?,?,?,?,?)");
		pst.clearParameters();
		pst.setString(1, serial);
		pst.setString(2, hno);
		pst.setString(3, hname);
		pst.setString(4, ipaddr);
		pst.setString(5, rack);
		pst.setString(6, sysd);
		pst.setString(7, osver);
		pst.setString(8, ocver);
		pst.setString(9, cowner);
		pst.setString(10, remarks);
		pst.executeUpdate();
		resetRset();

	}

	public void searchEntry(String serial,String hno,String hname,String ipaddr,String rack,String sysd,String osver,String ocver,String cowner,String remarks)
			throws Exception {
		System.out.println("Received request to search =" + serial + " " + hno + " " +hname + " " +ipaddr + " " +rack + " " +sysd + " " +osver + " " +ocver + " " +cowner + " " +remarks + " ");
		String quer = "SELECT * from cpedb";
		if (serial == "" && hno == "" && hname == "" && ipaddr == "" && rack == "" && sysd == "" && osver == "" && ocver == "" && cowner == "" && remarks == "") {
			quer = "SELECT * from cpedb";
		} else {
			quer += " where";
		}

		if (serial != "")
			quer += " serial LIKE '%" + serial + "%'";
		if (hno != "")
			quer += " hno LIKE '%" + hno + "%'";
		if (hname != "")
			quer += " hname LIKE '%" + hname + "%'";
		if (ipaddr != "")
			quer += " ipaddr LIKE '%" + ipaddr + "%'";
		if (rack != "")
			quer += " rack LIKE '%" + rack + "%'";
		if (sysd != "")
			quer += " sysd LIKE '%" + sysd + "%'";
		if (osver != "")
			quer += " osver LIKE '%" + osver + "%'";
		if (ocver != "")
			quer += " ocver LIKE '%" + ocver + "%'";
		if (cowner != "")
			quer += " cowner LIKE '%" + cowner + "%'";
		if (remarks != "")
			quer += " remarks LIKE '%" + remarks + "%'";
		quer += ";";
		System.out.println("query is :" + quer);
		try {
			Statement stmt = con.createStatement();
			ResultSet rs2 = stmt.executeQuery(quer);
			rs = rs2;
		} catch (SQLException e) {
			System.out
					.println("Akshay : Could not Search entry! u gotta check it out");
			e.printStackTrace();
		}
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HOlla at doPost!");
		if (con == null) {
			System.out.println("Reconnect requestd??");
			reconnect();
		}
		

		if (request.getParameterMap().containsKey("update")) {
			if (request.getParameter("update").equals("UpdateDb")) {
				String serial = request.getParameter("serial");
				String hno = request.getParameter("hno");
				String hname = request.getParameter("hname");
				String ipaddr = request.getParameter("ipaddr");
				String rack = request.getParameter("rack");
				String sysd = request.getParameter("sysd");
				String osver = request.getParameter("osver");
				String ocver = request.getParameter("ocver");
				String cowner = request.getParameter("cowner");
				String remarks = request.getParameter("remarks");
				System.out.println("Received request to update");
				try {
					con.createStatement().execute(
							"update cpedb set serial='" + serial + "'," 
									+ "hno='"+ hno + "',"
									+ "hname='"+ hname + "',"
									+ "ipaddr='"+ ipaddr + "',"
									+ "rack='"+ rack + "',"
									+ "sysd='"+ sysd + "',"
									+ "osver='"+ osver + "',"
									+ "ocver='"+ ocver + "',"
									+ "cowner='"+ cowner + "',"
									+ "remarks='" + remarks + "'"
									+ " where serial='" + serial + "'");
				} catch (SQLException e) {
					System.out
							.println("Akshay : Could not update db! u gotta check it out");
					e.printStackTrace();
				}
			}
			response.sendRedirect("index.jsp");
			return;
		}

		if (request.getParameterMap().containsKey("remove")) {
			if (request.getParameter("remove").equals("Delete Entry")) {
				String serial = request.getParameter("serial");
				try {
					con.createStatement()
							.execute(
									"delete from cpedb" + " where serial='"
											+ serial + "'");
				} catch (SQLException e) {
					System.out
							.println("Akshay : Could not delete entry! u gotta check it out");
					e.printStackTrace();
				}
			}
			response.sendRedirect("index.jsp");
			return;
		}

		request.getRequestDispatcher("/viewPage.jsp")
				.forward(request, response);
	}

	public ResultSet getRset() {
		return rs;

	}

	public void resetRset() {
		try {
			Statement stmt = null;
			stmt = con.createStatement();
			String query = "SELECT COUNT(serial) FROM cpedb";
			ResultSet rs = stmt.executeQuery(query);
			// Extact result from ResultSet rs
			while (rs.next()) {
				entries = rs.getInt(1);
				System.out.println("Aku - > entries!");
			}
			// close ResultSet rs
			rs.close();
		} catch (SQLException s) {
			s.printStackTrace();
		}
		try {
			PreparedStatement pst1 = con
					.prepareStatement("select * from cpedb");
			pst1.clearParameters();
			ResultSet rs1 = pst1.executeQuery();
			rs = rs1;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setRset() {
		rs = null;
	}

	public void fulshTable() throws SQLException {
		con.createStatement().executeUpdate("truncate table cpedb");
		resetRset();
	}

	public ResultSet getElementDetails(String serial1) {
		try {
			ResultSet rs2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE).executeQuery(
					"select * from cpedb where serial='" + serial1 + "'");
			System.out.println("Holla : returned search!! ");
			while (rs2.next()) {
				serial = rs2.getString("serial");
				hno = rs2.getString("hno");
				hname = rs2.getString("hname");
				ipaddr = rs2.getString("ipaddr");
				rack = rs2.getString("rack");
				sysd = rs2.getString("sysd");
				osver = rs2.getString("osver");
				ocver = rs2.getString("ocver");
				cowner = rs2.getString("cowner");
				remarks = rs2.getString("remarks");
				System.out.println(" abcd : serial "+ serial);
			}
			rs2.absolute(1);
			return rs2;
		} catch (SQLException s) {
			System.out.println("Holla : caught expection while searching");
			s.printStackTrace();
		}
		System.out.println("Holla : cNULL!!");
		return null;

	}

}

