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
	private int numerocor;
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
	public Richiestacorsa(String orapart, String datapart, int durata, int numerocor) {
		
		this.orapart = orapart;
		this.datapart = datapart;
		this.durata = durata;
		this.numerocor = numerocor;
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
	/**
	 * @return the numerocor
	 */
	public int getNumerocor() {
		return numerocor;
	}
	/**
	 * @param numerocor the numerocor to set
	 */
	public void setNumerocor(int numerocor) {
		this.numerocor = numerocor;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Richiestacorsa [orapart=" + orapart + ", datapart=" + datapart + ", durata=" + durata + ", numerocor="
				+ numerocor + "]";
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((datapart == null) ? 0 : datapart.hashCode());
		result = prime * result + durata;
		result = prime * result + numerocor;
		result = prime * result + ((orapart == null) ? 0 : orapart.hashCode());
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
		Richiestacorsa other = (Richiestacorsa) obj;
		if (datapart == null) {
			if (other.datapart != null)
				return false;
		} else if (!datapart.equals(other.datapart))
			return false;
		if (durata != other.durata)
			return false;
		if (numerocor != other.numerocor)
			return false;
		if (orapart == null) {
			if (other.orapart != null)
				return false;
		} else if (!orapart.equals(other.orapart))
			return false;
		return true;
	}
	
	

}
