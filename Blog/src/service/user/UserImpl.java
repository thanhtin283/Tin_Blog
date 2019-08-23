/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 9:16 AM                     *
 *************************************
 */

package service.user;

import model.ConnectDatabase;
import model.User;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserImpl implements IUser {

    Connection connection = ConnectDatabase.getConnection();
    ResultSet resultSet = null;
    Statement statement;
    PreparedStatement preparedStatement;
    String sql;
    Hashing hash = new Hashing();

    @Override
    public String authenticateUser(User user) throws NoSuchAlgorithmException {
        statement = null;
        String username = user.getUsername();
        String passwordTemp = user.getPassword();
        String userNameDB;
        String passwordDB;
        String roleDB;
        String sql = "select username, password, role, salt from users";
        String salt = getSaltByUsername(username);
        byte[] salted = hash.stringToByte(salt);
        String password = this.hash.generateHash(passwordTemp, salted);
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                userNameDB = resultSet.getString("username");
                passwordDB = resultSet.getString("password");
                roleDB = resultSet.getString("role");
                if (username.equals(userNameDB) && password.equals(passwordDB)) {
                    if (roleDB.equals("admin")) {
                        return "admin";
                    } else {
                        return "user";
                    }
                }
/*                if (username.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("admin")) {
                    return "admin_role";
                } else if (username.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("user")) {
                    return "user_role";
                }*/
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Login is invalid";
    }

    @Override
    public boolean createUser(User user) {
        try {
            statement = (Statement) connection.createStatement();
            sql = "insert into users(username,password,salt)" +
                    " values('" + user.getUsername() + "','" + user.getPassword() + "','" + user.getSalt() + "')";
            statement.executeUpdate(sql);
            statement.close();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteUser(User user) {
        try {
            statement = (Statement) connection.createStatement();
            sql = "delete from users where id = '" + user.getId() + "'";
            statement.executeUpdate(sql);
            statement.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        try {
            statement = (Statement) connection.createStatement();
            sql = "update users set password = '" + user.getPassword() + "', salt = '" + user.getSalt() + "', lastModifiedDate = NOW() where id = '" + user.getId() + "'";
            statement.executeUpdate(sql);
            statement.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> getAllUser() {
        List<User> userList = new ArrayList<>();
        sql = "select * from users";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String salt = resultSet.getString("salt");
                String role = resultSet.getString("role");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                String finalEditor = resultSet.getString("finalEditor");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                String image = resultSet.getString("image");
                User user = new User(id, username, password, role, salt, image, creator, dateCreated, finalEditor, lastModifiedDate);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public User getUserById(int id) {
        sql = "select * from users where id = '" + id + "'";
        User user = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String salt = resultSet.getString("salt");
                String role = resultSet.getString("role");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                String finalEditor = resultSet.getString("finalEditor");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                String image = resultSet.getString("image");
                user = new User(id, username, password, role, salt, image, creator, dateCreated, finalEditor, lastModifiedDate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //vua them
    @Override
    public User getUserByIdComment(int idComment) {
        sql = "select username, password, users.id , salt from users " +
                " inner join comments " +
                " on comments.idUsers = users.id " +
                " where comments.id = '" + idComment + "'";
        User user = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int idUsers = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String salt = resultSet.getString("salt");
                user = new User(idUsers, username, password, salt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public User getUserByUsername(String username) {
        sql = "select username, password, id , salt from users " +
                " where username = '" + username + "'";
        User user = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int idUsers = resultSet.getInt("id");
                /*                String username = resultSet.getString("username");*/
                String password = resultSet.getString("password");
                String salt = resultSet.getString("salt");
                user = new User(idUsers, username, password, salt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public String getSaltByUsername(String username) {
        sql = "select salt from users where username = '" + username + "'";
        String stringSalt = "";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                stringSalt = resultSet.getString("salt");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stringSalt;
    }

    @Override
    public String getPasswordByUsername(String username) {
        sql = "select password from users where username = '" + username + "'";
        String password = "";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                password = resultSet.getString("password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return password;
    }

    @Override
    public boolean checkUsername(String username) {
        sql = "select * from users where username = '" + username + "'";
        boolean check = true;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                if (id > 0) {
                    check = false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    @Override
    public int findIdByUsername(String username) {
        sql = "select * from users where username = '" + username + "'";
        int id = -1;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                id = resultSet.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }
}

