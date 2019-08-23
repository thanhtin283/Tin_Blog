package controller;

import model.Category;
import model.Comment;
import model.Post;
import model.User;
import service.category.CategoryImpl;
import service.category.ICategory;
import service.comment.CommentImpl;
import service.comment.IComment;
import service.post.IPost;
import service.post.PostImpl;
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
import java.util.List;

@WebServlet(name = "PostServlet", urlPatterns = "/posts")
public class PostServlet extends HttpServlet {

    private IPost postDAO = new PostImpl();
    private IComment commentImpl = new CommentImpl();
    private ICategory categoryImpl = new CategoryImpl();
    private IUser userImpl = new UserImpl();
    HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createPost(request, response);
                break;
            case "createComment":
                createComment(request, response);
                break;
            case "edit":
                updatePost(request, response);
                break;
            case "delete":
                deletePost(request, response);
                break;
            default:
                break;
        }
    }
//add
    private void createComment(HttpServletRequest request, HttpServletResponse response) {
        String content = request.getParameter("content");
        session = request.getSession();
        String username = (String) session.getAttribute("Admin");
        int idUser = userImpl.findIdByUsername(username);

        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher;
        if (idUser != -1) {
            Comment comment = new Comment(content, idUser, id);
            this.commentImpl.createComment(comment);

            Post post = this.postDAO.getPostById(id);
            List<Comment> comments = this.commentImpl.getAllCommentOfPost_Username(id);
            List<Category> category = this.categoryImpl.getAllCategory();
            request.setAttribute("posts", post);
            request.setAttribute("comments", comments);
            request.setAttribute("categories", category);

            dispatcher = request.getRequestDispatcher("single.jsp");
            request.setAttribute("message", "New comments was created");

        }else {

            Post post = this.postDAO.getPostById(id);
            List<Comment> comments = this.commentImpl.getAllCommentOfPost_Username(id);
            List<Category> category = this.categoryImpl.getAllCategory();
            request.setAttribute("posts", post);
            request.setAttribute("comments", comments);
            request.setAttribute("categories", category);

            dispatcher = request.getRequestDispatcher("single.jsp");
            request.setAttribute("message", "You must login first");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Post deletePost = this.postDAO.getPostById(id);
        this.postDAO.deletePost(deletePost);
        try {
            response.sendRedirect("/posts");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String introduce = request.getParameter("introduce");
        String content = request.getParameter("content");
        String image = request.getParameter("image");
        int categories = Integer.parseInt(request.getParameter("categories"));
        session = request.getSession();
        String finalEditor = (String) session.getAttribute("Admin");
        int idUser = userImpl.findIdByUsername(finalEditor);

        Post post = this.postDAO.getPostById(id);
        RequestDispatcher requestDispatcher;
        post.setTitle(title);
        post.setIntroduce(introduce);
        post.setContent(content);
        post.setImage(image);
        post.setIdCategories(categories);
        post.setIdUsers(idUser);
        post.setFinalEditor(finalEditor);
        this.postDAO.updatePost(id, post);
        request.setAttribute("posts", post);
        request.setAttribute("message", "Post was updated");
        requestDispatcher = request.getRequestDispatcher("post/edit.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String title = request.getParameter("title");
        String introduce = request.getParameter("introduce");
        String content = request.getParameter("content");
        String image = request.getParameter("image");
        int categories = Integer.parseInt(request.getParameter("categories"));
        String creator = (String) session.getAttribute("Admin");
        int idUser = userImpl.findIdByUsername(creator);
/*        int user = Integer.parseInt(request.getParameter("user"));*/

        Post post = new Post(0, title, introduce, content, image, categories, idUser, creator);
        this.postDAO.createPost(post);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("post/create.jsp");
        request.setAttribute("message", "New post was created");
        try {
            requestDispatcher.forward(request, response);
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
            case "createComment":
                createComment(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewPosts(request, response);
                break;
            default:
                listPosts(request, response);
                break;
        }
    }

    private void viewPosts(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        
        HttpSession session = request.getSession();
        session.setAttribute("idPost",id);

        Post post = this.postDAO.getPostById(id);
        List<Comment> comments = this.commentImpl.getAllCommentOfPost_Username(id);
        List<Category> category = this.categoryImpl.getAllCategory();
        request.setAttribute("posts", post);
        request.setAttribute("comments", comments);
        request.setAttribute("categories", category);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("single.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Post deletePost = this.postDAO.getPostById(id);
        RequestDispatcher requestDispatcher;
        request.setAttribute("posts", deletePost);
        requestDispatcher = request.getRequestDispatcher("post/delete.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Post existingPost = this.postDAO.getPostById(id);
        request.setAttribute("posts", existingPost);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("post/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("post/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listPosts(HttpServletRequest request, HttpServletResponse response) {
        List<Post> posts = this.postDAO.getAllPosts();
        request.setAttribute("posts", posts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("post/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
