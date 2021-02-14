
/**
 *
 * @author Nesa
 */
public class Korpus {

    private int korpus_id;
    private String tip;
    private String velicina;
    private String cena;
    private String datumPravljenja;

    public Korpus(int korpus_id, String tip, String velicina, String cena, String datumPravljenja) {
        this.korpus_id = korpus_id;
        this.tip = tip;
        this.velicina = velicina;
        this.cena = cena;
        this.datumPravljenja = datumPravljenja;
    }

    public Korpus() {
    }

    public int getKorpus_id() {
        return korpus_id;
    }

    public void setKorpus_id(int korpus_id) {
        this.korpus_id = korpus_id;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getVelicina() {
        return velicina;
    }

    public void setVelicina(String velicina) {
        this.velicina = velicina;
    }

    public String getCena() {
        return cena;
    }

    public void setCena(String cena) {
        this.cena = cena;
    }

    public String getDatumPravljenja() {
        return datumPravljenja;
    }

    public void setDatumPravljenja(String datumPravljenja) {
        this.datumPravljenja = datumPravljenja;
    }

    @Override
    public String toString() {
        return "Korpus{" + "korpus_id=" + korpus_id + ", tip=" + tip + ", velicina=" + velicina + ", cena=" + cena + ", datumPravljenja=" + datumPravljenja + '}';
    }

}
