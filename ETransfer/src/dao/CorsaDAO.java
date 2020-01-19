/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import entita.Corsa;
import entita.Fermata;
import entita.Tratta;
import utils.DriverManagerConnectionPool;

/**
 * @author Gino
 *
 */
public class CorsaDAO implements DaoModel<Corsa> {
	TrattaDAO trattad= new TrattaDAO();
	AutobusDAO autobusd= new AutobusDAO();
	
	public Corsa doRetrieveByKeyFer(int code)throws SQLException
	{
		return null;
		
	}
	

	@Override
	public Corsa doRetrieveByKey(int code) throws SQLException {
		FermataDAO fermatad=new FermataDAO();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ArrayList<Fermata> fermateagg= new ArrayList<Fermata>();
		
		Corsa corsa = new Corsa();
		String selectSQL = "SELECT * FROM corsa WHERE CODE = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				corsa.setId(rs.getInt("code"));
 				corsa.setTratta(trattad.doRetrieveByKey(rs.getInt("id_tratta")));
 				corsa.setBus(autobusd.doRetrieveByKey(rs.getInt("id_autobus")));
 				corsa.setOrapart(rs.getString("orapartenza"));
				corsa.setDatapart(rs.getString("datapartenza"));
				corsa.setDurata(rs.getInt("durata"));
				corsa.setCosto(rs.getFloat("costo"));
				corsa.setFermate(null);
			
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return corsa;
	}

	@Override
	public Collection<Corsa> doRetrieveAll() throws SQLException {
		FermataDAO fermatad=new FermataDAO();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Corsa> corse = new LinkedList<Corsa>();
		ArrayList<Fermata> fermateagg= new ArrayList<Fermata>();
		String selectSQL = "SELECT * FROM corsa";
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
				Corsa man= new Corsa();
				man.setId(rs.getInt("code"));
				man.setBus(autobusd.doRetrieveByKey(rs.getInt("id_autobus")));
				man.setFermate(null);
				man.setTratta(trattad.doRetrieveByKey(rs.getInt("id_tratta")));
				man.setDatapart(rs.getString("datapartenza"));
				man.setOrapart(rs.getString("orapartenza"));
				man.setDurata(rs.getInt("durata"));
				man.setCosto(rs.getFloat("costo"));
				//Aggiungo il bean che ho appena creato alla Collezione
				corse.add(man);
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
		
		return corse;
	}

	@Override
	public void doSave(Corsa corsa) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perchè è un int autoincrement
		String selectSQL = "INSERT INTO corsa (id_tratta,id_autobus,orapartenza,datapartenza,durata,costo) VALUES (?,?,?,?,?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.getConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, corsa.getTratta().getId());
			preparedStatement.setInt(2, corsa.getBus().getId());
			preparedStatement.setString(3,corsa.getOrapart());
			preparedStatement.setString(4,corsa.getDatapart());
			preparedStatement.setInt(5,corsa.getDurata());
			preparedStatement.setFloat(6, corsa.getCosto());
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
	public void doUpdate(Corsa corsa) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE corsa SET"+" id_tratta=?,id_autobus=?,orapartenza=?,datapartenza=?,durata=?,costo=?"+" WHERE code = ?";
		try {
				connection=DriverManagerConnectionPool.getConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setInt(1,corsa.getTratta().getId());
				preparedStatement.setInt(2,corsa.getBus().getId());
				preparedStatement.setString(3, corsa.getOrapart());
				preparedStatement.setString(4, corsa.getDatapart());
				preparedStatement.setInt(5,corsa.getDurata());
				preparedStatement.setFloat(6, corsa.getCosto());
				preparedStatement.setInt(7,corsa.getId());
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
	public boolean doDelete(Corsa corsa) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM corsa WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.getConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,corsa.getId());
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
	
	public boolean doDelete(Tratta tratta) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM corsa WHERE id_tratta=?";
		try {
			connection= DriverManagerConnectionPool.getConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,tratta.getId());
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
