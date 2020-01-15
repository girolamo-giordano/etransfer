/**
 * 
 */
package entita;

import utenti.Autista;

/**
 * @author Girolamo
 *
 */
public class Autobus {
	
	private String modello;
	private int numeroposti;
	private int annoimm;
	private int chilometri;
	private Autista autista;
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
	 * Questo è il costruttore vuoto dell'Autobus
	 */
	public Autobus() {
		
	}
	
	/**
	 * Questo è il costruttore dell'autobus dove vengono passati come parametri modello, numero dei posti,
	 * anno dell'immatricolazione e i chilometri
	 * 
	 * @param modello è il modello
	 * @param numeroposti è il numero dei posti
	 * @param annoimm è l'anno di immatricolazione
	 * @param chilometri sono i chilometri
	 */
	public Autobus(String modello,int numeroposti,int annoimm,int chilometri,Autista autista)
	{
		this.modello=modello;
		this.numeroposti=numeroposti;
		this.annoimm=annoimm;
		this.chilometri=chilometri;
		this.autista=autista;
	}
	
	/**
	 * @return modello restituisce un modello
	 */
	public String getModello() {
		return modello;
	}
	/**
	 * @param modello è il modello
	 */
	public void setModello(String modello) {
		this.modello = modello;
	}
	
	public Autista getAutista() {
		return autista;
	}
	
	public void setAutista(Autista autista)
	{
		this.autista=autista;
	}
	/**
	 * @return numeroposti restituisce il numero dei posti
	 */
	public int getNumeroposti() {
		return numeroposti;
	}
	/**
	 * @param numeroposti è il numero di posti
	 */
	public void setNumeroposti(int numeroposti) {
		this.numeroposti = numeroposti;
	}
	/**
	 * @return annoimm restituisce l'anno di immatricolazione
	 */
	public int getAnnoimm() {
		return annoimm;
	}
	/**
	 * @param annoimm è l'anno di immatricolazione
	 */
	public void setAnnoimm(int annoimm) {
		this.annoimm = annoimm;
	}
	/**
	 * @return chilometri restituisce il numero di chilometri
	 */
	public int getChilometri() {
		return chilometri;
	}
	/**
	 * @param chilometri sono i chilometri
	 */
	public void setChilometri(int chilometri) {
		this.chilometri = chilometri;
	}


	@Override
	public String toString() {
		return "Autobus [modello=" + modello + ", numeroposti=" + numeroposti + ", annoimm=" + annoimm + ", chilometri="
				+ chilometri + "]";
	}
	
	
	

}
