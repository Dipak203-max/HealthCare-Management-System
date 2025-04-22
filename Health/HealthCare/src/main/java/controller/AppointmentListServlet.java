package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.AppointmentDao;
import model.Appointment;
import model.User;

@WebServlet("/AppointmentListServlet")
public class AppointmentListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        if (!"admin".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only administrators can access this page");
            return;
        }
        
        AppointmentDao appointmentDao = new AppointmentDao();
        List<Appointment> appointments = appointmentDao.getAllAppointments();
        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("/view/appointmentList.jsp").forward(request, response);
    }
}