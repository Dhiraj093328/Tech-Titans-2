package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // Register User
    public static boolean register(User u) 
    {
        String sql = "INSERT INTO users(name,email,contact_no,username,password) VALUES(?,?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getContactNo());
            ps.setString(4, u.getUsername());
            ps.setString(5, u.getPassword());

            return ps.executeUpdate() > 0;

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return false;
    }

    // Login User
    public static User login(String username, String password) 
    {
        User u = null;
        String sql = "SELECT * FROM users WHERE username=? AND password=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setContactNo(rs.getString("contact_no"));
                u.setUsername(rs.getString("username"));
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return u;
     }
        
     //GET USER BY ID
        public static User getUserById(int userId) 
        {
            User u = null;
            String sql = "SELECT * FROM users WHERE user_id=?";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) 
            {

                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) 
                {
                    u = new User();
                    u.setUserId(rs.getInt("user_id"));
                    u.setName(rs.getString("name"));
                    u.setEmail(rs.getString("email"));
                    u.setContactNo(rs.getString("contact_no"));
                    u.setUsername(rs.getString("username"));
                }

            } 
            catch (Exception e) 
            {
                System.out.println(e);
            }
            return u;
        }

        //UPDATE USER PROFILE
        public static boolean updateUserProfile(User u) 
        {
            String sql = "UPDATE users SET name=?, email=?, contact_no=?, username=? WHERE user_id=?";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) 
            {

                ps.setString(1, u.getName());
                ps.setString(2, u.getEmail());
                ps.setString(3, u.getContactNo());
                ps.setString(4, u.getUsername());
                ps.setInt(5, u.getUserId());

                return ps.executeUpdate() > 0;

            } 
            catch (Exception e) 
            {
                System.out.println(e);
            }
            return false;
        }

        //CHECK CURRENT PASSWORD 
        public static boolean checkPassword(int userId, String password) 
        {
            String sql = "SELECT user_id FROM users WHERE user_id=? AND password=?";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) 
            {

                ps.setInt(1, userId);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();
                return rs.next();

            } 
            catch (Exception e) 
            {
                System.out.println(e);
            }
            return false;
        }

        //UPDATE PASSWORD
        public static boolean updatePassword(int userId, String newPassword) 
        {
            String sql = "UPDATE users SET password=? WHERE user_id=?";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) 
            {

                ps.setString(1, newPassword);
                ps.setInt(2, userId);

                return ps.executeUpdate() > 0;

            } 
            catch (Exception e) 
            {
                System.out.println(e);
            }
            return false;
       }
}
