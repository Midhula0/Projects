package com.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TaskDAO;
import com.modules.Task;

@WebServlet("/EditTaskServlet")
public class EditTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskDAO taskDAO;

    public void init() {
        taskDAO = new TaskDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String project = request.getParameter("project");
        String taskDate = request.getParameter("taskDate");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        Task task = new Task(taskId, project, taskDate, startTime, endTime, category, description);
        taskDAO.updateTask(task);
        response.sendRedirect("viewTasks.jsp");
    }
}
