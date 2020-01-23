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

import entita.Richiestatratta;
import utils.DriverManagerConnectionPool;

/**
 * @author Gino
 *
 */
public class RichiestatrattaDAO implements DaoModel<Richiestatratta> {

	@Override
	public Richiestatratta doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Richiestatratta richiestatratta = new Richiestatratta();
		String selectSQL = "SELECT * FROM richiestatratta WHERE CODE = ?";
		
		try {
			connection = DriverManagerConnectionPool.createDBConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				richiestatratta.setId(rs.getInt("code"));
				richiestatratta.setArrivo(rs.getString("cittadiarr"));
				richiestatratta.setPartenza(rs.getString("cittapartenza"));
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return richiestatratta;
	}

	@Override
	public Collection<Richiestatratta> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Richiestatratta> richiestetratte = new LinkedList<Richiestatratta>();
		String selectSQL = "SELECT * FROM richiestatratta";
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
				Richiestatratta man= new Richiestatratta();
				man.setId(rs.getInt("code"));
				man.setArrivo(rs.getString("cittadiarr"));
				man.setPartenza(rs.getString("cittapartenza"));
				//Aggiungo il bean che ho appena creato alla Collezione
				richiestetratte.add(man);
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
		
		return richiestetratte;
	}

	@Override
	public void doSave(Richiestatratta richiestatratta) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perchè è un int autoincrement
		String selectSQL = "INSERT INTO richiestatratta (cittapartenza,cittadiarr) VALUES (?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.createDBConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1,richiestatratta.getPartenza());
			preparedStatement.setString(2,richiestatratta.getArrivo());
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
	public void doUpdate(Richiestatratta richiestatratta) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE richiestatratta SET"+" cittapartenza=?,cittadiarr=? "+" WHERE code = ?";
		try {
				connection=DriverManagerConnectionPool.createDBConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setString(1,richiestatratta.getPartenza());
				preparedStatement.setString(2,richiestatratta.getArrivo());
				preparedStatement.setInt(3, richiestatratta.getId());
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
	public boolean doDelete(Richiestatratta richiestatratta) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM richiestatratta WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.createDBConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,richiestatratta.getId());
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
