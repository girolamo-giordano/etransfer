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

import entita.Richiestacorsa;
import utils.DriverManagerConnectionPool;

/**
 * @author Gino
 *
 */
public class RichiestaCorsaDAO implements DaoModel<Richiestacorsa> {
	TrattaDAO trattad= new TrattaDAO();
	AutobusDAO autobusd= new AutobusDAO();

	@Override
	public Richiestacorsa doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Richiestacorsa richiestacorsa = new Richiestacorsa();
		String selectSQL = "SELECT * FROM richiestacorsa WHERE CODE = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				richiestacorsa.setId(rs.getInt("code"));
				richiestacorsa.setOrapart(rs.getString("orapartenza"));
				richiestacorsa.setDatapart(rs.getString("datapartenza"));
				richiestacorsa.setTratta(trattad.doRetrieveByKey(rs.getInt("id_tratta")));
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return richiestacorsa;
	}

	@Override
	public Collection<Richiestacorsa> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Richiestacorsa> richiestecorse = new LinkedList<Richiestacorsa>();
		String selectSQL = "SELECT * FROM richiestacorsa";
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
				Richiestacorsa man= new Richiestacorsa();
				man.setId(rs.getInt("code"));
				man.setDatapart(rs.getString("datapartenza"));
				man.setOrapart(rs.getString("orapartenza"));
				man.setTratta(trattad.doRetrieveByKey(rs.getInt("id_tratta")));
				//Aggiungo il bean che ho appena creato alla Collezione
				richiestecorse.add(man);
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
		
		return richiestecorse;
	}

	@Override
	public void doSave(Richiestacorsa richiestacorsa) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perch� � un int autoincrement
		String selectSQL = "INSERT INTO richiestacorsa (orapartenza,datapartenza,id_tratta) VALUES (?,?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.getConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1,richiestacorsa.getOrapart());
			preparedStatement.setString(2,richiestacorsa.getDatapart());
			preparedStatement.setInt(3, richiestacorsa.getTratta().getId());
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
	public void doUpdate(Richiestacorsa richiestacorsa ) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE richiestacorsa SET"+" orapartenza=?,datapartenza=?,id_tratta=?"+" WHERE code = ?";
		try {
				connection=DriverManagerConnectionPool.getConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setString(1,richiestacorsa.getOrapart());
				preparedStatement.setString(2,richiestacorsa.getDatapart());
				preparedStatement.setInt(3,richiestacorsa.getTratta().getId());
				preparedStatement.setInt(4, richiestacorsa.getId());
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
	public boolean doDelete(Richiestacorsa richiestacorsa) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM richiestacorsa WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.getConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,richiestacorsa.getId());
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
