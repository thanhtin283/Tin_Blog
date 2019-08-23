package controller;

import model.User;
import service.user.Hashing;
import service.user.IUser;
import service.user.UserImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {

    private IUser userImpl = new UserImpl();
    private Hashing hash = new Hashing();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createUser(request, response);
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                try {
                    updateUser(request, response);
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = new User(id);

        this.userImpl.deleteUser(user);
        request.setAttribute("message", "User was deleted");
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/delete.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userImpl.getUserById(id);
        String username = user.getUsername();
        String passwordTemp = request.getParameter("password");
        String salt = user.getSalt();
        byte[] salted = hash.stringToByte(salt);
        String password = this.hash.generateHash(passwordTemp, salted);
        String passwordDB = user.getPassword();
        if (password.equals(passwordDB)){
            String newPasswordTemp = request.getParameter("newPassword");
            byte[] newSalted = this.hash.createSalt();
            String newSalt = this.hash.byteToString(newSalted);
            String newPassword = this.hash.generateHash(newPasswordTemp, newSalted);
            user.setSalt(newSalt);
            user.setPassword(newPassword);
/*            user = new User(id, username, newPassword, newSalt);*/
            this.userImpl.updateUser(user);
            request.setAttribute("message", "User information was updated");
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "Wrong password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {
        String username = request.getParameter("username");
        String passwordTemp = request.getParameter("password");
        String rePasswordTemp = request.getParameter("rePassword");
        RequestDispatcher dispatcher;
        //vua them
        boolean checkUserName = userImpl.checkUsername(username);
        if (checkUserName) {
            byte[] salted = this.hash.createSalt();
            String salt = this.hash.byteToString(salted);
            String password = this.hash.generateHash(passwordTemp, salted);

            dispatcher = request.getRequestDispatcher("register.jsp");
            if (!passwordTemp.equals(rePasswordTemp)) {
                request.setAttribute("message", "Password and Re_Password not same");
            } else {
                User user = new User(username, password, salt);
                this.userImpl.createUser(user);
                request.setAttribute("message", "New user was created");
            }
        }
        else {
            dispatcher = request.getRequestDispatcher("register.jsp");
            request.setAttribute("message", "Username was registered");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                showViewForm(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = this.userImpl.getAllUser();
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userImpl.getUserById(id);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userImpl.getUserById(id);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/delete.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userImpl.getUserById(id);
        request.setAttribute("user", user);

        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

}
