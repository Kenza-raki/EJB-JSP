package services;

import java.util.List;

import dao.IDaoRemote;
import dao.IdaoHotel;
import entities.Hotel;
import entities.Ville;
import jakarta.annotation.security.PermitAll;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

@Stateless(name ="asmaa")
public class HotelService implements IDaoRemote<Hotel>, IdaoHotel{
	
	@PersistenceContext
	private EntityManager em1;

	@Override
	@PermitAll
	public Hotel create(Hotel o) {
		em1.persist(o);
		return o;
	}

	@Override
	@PermitAll
	public boolean delete(Hotel o) {
		em1.remove(em1.contains(o) ? o: em1.merge(o));
		return true;
	}

	@Override
	@PermitAll
	public boolean update(Hotel o) {
		try {
			
	        em1.merge(o);
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	 @PermitAll
	    public boolean updateWithPopup(int id, String newHotelName, String newHotelAdresse, String newHotelPhone) {
	        try {
	        	Hotel existingHotel = em1.find(Hotel.class, id);

	            if (existingHotel!= null) {
	                // Set the new city name
	                existingHotel.setNom(newHotelName);
	                existingHotel.setAdresse(newHotelAdresse);
	                existingHotel.setTelephone(newHotelPhone);
	                em1.merge(existingHotel);
	                return true;
	            }

	            return false;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	@Override
	@PermitAll
	public Hotel findById(int id) {
		// TODO Auto-generated method stub
		return em1.find(Hotel.class, id);
	}

	@Override
	@PermitAll
	public List<Hotel> findAll() {
		Query query = em1.createQuery("select h from Hotel h");
		return query.getResultList();
	}

}
