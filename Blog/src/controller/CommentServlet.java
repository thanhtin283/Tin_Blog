package controller;

import model.Comment;
import model.User;
import service.comment.CommentImpl;
import service.comment.IComment;
import service.post.IPost;
import service.post.PostImpl;
import service.user.Hashing;
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
import java.security.NoSuchAlgorithmException;
import java.util.List;

@WebServlet(name = "CommentServlet", urlPatterns = "/comments")
public class CommentServlet extends HttpServlet {

    private IComment commentImpl = new CommentImpl();
    //private IPost postImpl = new PostImpl();
    private IUser userImpl = new UserImpl();
    private Hashing hash = new Hashing();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createComment(request, response);
                break;
            case "edit":
                try {
                    updateComment(request, response);
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                try {
                    deleteComment(request, response);
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                }
                break;
            case "listByIdPost":
                listCommentByIdPost(request, response);
                break;
            case "listByIdUser":
                listCommentByIdUser(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteComment(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userImpl.getUserByIdComment(id);
        String salted = user.getSalt();
        byte[] salt = hash.stringToByte(salted);
        String passwordTemp = request.getParameter("password");
        String password = this.hash.generateHash(passwordTemp, salt);
        String passwordBD = user.getPassword();

        if (password.equals(passwordBD)) {
            Comment comment = new Comment(id);
            this.commentImpl.deleteComment(comment);
            request.setAttribute("message", "Comment was deleted");
            RequestDispatcher dispatcher = request.getRequestDispatcher("comment/delete.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            HttpSession session = request.getSession();
            String role = (String) session.getAttribute("role");
            if (!role.equals("admin")) {
                request.setAttribute("message", "You are not allow to delete this comment");
                RequestDispatcher dispatcher = request.getRequestDispatcher("comment/delete.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                if (role == "admin") {
                    String usernameAdmin = (String) session.getAttribute("Admin");
                    User admin = userImpl.getUserByUsername(usernameAdmin);
                    String saltedAdmin = admin.getSalt();
                    byte[] saltAdmin = hash.stringToByte(saltedAdmin);
                    String passwordTempAdmin = request.getParameter("password");
                    String passwordAdmin = this.hash.generateHash(passwordTempAdmin, saltAdmin);
                    String passwordBDAdmin = admin.getPassword();
                    if (passwordAdmin == passwordBDAdmin){
                        Comment comment = new Comment(id);
                        this.commentImpl.deleteComment(comment);
                        request.setAttribute("message", "Comment was deleted");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/delete.jsp");
                        try {
                            dispatcher.forward(request, response);
                        } catch (ServletException | IOException e) {
                            e.printStackTrace();
                        }
                    }else {
                        request.setAttribute("message", "Wrong password.");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/delete.jsp");
                        try {
                            dispatcher.forward(request, response);
                        } catch (ServletException | IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("comment/delete.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            /*} else {
                request.setAttribute("message", "Wrong password, Do not allow deleting this comment.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("comment/delete.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }*/
            }
        }
    }

    private void updateComment(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {

        int id = Integer.parseInt(request.getParameter("id"));
        User user = userImpl.getUserByIdComment(id);
        String salted = user.getSalt();
        byte[] salt = hash.stringToByte(salted);
        String passwordTemp = request.getParameter("password");
        String password = this.hash.generateHash(passwordTemp, salt);
        String passwordBD = user.getPassword();


/*        int id = Integer.parseInt(request.getParameter("id"));*/
        if (password.equals(passwordBD)) {
            String content = request.getParameter("contents");
            Comment comment = new Comment(id, content);
            this.commentImpl.updateComment(comment);
            request.setAttribute("message", "Comments information was updated");
            RequestDispatcher dispatcher = request.getRequestDispatcher("comment/edit.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "Wrong password, Do not allow edit this comment.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("comment/edit.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
/*
        Comment comment = new Comment(id, content);
        RequestDispatcher dispatcher;
        this.commentImpl.updateComment(comment);
        request.setAttribute("message", "Comments information was updated");
        dispatcher = request.getRequestDispatcher("comment/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }*/
    }

    private void createComment(HttpServletRequest request, HttpServletResponse response) {
        String content = request.getParameter("content");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("Admin");
        int idUser = userImpl.findIdByUsername(username);
        int idPost = Integer.parseInt(request.getParameter("id"));
        Comment comment = new Comment(content, idUser, idPost);
        this.commentImpl.createComment(comment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("single.jsp");
        request.setAttribute("message", "New comments was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
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
            case "listByIdPost":
                listCommentByIdPost(request, response);
                break;
            case "listByIdUser":
                listCommentByIdUser(request, response);
                break;
            default:
                listComment(request, response);
                break;
        }
    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Comment comment = commentImpl.getCommentById(id);
        request.setAttribute("comment", comment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/view.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Comment comment = commentImpl.getCommentById(id);
        request.setAttribute("comment", comment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/delete.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Comment comment = commentImpl.getCommentById(id);
        request.setAttribute("comment", comment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/edit.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("single.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listComment(HttpServletRequest request, HttpServletResponse response) {
        List<Comment> comments = this.commentImpl.getAllComment();
        request.setAttribute("comments", comments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/list.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listCommentByIdPost(HttpServletRequest request, HttpServletResponse response) {
        int idPost = Integer.parseInt(request.getParameter("viewByIdPost"));//viewByIdPost
        List<Comment> comments = this.commentImpl.getAllCommentOfPost(idPost);
        request.setAttribute("comments", comments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/listByIdPost.jsp");//comment/listByIdPost.jsp
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listCommentByIdUser(HttpServletRequest request, HttpServletResponse response) {
        int idUser = Integer.parseInt(request.getParameter("viewByIdUser"));
        List<Comment> comments = this.commentImpl.getAllCommentOfUser(idUser);
        request.setAttribute("comments", comments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/listByIdUser.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
