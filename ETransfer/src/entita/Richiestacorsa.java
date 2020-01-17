/**
 * 
 */
package entita;

/**
 * @author Gino
 *
 */
public class Richiestacorsa {
	
	private String orapart;
	private String datapart;
	private int durata;
	private int id;
	private Tratta tratta;
	
	
	
	
	
	
	public Tratta getTratta() {
		return tratta;
	}

	public void setTratta(Tratta tratta) {
		this.tratta = tratta;
	}

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
	public Richiestacorsa() {
		
	}
	/**
	 * @param orapart
	 * @param datapart
	 * @param durata
	 * @param numerocor
	 */
	public Richiestacorsa(String orapart, String datapart, int durata) {
		
		this.orapart = orapart;
		this.datapart = datapart;
		this.durata = durata;
	}
	/**
	 * @return the orapart
	 */
	public String getOrapart() {
		return orapart;
	}
	/**
	 * @param orapart the orapart to set
	 */
	public void setOrapart(String orapart) {
		this.orapart = orapart;
	}
	/**
	 * @return the datapart
	 */
	public String getDatapart() {
		return datapart;
	}
	/**
	 * @param datapart the datapart to set
	 */
	public void setDatapart(String datapart) {
		this.datapart = datapart;
	}
	/**
	 * @return the durata
	 */
	public int getDurata() {
		return durata;
	}
	/**
	 * @param durata the durata to set
	 */
	public void setDurata(int durata) {
		this.durata = durata;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Richiestacorsa [orapart=" + orapart + ", datapart=" + datapart + ", durata=" + durata + ", numerocor="
			+ "]";
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
		Richiestacorsa other = (Richiestacorsa) obj;
		if (datapart == null) {
			if (other.datapart != null)
				return false;
		} else if (!datapart.equals(other.datapart))
			return false;
		if (durata != other.durata)
			return false;
	
		if (orapart == null) {
			if (other.orapart != null)
				return false;
		} else if (!orapart.equals(other.orapart))
			return false;
		return true;
	}
	
	

}
