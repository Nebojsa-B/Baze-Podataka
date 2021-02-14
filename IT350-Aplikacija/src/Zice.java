

/**
 *
 * @author Nesa
 */
public class Zice {
  
    private int zice_id;
    private int tip;
    private String datumPravljena;

    public Zice() {
    }

    public Zice(int zice_id, int tip, String datumPravljena) {
        this.zice_id = zice_id;
        this.tip = tip;
        this.datumPravljena = datumPravljena;
    }

    

    public int getZice_id() {
        return zice_id;
    }

    public void setZice_id(int zice_id) {
        this.zice_id = zice_id;
    }

    public int getTip() {
        return tip;
    }

    public void setTip(int tip) {
        this.tip = tip;
    }

    public String getDatumPravljena() {
        return datumPravljena;
    }

    public void setDatumPravljena(String datumPravljena) {
        this.datumPravljena = datumPravljena;
    }

    @Override
    public String toString() {
        return "Zice{" + "zice_id=" + zice_id + ", tip=" + tip + ", datumPravljena=" + datumPravljena + '}';
    }
    
}
