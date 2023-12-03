package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.IDaoLocale;
import dao.IdaoVille;
import entities.Ville;

/**
 * Servlet implementation class VilleController
 */
public class VilleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private IdaoVille ejb;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VilleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ville.jsp");
		
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("enregistrer".equals(action)) {
	        // Handle the creation of a new city
	        String nom = request.getParameter("ville");
	        ejb.create(new Ville(nom));
	        request.setAttribute("villes", ejb.findAll());
	        RequestDispatcher dispatcher = request.getRequestDispatcher("ville.jsp");
	        dispatcher.forward(request, response);
			
	        // Redirect to the same page after creating the city
	        response.sendRedirect(request.getContextPath() + "/VilleController");
	    } else if ("delete".equals(action)) {
		    int VilleId = Integer.parseInt(request.getParameter("id"));
		    if(ejb.findById(VilleId)!=null) {
		    	Ville Villedelete =  ejb.findById(VilleId);
		        boolean updated = ejb.update(Villedelete);
		        if (updated) {
		            ejb.delete(Villedelete);
		            boolean deleted = true;
		            if (deleted) {
		            	List<Ville>VilleList = ejb.findAll();
						request.setAttribute("villes", VilleList);
						request.getRequestDispatcher("ville.jsp").forward(request, response);
		            } else {
		                response.sendRedirect(request.getContextPath() + "/VilleController?deleteFailed=true");
		            }
		        }
		    }
		}
	    else if ("updateWithPopup".equals(action)) {
	        // Handle the update with a popup
	        int villeId = Integer.parseInt(request.getParameter("id"));
	        String newVilleName = request.getParameter("newVilleName");

	        boolean updatedVille = ejb.updateWithPopup(villeId, newVilleName);

	        if (updatedVille) {
	            List<Ville> villeList = ejb.findAll();
	            request.setAttribute("villes", villeList);
	            request.getRequestDispatcher("ville.jsp").forward(request, response);
	        } else {
	            response.sendRedirect(request.getContextPath() + "/VilleController?updateFailed=true");
	        }
	    }


		doGet(request, response);
	}
	
}
