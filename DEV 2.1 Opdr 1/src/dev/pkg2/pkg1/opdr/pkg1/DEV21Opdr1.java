
package dev.pkg2.pkg1.opdr.pkg1;

import java.sql.*;

public class DEV21Opdr1 {
    public static void main(String[] args) {
        try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/DEV 2.1 Opdr 1", "postgres", "steven");
            if(con != null)
                System.out.println("Connected");
            
            Statement st = con.createStatement();
            //String sql = "insert into servers values('202101', 'NA', 'USA')";
            String sql = "update servers set address='0909', name='NA Scrubs', location='Murica' where address='202101'";
            
            st.execute(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }    
}
