/**
 * 
 */
package entita;

/**
 * @author Gino
 *
 */
public class Fermata {
	
	private String nomefermata;
	private int numerocorsa;
	
	
	/**
	 * 
	 */
	public Fermata() {
		
	}
	/**
	 * @param nomefermata
	 */
	public Fermata(String nomefermata,int numerocorsa) {
		this.nomefermata = nomefermata;
		this.numerocorsa=numerocorsa;
	}
	/**
	 * @return the nomefermata
	 */
	public String getNomefermata() {
		return nomefermata;
	}
	/**
	 * @param nomefermata the nomefermata to set
	 */
	public void setNomefermata(String nomefermata) {
		this.nomefermata = nomefermata;
	}
	
	public int getNumeroCorsa()
	{
		return numerocorsa;
	}
	
	public void setNumeroCorsa(int numerocorsa)
	{
		this.numerocorsa=numerocorsa;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Fermata [nomefermata=" + nomefermata + ", numerocorsa=" + numerocorsa + "]";
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nomefermata == null) ? 0 : nomefermata.hashCode());
		result = prime * result + numerocorsa;
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
		Fermata other = (Fermata) obj;
		if (nomefermata == null) {
			if (other.nomefermata != null)
				return false;
		} else if (!nomefermata.equals(other.nomefermata))
			return false;
		if (numerocorsa != other.numerocorsa)
			return false;
		return true;
	}
	
	
	
	

}
