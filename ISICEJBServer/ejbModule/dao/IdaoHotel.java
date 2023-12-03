package dao;

import entities.Hotel;
import jakarta.ejb.Local;

@Local
public interface IdaoHotel extends IDaoLocale<Hotel>{

	boolean updateWithPopup(int id, String newHotelName, String newHotelAdresse, String newHotelPhone);
	
}
