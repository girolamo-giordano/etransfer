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

import entita.Biglietto;
import utils.DriverManagerConnectionPool;

/**
 * @author Gino
 *
 */
public class BigliettoDAO implements DaoModel<Biglietto> {
	ClienteDAO clientedao= new ClienteDAO();
	CorsaDAO corsadao= new CorsaDAO();

	@Override
	public Biglietto doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Biglietto biglietto = new Biglietto();
		String selectSQL = "SELECT * FROM biglietto WHERE CODE = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				biglietto.setNumerobigl(rs.getInt("code"));
				biglietto.setCliente(clientedao.doRetrieveByKey(rs.getInt("id_cliente")));
				biglietto.setCorsa(corsadao.doRetrieveByKey(rs.getInt("id_corsa")));
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return biglietto;
	}

	@Override
	public Collection<Biglietto> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Biglietto> biglietti = new LinkedList<Biglietto>();
		String selectSQL = "SELECT * FROM biglietto";
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
				Biglietto man= new Biglietto();
				man.setNumerobigl(rs.getInt("code"));
				man.setCliente(clientedao.doRetrieveByKey(rs.getInt("id_cliente")));
				man.setCorsa(corsadao.doRetrieveByKey(rs.getInt("id_corsa")));
				//Aggiungo il bean che ho appena creato alla Collezione
				biglietti.add(man);
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
		
		return biglietti;
	}

	@Override
	public void doSave(Biglietto biglietto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perchè è un int autoincrement
		String selectSQL = "INSERT INTO biglietto (id_cliente,id_corsa) VALUES (?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.getConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, biglietto.getCliente().getId());
			preparedStatement.setInt(2, biglietto.getCorsa().getId());
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
	public void doUpdate(Biglietto biglietto) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE biglietto SET"+" id_cliente=?, id_corsa=? "+" WHERE code = ?";
		try {
				connection=DriverManagerConnectionPool.getConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setInt(1,biglietto.getCliente().getId());
				preparedStatement.setInt(2,biglietto.getCorsa().getId());
				preparedStatement.setInt(3, biglietto.getNumerobigl());
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
	public boolean doDelete(Biglietto biglietto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM biglietto WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.getConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,biglietto.getNumerobigl());
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
