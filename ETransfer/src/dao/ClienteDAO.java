/**
 * 
 */
package dao;

import java.sql.SQLException;
import java.util.Collection;

import utenti.Cliente;

/**
 * @author Gino
 *
 */
public class ClienteDAO implements DaoModel<Cliente> {

	@Override
	public Cliente doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Cliente> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Cliente product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Cliente product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Cliente product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
