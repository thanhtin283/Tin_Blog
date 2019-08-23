/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 9:15 AM                     *
 *************************************
 */

package service.category;

import model.Category;
import model.ConnectDatabase;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryImpl implements ICategory {

    Connection connection = ConnectDatabase.getConnection();
    Statement statement;
    String sql;
    ResultSet resultSet;

    @Override
    public boolean createCategory(Category category) {
        try {
            statement = (Statement) connection.createStatement();
            sql = "insert into categories(nameCategories)" +
                    " values('" + category.getNameCategories() + "')";
            statement.executeUpdate(sql);
            statement.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Category getCategoryById(int id) {
        sql = "select * from categories where id = '" + id + "'";
        Category category = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                String nameCategories = resultSet.getString("nameCategories");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                String finalEditor = resultSet.getString("finalEditor");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                category = new Category(id, nameCategories, creator, dateCreated, finalEditor, lastModifiedDate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    @Override
    public List<Category> getAllCategory() {
        List<Category> categoryList = new ArrayList<>();
        sql = "select * from categories";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nameCategories = resultSet.getString("nameCategories");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                String finalEditor = resultSet.getString("finalEditor");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                Category category = new Category(id, nameCategories, creator, dateCreated, finalEditor, lastModifiedDate);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }

    @Override
    public boolean updateCategory(Category category) {
        try {
            statement = (Statement) connection.createStatement();
            sql = "update categories set nameCategories = '" + category.getNameCategories()  + "', finalEditor = '"+category.getFinalEditor() + "', lastModifiedDate = NOW() where id = '" + category.getId() + "'";
            statement.executeUpdate(sql);
            statement.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCategory(Category category) {
        try {
            statement = (Statement) connection.createStatement();
            sql = "delete from categories where id = '" + category.getId() + "'";
            statement.executeUpdate(sql);
            statement.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
