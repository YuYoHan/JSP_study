package com.koreait.dao;

import com.koreait.dto.UserDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class UserDAO {
    Context context;
    DataSource ds;

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public boolean join(UserDTO newUser) {
        int result = 0;

        try {
            context = new InitialContext(null);
            ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
            conn = ds.getConnection();

            String sql = "insert into test_user values(?,?,?,?,?,?,?,?,?)";

            ps = conn.prepareStatement(sql);
            ps.setString(1, newUser.getUserid());
            ps.setString(2, newUser.getUserpw());
            ps.setString(3, newUser.getUsername());
            ps.setString(4, newUser.getUsergender());
            ps.setString(5, newUser.getZipcode());
            ps.setString(6, newUser.getAddr());
            ps.setString(7, newUser.getAddrdetail());
            ps.setString(8, newUser.getAddretc());

            String[] hobbies = newUser.getUserhobby();  // [게임, 운동, 코딩]
            String hobbyStr = hobbies[0];               // "게임, 운동, 코딩"
            for (int i = 1; i < hobbies.length; i++) {
                hobbyStr += ", " + hobbies[i];
            }
            ps.setString(9, hobbyStr);
            result = ps.executeUpdate();

        } catch (NamingException e) {
            System.out.println("네이밍 오류 : " + e);
        } catch (SQLException se) {
            System.out.println("SQL오류 : " + se);
        }
        return result == 1;
    }

    public boolean checkId(String userid) {

        try {
            context = new InitialContext(null);
            ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
            conn = ds.getConnection();

            String sql = "select * from test_user where uesrid=?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, userid);

            rs = ps.executeQuery();

            return !rs.next();

        } catch (NamingException e) {
            System.out.println("네이밍 오류 : " + e);
        } catch (SQLException se) {
            System.out.println("SQL오류 : " + se);
        }
        return false;
    }
}
