/**
 * 
 */
package entita;

/**
 * @author Gino
 *
 */
public class Tratta {
	
	private String partenza;
	private String arrivo;
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
	public Tratta() {
		
	}
	/**
	 * @param partenza
	 * @param arrivo
	 */
	public Tratta(String partenza, String arrivo) {
		this.partenza = partenza;
		this.arrivo = arrivo;
	}
	/**
	 * @return the partenza
	 */
	public String getPartenza() {
		return partenza;
	}
	/**
	 * @param partenza the partenza to set
	 */
	public void setPartenza(String partenza) {
		this.partenza = partenza;
	}
	/**
	 * @return the arrivo
	 */
	public String getArrivo() {
		return arrivo;
	}
	/**
	 * @param arrivo the arrivo to set
	 */
	public void setArrivo(String arrivo) {
		this.arrivo = arrivo;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Tratta [partenza=" + partenza + ", arrivo=" + arrivo + "]";
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((arrivo == null) ? 0 : arrivo.hashCode());
		result = prime * result + ((partenza == null) ? 0 : partenza.hashCode());
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
		Tratta other = (Tratta) obj;
		if (arrivo == null) {
			if (other.arrivo != null)
				return false;
		} else if (!arrivo.equals(other.arrivo))
			return false;
		if (partenza == null) {
			if (other.partenza != null)
				return false;
		} else if (!partenza.equals(other.partenza))
			return false;
		return true;
	}
	
	
	
	
	

}
