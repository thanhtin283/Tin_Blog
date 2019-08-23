/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 9:14 AM                     *
 *************************************
 */

package service.category;

import model.Category;
import model.User;

import java.util.List;

public interface ICategory {
    public boolean createCategory(Category category);

    public Category getCategoryById(int id);

    public List<Category> getAllCategory();

    public boolean updateCategory(Category category);

    public boolean deleteCategory(Category category);
}
