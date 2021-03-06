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

import utenti.Cliente;
import utils.DriverManagerConnectionPool;

/**
 * @author Gino
 *
 */
public class ClienteDAO implements DaoModel<Cliente> {

	@Override
	public Cliente doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Cliente cliente = new Cliente();
		String selectSQL = "SELECT * FROM cliente WHERE CODE = ?";
		
		try {
			connection = DriverManagerConnectionPool.createDBConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				cliente.setId(rs.getInt("code"));
 				cliente.setNome(rs.getString("name"));
				cliente.setCognome(rs.getString("cognome"));
				cliente.setUsername(rs.getString("username"));
				cliente.setPassword(rs.getString("password"));
				cliente.setEmail(rs.getString("email"));
				cliente.setIndirizzo(rs.getString("indirizzo"));
				cliente.setCitta(rs.getString("citta"));
				cliente.setNumerotel(rs.getString("numerotelefono"));
			
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return cliente;
	}

	@Override
	public Collection<Cliente> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Cliente> clienti = new LinkedList<Cliente>();
		String selectSQL = "SELECT * FROM cliente";
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
				Cliente man= new Cliente();
				man.setId(rs.getInt("code"));
				man.setNome(rs.getString("name"));
				man.setCognome(rs.getString("cognome"));
				man.setUsername(rs.getString("username"));
				man.setPassword(rs.getString("password"));
				man.setIndirizzo(rs.getString("indirizzo"));
				man.setEmail(rs.getString("email"));
				man.setCitta(rs.getString("citta"));
				man.setNumerotel(rs.getString("numerotelefono"));
				//Aggiungo il bean che ho appena creato alla Collezione
				clienti.add(man);
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
		
		return clienti;
	}

	@Override
	public void doSave(Cliente cliente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perch� � un int autoincrement
		String selectSQL = "INSERT INTO cliente (name,cognome,username,password,email,numerotelefono,indirizzo,citta) VALUES (?,?, ?,?,?,?,?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.createDBConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, cliente.getNome());
			preparedStatement.setString(2, cliente.getCognome());
			preparedStatement.setString(3, cliente.getUsername());
			preparedStatement.setString(4, cliente.getPassword());
			preparedStatement.setString(5, cliente.getEmail());
			preparedStatement.setString(6, cliente.getNumerotel());
			preparedStatement.setString(7, cliente.getIndirizzo());
			preparedStatement.setString(8, cliente.getCitta());
			
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
	public void doUpdate(Cliente cliente) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE cliente SET"+" name=?,cognome=?,username=?,password=?,email=?,numerotelefono=?,indirizzo=?,citta=?  "+" WHERE username = ?";
		try {
				connection=DriverManagerConnectionPool.createDBConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setString(1,cliente.getNome());
				preparedStatement.setString(2,cliente.getCognome());
				preparedStatement.setString(3,cliente.getUsername());
				preparedStatement.setString(4,cliente.getPassword());
				preparedStatement.setString(5,cliente.getEmail());
				preparedStatement.setString(6,cliente.getNumerotel());
				preparedStatement.setString(7,cliente.getIndirizzo());
				preparedStatement.setString(8,cliente.getCitta());
				preparedStatement.setString(9,cliente.getUsername());
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
	public boolean doDelete(Cliente cliente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String deleteSql="DELETE FROM cliente WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.createDBConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,cliente.getId());
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
