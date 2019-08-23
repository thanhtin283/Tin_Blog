package controller;

import model.Category;
import service.category.CategoryImpl;
import service.category.ICategory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", urlPatterns = "/categories")
public class CategoryServlet extends HttpServlet {

    private ICategory categoryImpl = new CategoryImpl();
    HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCategory(request, response);
                break;
            case "edit":
                updateCategory(request, response);
                break;
            case "delete":
                deleteCategory(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = new Category(id);
        RequestDispatcher dispatcher;
        this.categoryImpl.deleteCategory(category);
/*        request.setAttribute("message", "Category was deleted");*/
        /*dispatcher = request.getRequestDispatcher("category/list.jsp");*/
        try {
/*            dispatcher.forward(request, response);*/
            response.sendRedirect("/categories");
        } catch ( IOException e) {
            e.printStackTrace();
        }
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) {
        String nameCategory = request.getParameter("nameCategory");
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = new Category(id, nameCategory);
        RequestDispatcher dispatcher;
        session = request.getSession();
        String finalEditor = (String) session.getAttribute("Admin");
        category.setFinalEditor(finalEditor);
        this.categoryImpl.updateCategory(category);
        request.setAttribute("message", "Category information was updated");
        dispatcher = request.getRequestDispatcher("category/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createCategory(HttpServletRequest request, HttpServletResponse response) {
        String nameCategory = request.getParameter("nameCategory");
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/create.jsp");

        Category category = new Category(nameCategory);
        this.categoryImpl.createCategory(category);
        request.setAttribute("message", "New category was created");

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
                listComment(request, response);
                break;
        }
    }

    private void listComment(HttpServletRequest request, HttpServletResponse response) {
        List<Category> categories = this.categoryImpl.getAllCategory();
        request.setAttribute("categories", categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/list.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryImpl.getCategoryById(id);
        request.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/view.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryImpl.getCategoryById(id);
        request.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/delete.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryImpl.getCategoryById(id);
        request.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/edit.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
