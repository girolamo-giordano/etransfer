/**
 * 
 */
package dao;

import java.sql.SQLException;
import java.util.Collection;

import entita.Corsa;

/**
 * @author Gino
 *
 */
public class CorsaDAO implements DaoModel<Corsa> {

	@Override
	public Corsa doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Corsa> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Corsa product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Corsa product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Corsa product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
