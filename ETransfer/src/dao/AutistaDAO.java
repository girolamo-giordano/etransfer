/**
 * 
 */
package dao;

import java.sql.SQLException;
import java.util.Collection;

import utenti.Autista;

/**
 * @author Gino
 *
 */
public class AutistaDAO implements DaoModel<Autista> {

	@Override
	public Autista doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Autista> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Autista product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Autista product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Autista product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
