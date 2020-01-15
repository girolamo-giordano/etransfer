/**
 * 
 */
package entita;

/**
 * @author Gino
 *
 */
public class Richiestafermata {
	
	private String nomefermata;
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
	public Richiestafermata() {
		
	}

	/**
	 * @param nomefermata
	 */
	public Richiestafermata(String nomefermata) {
		
		this.nomefermata = nomefermata;
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

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Richiestafermata [nomefermata=" + nomefermata + "]";
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nomefermata == null) ? 0 : nomefermata.hashCode());
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
		Richiestafermata other = (Richiestafermata) obj;
		if (nomefermata == null) {
			if (other.nomefermata != null)
				return false;
		} else if (!nomefermata.equals(other.nomefermata))
			return false;
		return true;
	}
	
	
	
	
	

}
