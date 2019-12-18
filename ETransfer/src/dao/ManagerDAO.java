/**
 * 
 */
package dao;

import java.sql.SQLException;
import java.util.Collection;

import utenti.Manager;

/**
 * @author Gino
 *
 */
public class ManagerDAO implements DaoModel<Manager> {

	@Override
	public Manager doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Manager> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Manager product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Manager product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Manager product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
