package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TherapistDao {

    //SAVE
    public static int saveTherapist(Therapist t) 
    {
        String sql = "INSERT INTO therapist(name,email,contact_no,username,password) VALUES(?,?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setString(1, t.getName());
            ps.setString(2, t.getEmail());
            ps.setString(3, t.getContactNo());
            ps.setString(4, t.getUsername());
            ps.setString(5, t.getPassword());

            return ps.executeUpdate();

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return 0;
    }

    //LOGIN
    public static Therapist getTherapist(String username) 
    {
        String sql = "SELECT * FROM therapist WHERE username=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                Therapist t = new Therapist();
                t.setTherapistId(rs.getInt("therapist_id"));
                t.setName(rs.getString("name"));
                t.setEmail(rs.getString("email"));
                t.setContactNo(rs.getString("contact_no"));
                t.setUsername(rs.getString("username"));
                t.setPassword(rs.getString("password"));
                return t;
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return null;
    }

    //GET BY ID
    public static Therapist getTherapistById(int therapistId) {
        String sql = "SELECT * FROM therapist WHERE therapist_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setInt(1, therapistId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                Therapist t = new Therapist();
                t.setTherapistId(rs.getInt("therapist_id"));
                t.setName(rs.getString("name"));
                t.setEmail(rs.getString("email"));
                t.setContactNo(rs.getString("contact_no"));
                t.setUsername(rs.getString("username"));
                t.setPassword(rs.getString("password"));
                return t;
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return null;
    }

    // GET ALL
    public static List<Therapist> getAllTherapist() 
    {
        List<Therapist> list = new ArrayList<>();
        String sql = "SELECT * FROM therapist";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) 
        {

            while (rs.next()) 
            {
                Therapist t = new Therapist();
                t.setTherapistId(rs.getInt("therapist_id"));
                t.setName(rs.getString("name"));
                t.setEmail(rs.getString("email"));
                t.setContactNo(rs.getString("contact_no"));
                t.setUsername(rs.getString("username"));
                t.setPassword(rs.getString("password"));
                list.add(t);
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return list;
    }

    //UPDATE PROFILE (NO PASSWORD)
    public static boolean updateTherapistProfile(Therapist t) 
    {
        String sql = "UPDATE therapist SET name=?, email=?, contact_no=?, username=? WHERE therapist_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setString(1, t.getName());
            ps.setString(2, t.getEmail());
            ps.setString(3, t.getContactNo());
            ps.setString(4, t.getUsername());
            ps.setInt(5, t.getTherapistId());

            return ps.executeUpdate() > 0;

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return false;
    }

    //CHECK CURRENT PASSWORD
    public static boolean checkPassword(int therapistId, String password) 
    {
        String sql = "SELECT therapist_id FROM therapist WHERE therapist_id=? AND password=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setInt(1, therapistId);
            ps.setString(2, password);

            return ps.executeQuery().next();

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return false;
    }

    //UPDATE PASSWORD
    public static boolean updatePassword(int therapistId, String newPassword) 
    {
        String sql = "UPDATE therapist SET password=? WHERE therapist_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setString(1, newPassword);
            ps.setInt(2, therapistId);

            int rows = ps.executeUpdate();
            System.out.println("Password updated rows = " + rows);

            return rows > 0;

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return false;
    }
}
