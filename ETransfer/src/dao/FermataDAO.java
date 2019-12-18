/**
 * 
 */
package dao;

import java.sql.SQLException;
import java.util.Collection;

import entita.Fermata;

/**
 * @author Gino
 *
 */
public class FermataDAO implements DaoModel<Fermata> {

	@Override
	public Fermata doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Fermata> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Fermata product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Fermata product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Fermata product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
