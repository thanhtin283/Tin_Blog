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

import model.User;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface IUser {
    public String authenticateUser(User user) throws NoSuchAlgorithmException;

    public boolean createUser(User user);

    public User getUserById(int id);

    public User getUserByIdComment(int idComment);

    public User getUserByUsername(String username);

    public List<User> getAllUser();

    public boolean updateUser(User user);

    public boolean deleteUser(User user);

    public boolean checkUsername(String username);

    public int findIdByUsername(String username);

    public String getSaltByUsername(String username);

    public String getPasswordByUsername(String username);

}
