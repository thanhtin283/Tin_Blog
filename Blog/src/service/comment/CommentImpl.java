/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 9:15 AM                     *
 *************************************
 */

package service.comment;

import model.Comment;
import model.ConnectDatabase;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentImpl implements IComment {
    Connection connection = ConnectDatabase.getConnection();
    Statement statement;
    PreparedStatement preparedStatement;
    String sql;
    ResultSet resultSet;

    public CommentImpl() {
    }

    @Override
    public boolean createComment(Comment comment) {
        try {
            statement = (Statement) connection.createStatement();
            sql = "insert into comments(contents,idUsers,idPosts)" +
                    " values('" + comment.getContents() + "','" + comment.getIdUsers()
                    + "','" + comment.getIdPosts() + "')";
            statement.executeUpdate(sql);
            statement.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Comment getCommentById(int id) {

        sql = "select * from comments" +
                " inner join users on users.id = comments.idUsers" +
                " inner join posts on posts.id = comments.idPosts where comments.id = '" + id + "'";
        Comment comment = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                String contents = resultSet.getString("contents");
                Date dateCreated = resultSet.getDate("dateCreated");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                int idUsers = resultSet.getInt("idUsers");
                int idPosts = resultSet.getInt("idPosts");
                String username = resultSet.getString("username");
                String titlePost = resultSet.getString("title");
                comment = new Comment(id, contents, dateCreated, lastModifiedDate, idUsers, idPosts,username,titlePost);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comment;
    }


    @Override
    public List<Comment> getAllComment() {
        sql = "select * from comments" +
                " inner join users on users.id = comments.idUsers" +
                " inner join posts on posts.id = comments.idPosts";
        List<Comment> commentList = new ArrayList<>();
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String contents = resultSet.getString("contents");
                Date dateCreated = resultSet.getDate("dateCreated");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                int idUsers = resultSet.getInt("idUsers");
                int idPosts = resultSet.getInt("idPosts");
                String username = resultSet.getString("username");
                String titlePost = resultSet.getString("title");
                Comment comment = new Comment(id, contents, dateCreated, lastModifiedDate, idUsers, idPosts,username,titlePost);
                commentList.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }

    @Override
    public List<Comment> getAllCommentOfPost(int idPosts) {
        sql = "select * from comments" +
                " inner join users on users.id = comments.idUsers" +
                " inner join posts on posts.id = comments.idPosts" +
                " where idPosts = '" + idPosts + "'";
        List<Comment> commentList = new ArrayList<>();
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String contents = resultSet.getString("contents");
                Date dateCreated = resultSet.getDate("dateCreated");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                int idUsers = resultSet.getInt("idUsers");
                String username = resultSet.getString("username");
                String titlePost = resultSet.getString("title");
                Comment comment = new Comment(id, contents, dateCreated, lastModifiedDate, idUsers, idPosts,username,titlePost);
                commentList.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }

    @Override
    public List<Comment> getAllCommentOfPost_Username(int idPosts) {
        sql = "select * from comments inner join users on users.id = comments.idUsers where idPosts ='" + idPosts + "'";
        List<Comment> commentList = new ArrayList<>();
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String contents = resultSet.getString("contents");
                Date dateCreated = resultSet.getDate("dateCreated");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                int idUsers = resultSet.getInt("idUsers");
                String username = resultSet.getString("username");
                Comment comment = new Comment(id, contents, dateCreated, lastModifiedDate, idUsers, idPosts,username);
                commentList.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }

    @Override
    public List<Comment> getAllCommentOfUser(int idUsers) {
        sql = "select * from comments" +
                " inner join users on users.id = comments.idUsers" +
                " inner join posts on posts.id = comments.idPosts" +
                " where comments.idUsers = '" + idUsers + "'";
        List<Comment> commentList = new ArrayList<>();
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String contents = resultSet.getString("contents");
                Date dateCreated = resultSet.getDate("dateCreated");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                int idPosts = resultSet.getInt("idPosts");
                String username = resultSet.getString("username");
                String titlePost = resultSet.getString("title");
                Comment comment = new Comment(id, contents, dateCreated, lastModifiedDate, idUsers, idPosts,username,titlePost);
                commentList.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }


    @Override
    public boolean deleteComment(Comment comment) {
        try {
            statement = (Statement) connection.createStatement();
            sql = "delete from comments where id = '" + comment.getId() + "'";
            statement.executeUpdate(sql);
            statement.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateComment(Comment comment) {
        try {
            statement = (Statement) connection.createStatement();
            sql = "update comments set contents = '" + comment.getContents() +"',lastModifiedDate = NOW() " + "where id = '" + comment.getId() + "'";
            statement.executeUpdate(sql);
            statement.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
