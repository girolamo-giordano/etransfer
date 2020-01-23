/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import entita.Autobus;
import utils.DriverManagerConnectionPool;

/**
 * @author Gino
 *
 */
public class AutobusDAO implements DaoModel<Autobus> {
	
	AutistaDAO autista= new AutistaDAO();

	@Override
	public Autobus doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Autobus autobus = new Autobus();
		String selectSQL = "SELECT * FROM autobus WHERE CODE = ?";
		
		try {
			connection = DriverManagerConnectionPool.createDBConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				autobus.setId(rs.getInt("code"));
 				autobus.setAutista(autista.doRetrieveByKey(rs.getInt("id_autista")));
 				autobus.setAnnoimm(rs.getInt("annoimm"));
 				autobus.setChilometri(rs.getInt("chilometri"));
 				autobus.setModello(rs.getString("modello"));
 				autobus.setNumeroposti(rs.getInt("numeroposti"));
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return autobus;
	}

	@Override
	public Collection<Autobus> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Autobus> autobus = new LinkedList<Autobus>();
		String selectSQL = "SELECT * FROM autobus";
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.createDBConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedStatement.toString());
			
			//Eseguo il preparedStatement e ne salvo l'output
			ResultSet rs = preparedStatement.executeQuery();
			
			//Visito tupla per tupla la risposta
			while(rs.next()) {
				Autobus man= new Autobus();
				man.setId(rs.getInt("code"));
				man.setAutista(autista.doRetrieveByKey(rs.getInt("id_autista")));
				man.setChilometri(rs.getInt("chilometri"));
				man.setAnnoimm(rs.getInt("annoimm"));
				man.setNumeroposti(rs.getInt("numeroposti"));
				man.setModello(rs.getString("modello"));
				//Aggiungo il bean che ho appena creato alla Collezione
				autobus.add(man);
			}	
		} finally {
			try {
				//Rilascio il preparedStatement
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				//Se rilascio fuori dal try finally più interno la connessione se venisse lanciata un'eccezione
				//dalla chiusura di preparedStatement la connessione non verrebbe rilasciata
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return autobus;
	}

	@Override
	public void doSave(Autobus autobus) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perchè è un int autoincrement
		String selectSQL = "INSERT INTO autobus (modello,numeroposti,annoimm, chilometri,id_autista) VALUES (?,?, ?,?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.createDBConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, autobus.getModello());
			preparedStatement.setInt(2, autobus.getNumeroposti());
			preparedStatement.setInt(3, autobus.getAnnoimm());
			preparedStatement.setInt(4, autobus.getChilometri());
			preparedStatement.setInt(5, autobus.getAutista().getId());
			
			System.out.println("doSave: " + preparedStatement.toString());
			
			//Eseguo il preparedStatement inserendo i dati all'interno del database
			preparedStatement.executeUpdate();
			//rendo effettivo l'inserimento (azione necessaria perchè ho settato l'autocommit a false nel driver manager)
			connection.commit();
		} finally {
			try {
				//Rilascio il preparedStatement
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				//Se rilascio fuori dal try finally più interno la connessione se venisse lanciata un'eccezione
				//dalla chiusura di preparedStatement la connessione non verrebbe rilasciata
					DriverManagerConnectionPool.releaseConnection(connection);
				}
			}
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Autobus autobus) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE autobus SET"+" modello=?, numeroposti=?, annoimm=?, chilometri=?, id_autista=?  "+" WHERE code = ?";
		try {
				connection=DriverManagerConnectionPool.createDBConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setString(1,autobus.getModello());
				preparedStatement.setInt(2,autobus.getNumeroposti());
				preparedStatement.setInt(3,autobus.getAnnoimm());
				preparedStatement.setInt(4,autobus.getChilometri());
				preparedStatement.setInt(5,autobus.getAutista().getId());
				preparedStatement.setInt(6,autobus.getId());
				System.out.println("doUpdate: "+preparedStatement.toString());
				preparedStatement.executeUpdate();
				
				connection.commit();

		}
		finally //uso il try solo per il finally, così da rilasciare tutte le risorse
		{
			try { //potrebbe esserci un eccezione alla preparedstatement riguardante la connessione
			if(preparedStatement != null)
				preparedStatement.close();
			}finally {
			DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
	}

	@Override
	public boolean doDelete(Autobus autobus) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM autobus WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.createDBConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,autobus.getId());
			System.out.println("doDelete: "+ preparedStatement.toString());
			preparedStatement.executeUpdate();
			connection.commit();
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
					DriverManagerConnectionPool.releaseConnection(connection);
				}	
		}
		return true;
	}

}
