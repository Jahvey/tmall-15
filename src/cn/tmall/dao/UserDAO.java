package cn.tmall.dao;

import cn.tmall.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
    public int total(){
        int total=0;
        try (Connection c= DBUtil.getConnection(); Statement s=c.createStatement()){
            String sql="select count(*) from user";
            ResultSet rs=s.executeQuery(sql);
            if (rs.next()){
                total=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
}
