package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.IdaoHotel;
import dao.IdaoVille;
import entities.Hotel;
import entities.Ville;

/**
 * Servlet implementation class HotelController
 */
@WebServlet("/HotelController")
public class HotelController extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2L;
	@EJB
	private IdaoHotel ejb;
	@EJB
	private IdaoVille ejb1;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public HotelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	 List<Ville> VilleList = ejb1.findAll();
    	 request.setAttribute("villes", VilleList);
 		for (Ville v: VilleList) {System.out.println(v.getNom());}
        RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
        

        dispatcher.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		 List<Ville> VilleList = ejb1.findAll();
		for (Ville v: VilleList) {System.out.println(v.getNom());}
			
		if ("enregistrer".equals(action)) {
		    String nom = request.getParameter("nom");
		    String adresse = request.getParameter("adresse");
		    String telephone = request.getParameter("telephone");

		    String idVilleParameter = request.getParameter("ville");

		    if (idVilleParameter != null && !idVilleParameter.isEmpty()) {
		        int idVille = Integer.parseInt(idVilleParameter);
		        Ville selectedVille = ejb1.findById(idVille);
		        try {
		            ejb.create(new Hotel(nom, adresse, telephone, selectedVille));
		        } catch (Exception e) {
		            // Log the exception
		        }

		    } else {
		        // Handle the case where no city is selected
		        ejb.create(new Hotel(nom, adresse, telephone));
		    }

		   
		    request.setAttribute("villes", VilleList);
		    request.setAttribute("hotels", ejb.findAll());

		    RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
		    dispatcher.forward(request, response);
		

			
	        // Redirect to the same page after creating the city
	        response.sendRedirect(request.getContextPath() + "/HotelController");
	    } else if ("delete".equals(action)) {
		    int HotelId = Integer.parseInt(request.getParameter("id"));
		    if(ejb.findById(HotelId)!=null) {
		    	Hotel Hoteldelete =  ejb.findById(HotelId);
		        boolean updated = ejb.update(Hoteldelete);
		        if (updated) {
		            ejb.delete(Hoteldelete);
		            boolean deleted = true;
		            if (deleted) {
		            	List<Hotel>HotelList = ejb.findAll();
						request.setAttribute("hotels", HotelList);
						request.getRequestDispatcher("hotel.jsp").forward(request, response);
		            } else {
		                response.sendRedirect(request.getContextPath() + "/HotelController?deleteFailed=true");
		            }
		        }
		    }
		}
	    else if ("updateWithPopup".equals(action)) {
	       
	        int hotelId = Integer.parseInt(request.getParameter("id"));
	        String newHotelName = request.getParameter("newHotelName");
	        String newHotelAdresse = request.getParameter("newHotelAdresse");
	        String newHotelPhone = request.getParameter("newHotelPhone");
	        

	        boolean updatedHotel = ejb.updateWithPopup(hotelId, newHotelName, newHotelAdresse, newHotelPhone);

	        if (updatedHotel) {
	            List<Hotel> hotelList = ejb.findAll();
	            request.setAttribute("hotels", hotelList);
	            request.getRequestDispatcher("hotel.jsp").forward(request, response);
	           
	            
	        } else {
	            response.sendRedirect(request.getContextPath() + "/HotelController?updateFailed=true");
	        }
	    }
	    else if ("getHotelDataForChart".equals(action)) {
            // Cette méthode récupère les données nécessaires pour le graphique
            // Elle renvoie les données sous forme de chaîne JSON
            response.setContentType("application/json");

            List<Ville> villes = ejb1.findAll();
            Map<String, Integer> dataMap = new HashMap<>();

            for (Ville ville : villes) {
                int numberOfHotels = ville.getHotels().size();
                dataMap.put(ville.getNom(), numberOfHotels);
            }

            String jsonData = "{ \"labels\": [";
            String data = "\"data\": [";

            for (Map.Entry<String, Integer> entry : dataMap.entrySet()) {
                jsonData += "\"" + entry.getKey() + "\",";
                data += entry.getValue() + ",";
            }

            if (!dataMap.isEmpty()) {
                jsonData = jsonData.substring(0, jsonData.length() - 1); // Enlever la dernière virgule
                data = data.substring(0, data.length() - 1); // Enlever la dernière virgule
            }

            jsonData += "], " + data + "] }";

            response.getWriter().write(jsonData);
        }
		doGet(request, response);
	}

}
