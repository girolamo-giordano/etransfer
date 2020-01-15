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


import utenti.Autista;
import utils.DriverManagerConnectionPool;

/**
 * @author Gino
 *
 */
public class AutistaDAO implements DaoModel<Autista> {

	@Override
	public Autista doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Autista autista = new Autista();
		String selectSQL = "SELECT * FROM autista WHERE CODE = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				autista.setId(rs.getInt("code"));
				autista.setNome(rs.getString("nome"));
				autista.setCognome(rs.getString("cognome"));
				autista.setUsername(rs.getString("username"));
				autista.setPassword(rs.getString("password"));
			
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return autista;
	}

	@Override
	public Collection<Autista> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Autista> autisti = new LinkedList<Autista>();
		String selectSQL = "SELECT * FROM autista";
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.getConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedStatement.toString());
			
			//Eseguo il preparedStatement e ne salvo l'output
			ResultSet rs = preparedStatement.executeQuery();
			
			//Visito tupla per tupla la risposta
			while(rs.next()) {
				Autista man= new Autista();
				man.setId(rs.getInt("code"));
				man.setNome(rs.getString("nome"));
				man.setCognome(rs.getString("cognome"));
				man.setUsername(rs.getString("username"));
				man.setPassword(rs.getString("password"));
				//Aggiungo il bean che ho appena creato alla Collezione
				autisti.add(man);
			}	
		} finally {
			try {
				//Rilascio il preparedStatement
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				//Se rilascio fuori dal try finally pi� interno la connessione se venisse lanciata un'eccezione
				//dalla chiusura di preparedStatement la connessione non verrebbe rilasciata
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return autisti;
	}

	@Override
	public void doSave(Autista autista) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perch� � un int autoincrement
		String selectSQL = "INSERT INTO autista (username,password,nome, cognome) VALUES (?,?, ?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.getConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, autista.getUsername());
			preparedStatement.setString(2, autista.getPassword());
			preparedStatement.setString(3, autista.getNome());
			preparedStatement.setString(4, autista.getCognome());
			
			System.out.println("doSave: " + preparedStatement.toString());
			
			//Eseguo il preparedStatement inserendo i dati all'interno del database
			preparedStatement.executeUpdate();
			//rendo effettivo l'inserimento (azione necessaria perch� ho settato l'autocommit a false nel driver manager)
			connection.commit();
		} finally {
			try {
				//Rilascio il preparedStatement
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				//Se rilascio fuori dal try finally pi� interno la connessione se venisse lanciata un'eccezione
				//dalla chiusura di preparedStatement la connessione non verrebbe rilasciata
					DriverManagerConnectionPool.releaseConnection(connection);
				}
			}
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Autista autista) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE autista SET"+" nome=?, cognome=?,username=?, password=?  "+" WHERE username = ?";
		try {
				connection=DriverManagerConnectionPool.getConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setString(1,autista.getNome());
				preparedStatement.setString(2,autista.getCognome());
				preparedStatement.setString(3,autista.getUsername());
				preparedStatement.setString(4,autista.getPassword());
				preparedStatement.setString(5,autista.getUsername());
				System.out.println("doUpdate: "+preparedStatement.toString());
				preparedStatement.executeUpdate();
				
				connection.commit();

		}
		finally //uso il try solo per il finally, cos� da rilasciare tutte le risorse
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
	public boolean doDelete(Autista autista) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM autista WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.getConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,autista.getId());
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
