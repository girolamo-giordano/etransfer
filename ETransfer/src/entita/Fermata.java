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
	private Corsa corsa;
	private int id;
	
	
	
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	
	
	/**
	 * 
	 */
	public Fermata() {
		
	}
	/**
	 * @param nomefermata
	 */
	public Fermata(String nomefermata,Corsa numerocorsa) {
		this.nomefermata = nomefermata;
		this.corsa=numerocorsa;
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
	
	public Corsa getCorsa()
	{
		return corsa;
	}
	
	public void setCorsa(Corsa corsa)
	{
		this.corsa=corsa;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Fermata [nomefermata=" + nomefermata + ", numerocorsa=" + corsa + "id"+id+"]";
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	
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
		if (corsa != other.corsa)
			return false;
		return true;
	}
	
	
	
	

}
