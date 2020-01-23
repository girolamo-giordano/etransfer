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

import entita.Fermata;
import utils.DriverManagerConnectionPool;

/**
 * @author Gino
 *
 */
public class FermataDAO implements DaoModel<Fermata> {
	static CorsaDAO corsadao= new CorsaDAO();
	@Override
	public Fermata doRetrieveByKey(int code) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Fermata fermata = new Fermata();
		String selectSQL = "SELECT * FROM fermata WHERE CODE = ?";
		
		try {
			connection = DriverManagerConnectionPool.createDBConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				fermata.setId(rs.getInt("code"));
				fermata.setNomefermata(rs.getString("nomefermata"));
				fermata.setCorsa(corsadao.doRetrieveByKey(rs.getInt("id_corsa")));
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return fermata;
	}

	@Override
	public Collection<Fermata> doRetrieveAll() throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Fermata> fermate = new LinkedList<Fermata>();
		String selectSQL = "SELECT * FROM fermata";
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
				Fermata man= new Fermata();
				man.setId(rs.getInt("code"));
				man.setNomefermata(rs.getString("nomefermata"));
				man.setCorsa(corsadao.doRetrieveByKey(rs.getInt("id_corsa")));
				//Aggiungo il bean che ho appena creato alla Collezione
				fermate.add(man);
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
		
		return fermate;
	}

	@Override
	public void doSave(Fermata fermata) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perchè è un int autoincrement
		String selectSQL = "INSERT INTO fermata (id_corsa,nomefermata) VALUES (?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.createDBConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, fermata.getCorsa().getId());
			preparedStatement.setString(2,fermata.getNomefermata());
			CorsaDAO corsad= new CorsaDAO();
			corsad.doRetrieveAll();
			

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
	public void doUpdate(Fermata fermata) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE fermata SET"+" id_corsa=?, nomefermata=? "+" WHERE code = ?";
		try {
				connection=DriverManagerConnectionPool.createDBConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setInt(1,fermata.getCorsa().getId());
				preparedStatement.setString(2,fermata.getNomefermata());
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
	public boolean doDelete(Fermata fermata) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM fermata WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.createDBConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,fermata.getId());
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
