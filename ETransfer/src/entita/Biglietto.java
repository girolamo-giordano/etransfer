/**
 * 
 */
package entita;

import utenti.Cliente;

/**
 * @author Gino
 *
 */
public class Biglietto {
	
	private int numerobigl;
	private Corsa corsa;
	private Cliente cliente;
	private int quantita;
	private String acquistodata;
	
	/**
	 * 
	 */
	public Biglietto() {
		
	}
	/**
	 * @param numerobigl
	 * @param corsa
	 * @param cliente
	 */
	public Biglietto(int numerobigl, Corsa corsa, Cliente cliente,int quantita, String acquistodata) {
		super();
		this.numerobigl = numerobigl;
		this.corsa = corsa;
		this.cliente = cliente;
		this.quantita=quantita;
		this.acquistodata=acquistodata;
	}
	/**
	 * @return the numerobigl
	 */
	public int getNumerobigl() {
		return numerobigl;
	}
	/**
	 * @param numerobigl the numerobigl to set
	 */
	public void setNumerobigl(int numerobigl) {
		this.numerobigl = numerobigl;
	}
	/**
	 * @return the corsa
	 */
	public Corsa getCorsa() {
		return corsa;
	}
	/**
	 * @param corsa the corsa to set
	 */
	public void setCorsa(Corsa corsa) {
		this.corsa = corsa;
	}
	/**
	 * @return the cliente
	 */
	public Cliente getCliente() {
		return cliente;
	}
	/**
	 * @param cliente the cliente to set
	 */
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	
	/**
	 * @return the quantita
	 */
	public int getQuantita() {
		return quantita;
	}
	/**
	 * @param quantita the quantita to set
	 */
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	/**
	 * @return the acquistodata
	 */
	public String getAcquistodata() {
		return acquistodata;
	}
	/**
	 * @param acquistodata the acquistodata to set
	 */
	public void setAcquistodata(String acquistodata) {
		this.acquistodata = acquistodata;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Biglietto [numerobigl=" + numerobigl + ", corsa=" + corsa + ", cliente=" + cliente + "]";
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cliente == null) ? 0 : cliente.hashCode());
		result = prime * result + ((corsa == null) ? 0 : corsa.hashCode());
		result = prime * result + numerobigl;
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Biglietto other = (Biglietto) obj;
		if (cliente == null) {
			if (other.cliente != null)
				return false;
		} else if (!cliente.equals(other.cliente))
			return false;
		if (corsa == null) {
			if (other.corsa != null)
				return false;
		} else if (!corsa.equals(other.corsa))
			return false;
		if (numerobigl != other.numerobigl)
			return false;
		return true;
	}
	
	
	
	

}
