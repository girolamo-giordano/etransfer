/**
 * 
 */
package dao;

import java.sql.SQLException;
import java.util.Collection;

import entita.Biglietto;

/**
 * @author Gino
 *
 */
public class BigliettoDAO implements DaoModel<Biglietto> {

	@Override
	public Biglietto doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Biglietto> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Biglietto product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Biglietto product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Biglietto product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	
}
