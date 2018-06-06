package controller;

import model.book;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;

public class connectMysql {
    //mysql驱动包名
    private static final String dbDriver = "com.mysql.jdbc.Driver";
    //数据库连接地址
    private static final String url = "jdbc:mysql://localhost:3306/student";
    //用户名
    private static final String user = "root";
    //密码
    private static final String pass = "root";

    private static Connection connection = null;

    public static void init(){
        try{
            //加载mysql的驱动类
            Class.forName(dbDriver);
            //获取数据库连接
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insert(String username,String password){
        try {
            String sql = "insert into userlist values(?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ps.setString(1,username);
            ps.setString(2,connectMysql.MD5(password));
            int num = ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    public static int select(String username,String password){
        try {
            String sql = "select username,password from userlist where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            String user="",pass="";
            while(rs.next()){
                pass=rs.getString("password");
                user=rs.getString("username");
            }
            rs.close();
            ps.close();

            if(user.equals(""))
                return -1;//不存在该用户
            else {
                if (pass.equals(connectMysql.MD5(password)))
                    return 1;//密码正确
                else return -2;//密码错误
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static int selectManage(String username,String password){
        try {
            String sql = "select username,password from manage where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            String user="",pass="";
            while(rs.next()){
                pass=rs.getString("password");
                user=rs.getString("username");
            }
            rs.close();
            ps.close();

            if(user.equals(""))
                return -1;//不存在该用户
            else {
                if (pass.equals(connectMysql.MD5(password)))
                    return 1;//密码正确
                else return -2;//密码错误
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static ArrayList<book> AllBook(){
        ArrayList<book> list = new ArrayList<>();
        try {
            String sql = "select * from book";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                book bk = new book();
                bk.book(rs.getString(1),rs.getString(2),rs.getString(3));
                list.add(bk);
            }
            rs.close();
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static book selectBook(String bookname) throws UnsupportedEncodingException {
        bookname = new String(bookname.getBytes("ISO-8859-1"),"utf-8");
        book bk = new book();
        try {
            String sql = "select * from book where bookname like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ps.setString(1,"%"+bookname+"%");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                bk.book(rs.getString(1),rs.getString(2),rs.getString(3));
            }
            rs.close();
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bk;
    }

    public static void insertBook(String bookname,String author,String press){
        try {
            String sql = "insert into book values(?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ps.setString(1,bookname);
            ps.setString(2,author);
            ps.setString(3,press);
            int num = ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void deleteBook(String bookname){
        try {
            String sql = "delete from book where bookname = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ps.setString(1,bookname);
            int num = ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static String MD5(String str) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.update(str.getBytes());
        return new BigInteger(1, md5.digest()).toString();
    }

    public static int seek(String username){
        try {
            String sql = "select username from userlist where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            String user="";
            while(rs.next()){
                user=rs.getString("username");
            }
            rs.close();
            ps.close();

            if(user.equals(""))
                return -1;//不存在该用户
            else
                return 1;//密码正确
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void update(String username,String newPassword){
        try {
            String sql = "update userlist set password = ? where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ps.setString(1,connectMysql.MD5(newPassword));
            ps.setString(2,username);
            int num = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public static void updateManage(String username,String newPassword){
        try {
            String sql = "update manage set password = ? where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            //结果集
            ps.setString(1,connectMysql.MD5(newPassword));
            ps.setString(2,username);
            int num = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
//    public static void main(String[] args) {
//        init();
//        getMessage();
//    }
}
