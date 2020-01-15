/**
 * 
 */
package entita;

import java.util.ArrayList;

/**
 * @author Gino
 *
 */
public class Corsa {
	
	private String orapart;
	private String datapart;
	private int durata;
	private int numerocor;
	private Autobus bus;
	private Tratta tratta;
	private ArrayList<Fermata> fermate;
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
	public Corsa() {
	}
	/**
	 * @param orapart
	 * @param datapart
	 * @param durata
	 * @param numerocor
	 * @param bus
	 * @param tratta
	 * @param fermate
	 */
	public Corsa(String orapart, String datapart, int durata, int numerocor, Autobus bus, Tratta tratta,
			ArrayList<Fermata> fermate) {

		this.orapart = orapart;
		this.datapart = datapart;
		this.durata = durata;
		this.numerocor = numerocor;
		this.bus = bus;
		this.tratta = tratta;
		this.fermate = fermate;
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
	/**
	 * @return the bus
	 */
	public Autobus getBus() {
		return bus;
	}
	/**
	 * @param bus the bus to set
	 */
	public void setBus(Autobus bus) {
		this.bus = bus;
	}
	/**
	 * @return the tratta
	 */
	public Tratta getTratta() {
		return tratta;
	}
	/**
	 * @param tratta the tratta to set
	 */
	public void setTratta(Tratta tratta) {
		this.tratta = tratta;
	}
	/**
	 * @return the fermate
	 */
	public ArrayList<Fermata> getFermate() {
		return fermate;
	}
	/**
	 * @param fermate the fermate to set
	 */
	public void setFermate(ArrayList<Fermata> fermate) {
		this.fermate = fermate;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Corsa [orapart=" + orapart + ", datapart=" + datapart + ", durata=" + durata + ", numerocor="
				+ numerocor + ", bus=" + bus + ", tratta=" + tratta + ", fermate=" + fermate + "]";
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bus == null) ? 0 : bus.hashCode());
		result = prime * result + ((datapart == null) ? 0 : datapart.hashCode());
		result = prime * result + durata;
		result = prime * result + ((fermate == null) ? 0 : fermate.hashCode());
		result = prime * result + numerocor;
		result = prime * result + ((orapart == null) ? 0 : orapart.hashCode());
		result = prime * result + ((tratta == null) ? 0 : tratta.hashCode());
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
		Corsa other = (Corsa) obj;
		if (bus == null) {
			if (other.bus != null)
				return false;
		} else if (!bus.equals(other.bus))
			return false;
		if (datapart == null) {
			if (other.datapart != null)
				return false;
		} else if (!datapart.equals(other.datapart))
			return false;
		if (durata != other.durata)
			return false;
		if (fermate == null) {
			if (other.fermate != null)
				return false;
		} else if (!fermate.equals(other.fermate))
			return false;
		if (numerocor != other.numerocor)
			return false;
		if (orapart == null) {
			if (other.orapart != null)
				return false;
		} else if (!orapart.equals(other.orapart))
			return false;
		if (tratta == null) {
			if (other.tratta != null)
				return false;
		} 
		return true;
	}
	
	
	
	
	

}
