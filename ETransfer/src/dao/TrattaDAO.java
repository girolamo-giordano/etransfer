/**
 * 
 */
package dao;

import java.sql.SQLException;
import java.util.Collection;

import entita.Tratta;

/**
 * @author Gino
 *
 */
public class TrattaDAO implements DaoModel<Tratta> {

	@Override
	public Tratta doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Tratta> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Tratta product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Tratta product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Tratta product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
