/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 9:15 AM                     *
 *************************************
 */

package service.post;

import model.ConnectDatabase;
import model.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostImpl implements IPost {

    Connection connection = ConnectDatabase.getConnection();
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    String sql = null;
    ResultSet resultSet;

    @Override
    public void createPost(Post post) {
        sql = "insert into posts (title, introduce, content, image, idCategories, idUsers, creator)" +
                "values (?, ?, ?, ?, ?, ?, ?)";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, post.getTitle());
            preparedStatement.setString(2, post.getIntroduce());
            preparedStatement.setString(3, post.getContent());
            preparedStatement.setString(4, post.getImage());
            preparedStatement.setInt(5, post.getIdCategories());
            preparedStatement.setInt(6, post.getIdUsers());
            preparedStatement.setString(7, post.getCreator());
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Post getPostById(int id) {
        Post post = null;
        sql = "select posts.*, categories.nameCategories " +
                "FROM blog.posts " +
                "inner join categories " +
                "on posts.idCategories = categories.id "+
                "where posts.id = ?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                String finalEditor = resultSet.getString("finalEditor");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                int idCategories = resultSet.getInt("idCategories");
                int idUsers = resultSet.getInt("idUsers");
                String nameCategories = resultSet.getString("nameCategories");
                post = new Post(id, title, introduce, content, image, creator, dateCreated, finalEditor,
                        lastModifiedDate, idCategories, idUsers, nameCategories);

                resultSet.close();
                preparedStatement.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }

    @Override
    public List<Post> getAllPosts() {
        List<Post> listPosts = new ArrayList<>();
        sql = "select posts.*, categories.nameCategories " +
                "FROM blog.posts " +
                "inner join categories " +
                "on posts.idCategories = categories.id ";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                String finalEditor = resultSet.getString("finalEditor");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                int idCategories = resultSet.getInt("idCategories");
                int idUsers = resultSet.getInt("idUsers");
                String nameCategories = resultSet.getString("nameCategories");
                Post post = new Post(id, title, introduce, content, image, creator, dateCreated, finalEditor,
                        lastModifiedDate, idCategories, idUsers, nameCategories);


                listPosts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPosts;
    }

    @Override
    public List<Post> getAllPostsByCategory(int idCategory) {
        List<Post> posts = new ArrayList<>();
        sql = "select posts.*, categories.nameCategories " +
                "FROM blog.posts " +
                "inner join categories " +
                "on posts.idCategories = categories.id " +
                "where categories.id = " + idCategory + " order by dateCreated DESC";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                int idCategories = resultSet.getInt("idCategories");
                String nameCategories = resultSet.getString("nameCategories");

                Post post = new Post(id, title, introduce, creator, dateCreated, idCategories, nameCategories);
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    @Override
    public List<Post> getSearchResults(String keyword) {
        List<Post> searchResult = new ArrayList<>();
        sql = "select id, title, introduce from posts where title like '%" + keyword + "%';";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");

                Post post = new Post(id, title, introduce);

                searchResult.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchResult;
    }

    @Override
    public Post getLatestPostByCategory(int idCategory) {
        Post latestPost = null;
        sql = "SELECT posts.*, categories.nameCategories " +
                "FROM blog.posts " +
                "inner join categories " +
                "on posts.idCategories = categories.id " +
                "where categories.id = " + idCategory +
                " order by posts.dateCreated DESC limit 1;";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                int idCategories = resultSet.getInt("idCategories");
                String nameCategories = resultSet.getString("nameCategories");

                latestPost = new Post(id, title, introduce, creator, dateCreated, idCategories, nameCategories);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return latestPost;
    }

    @Override
    public void updatePost(int id, Post post) {
        sql = "update posts set title = ?, introduce = ?, content = ?, image = ?, idCategories = ?, idUsers = ?, finalEditor = ?,lastModifiedDate = NOW() " +
                "where id = ?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, post.getTitle());
            preparedStatement.setString(2, post.getIntroduce());
            preparedStatement.setString(3, post.getContent());
            preparedStatement.setString(4, post.getImage());
            preparedStatement.setInt(5, post.getIdCategories());
            preparedStatement.setInt(6, post.getIdUsers());
            preparedStatement.setString(7, post.getFinalEditor());
            preparedStatement.setInt(8, post.getId());
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletePost(Post post) {
        sql = "delete from posts where id = ?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, post.getId());
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
