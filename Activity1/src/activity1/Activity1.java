package activity1;

import java.sql.*;
import java.util.Scanner;
import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Activity1 {

    private static Connection con;
    private static Statement meth;
    private static ResultSet rs;
    private static PreparedStatement stm;

    public static void main(String[] args) throws Exception{
        Connect("library", "root", "");
        String query = "select borrname, book_title, borr_date from book join logs using (bookid) join borrower using (borrid)";
        rs = meth.executeQuery(query);
        rs.beforeFirst();
        System.out.printf("%-25s %-25s %1s \n", "Borrower Name", "Book", "Date Borrowed");
        System.out.println("-------------------------------------------------------------------------");
        while(rs.next()) {
            String name = rs.getString("borrname");
            String bookTitle = rs.getString("book_title");
            String borrDate = rs.getString("borr_date");
            System.out.printf("%-25s %-25s %1s \n", name, bookTitle, borrDate);

        }
    }

    private static void Connect(String database, String user, String passwd) throws Exception{
        String connect = "jdbc:mysql://localhost:3306/library" + database + "?user=" + user + "&password=" + passwd;
        con = DriverManager.getConnection(connect);
        meth = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    }


}
