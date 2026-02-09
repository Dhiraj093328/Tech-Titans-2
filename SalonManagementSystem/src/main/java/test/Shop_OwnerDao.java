package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Shop_OwnerDao {

    //SAVE
    public static int saveShopOwner(Shop_Owner s) 
    {
        int status = 0;

        String sql = "INSERT INTO shop_owner " +
                "(shop_name, registration_no, owner_name, opening_time, closing_time, " +
                "email, contact_no, username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setString(1, s.getShop_name());
            ps.setString(2, s.getRegistration_no());
            ps.setString(3, s.getOwner_name());
            ps.setTime(4, s.getOpening_time());
            ps.setTime(5, s.getClosing_time());
            ps.setString(6, s.getEmail());
            ps.setString(7, s.getContact_no());
            ps.setString(8, s.getUsername());
            ps.setString(9, s.getPassword());

            status = ps.executeUpdate();

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return status;
    }

    // LOGIN FETCH
    public static Shop_Owner getShopOwner(String username) {
        Shop_Owner s = null;
        String sql = "SELECT * FROM shop_owner WHERE username=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    s = mapOwner(rs);
                }
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return s;
    }

    // FETCH BY ID
    public static Shop_Owner getOwnerById(int id) {
        Shop_Owner s = null;
        String sql = "SELECT * FROM shop_owner WHERE shop_owner_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) 
            {
                if (rs.next()) 
                {
                    s = mapOwner(rs);
                }
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return s;
    }

    // UPDATE
    public static int updateShopOwner(Shop_Owner s) {
        int status = 0;

        String sql = "UPDATE shop_owner SET shop_name=?, registration_no=?, owner_name=?, " +
                "opening_time=?, closing_time=?, email=?, contact_no=?, username=?, password=? " +
                "WHERE shop_owner_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setString(1, s.getShop_name());
            ps.setString(2, s.getRegistration_no());
            ps.setString(3, s.getOwner_name());
            ps.setTime(4, s.getOpening_time());
            ps.setTime(5, s.getClosing_time());
            ps.setString(6, s.getEmail());
            ps.setString(7, s.getContact_no());
            ps.setString(8, s.getUsername());
            ps.setString(9, s.getPassword());
            ps.setInt(10, s.getShop_owner_id());

            status = ps.executeUpdate();

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return status;
    }

    // DELETE
    public static int deleteShopOwner(int id) {
        int status = 0;
        String sql = "DELETE FROM shop_owner WHERE shop_owner_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setInt(1, id);
            status = ps.executeUpdate();

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return status;
    }

    // COMMON MAPPER
    private static Shop_Owner mapOwner(ResultSet rs) throws Exception 
    {
        Shop_Owner s = new Shop_Owner();
        s.setShop_owner_id(rs.getInt("shop_owner_id"));
        s.setShop_name(rs.getString("shop_name"));
        s.setRegistration_no(rs.getString("registration_no"));
        s.setOwner_name(rs.getString("owner_name"));
        s.setOpening_time(rs.getTime("opening_time"));
        s.setClosing_time(rs.getTime("closing_time"));
        s.setEmail(rs.getString("email"));
        s.setContact_no(rs.getString("contact_no"));
        s.setUsername(rs.getString("username"));
        s.setPassword(rs.getString("password"));
        return s;
    }
}
