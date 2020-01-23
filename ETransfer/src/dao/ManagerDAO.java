/**
 * 
 */
package dao;

import java.sql.Connection;
import utils.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

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
	public Collection<Manager> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Manager> managers = new LinkedList<Manager>();
		String selectSQL = "SELECT * FROM manager";
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
				Manager man= new Manager();
				man.setId(rs.getInt("code"));
				man.setNome(rs.getString("nome"));
				man.setCognome(rs.getString("cognome"));
				man.setUsername(rs.getString("username"));
				man.setPassword(rs.getString("password"));
				//Aggiungo il bean che ho appena creato alla Collezione
				managers.add(man);
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
		
		return managers;
	}

	@Override
	public void doSave(Manager manager) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perchè è un int autoincrement
		String selectSQL = "INSERT INTO manager (username,password,nome, cognome) VALUES (?,?, ?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.createDBConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, manager.getUsername());
			preparedStatement.setString(2, manager.getPassword());
			preparedStatement.setString(3,manager.getNome());
			preparedStatement.setString(4, manager.getCognome());
			
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
	public void doUpdate(Manager manager) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE manager SET"+" nome=?, cognome=?,username=?, password=?  "+" WHERE username = ?";
		try {
				connection=DriverManagerConnectionPool.createDBConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setString(1,manager.getNome());
				preparedStatement.setString(2,manager.getCognome());
				preparedStatement.setString(3,manager.getUsername());
				preparedStatement.setString(4,manager.getPassword());
				preparedStatement.setString(5,manager.getUsername());
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
	public boolean doDelete(Manager manager) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM manager WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.createDBConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,manager.getId());
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
