package controller;

import model.User;
import service.user.IUser;
import service.user.UserImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private IUser userImpl = new UserImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher;

        String userName = request.getParameter("loginUsername");
        String password = request.getParameter("loginPassword");

        User user = new User();

        user.setUsername(userName);
        user.setPassword(password);


        try {
/*            String userValidate = userImpl.authenticateUser(user);
            if (userValidate != "no") {
                if (userValidate.equals("admin")) {
                    session.setAttribute("role", "admin");
                } else {
                    session.setAttribute("role", "user");
                }
                User userLogin = userImpl.getUserByUsername(userName);
                int idUser = userLogin.getId();
                session.setAttribute("idUser", idUser);
                dispatcher = request.getRequestDispatcher("/admin.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                request.setAttribute("errMessage", "Invalid user credentials");
                dispatcher = request.getRequestDispatcher("login.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }*/
            String userValidate = userImpl.authenticateUser(user);
            if (userValidate.equals("admin")) {
                session.setAttribute("Admin", userName);
                request.setAttribute("userName", userName);
                User userLogin = userImpl.getUserByUsername(userName);
                int idUser = userLogin.getId();
                session.setAttribute("idUser", idUser);

                session.setAttribute("role", "admin");
                dispatcher = request.getRequestDispatcher("/admin.jsp");
            } else if (userValidate == "user") {
                session.setAttribute("Admin", userName);
                request.setAttribute("userName", userName);
                User userLogin = userImpl.getUserByUsername(userName);
                int idUser = userLogin.getId();
                session.setAttribute("idUser", idUser);
                session.setAttribute("role", "user");

                dispatcher = request.getRequestDispatcher("/home");
            } else {
                request.setAttribute("errMessage", userValidate);
                dispatcher = request.getRequestDispatcher("login.jsp");
            }
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
