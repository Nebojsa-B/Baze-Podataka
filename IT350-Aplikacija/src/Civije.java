

/**
 *
 * @author Nesa
 */
public class Civije {
    private int civije_id;
    private String tip;

    public Civije() {
    }

    public Civije(int civije_id, String tip) {
        this.civije_id = civije_id;
        this.tip = tip;
    }

    public int getCivije_id() {
        return civije_id;
    }

    public void setCivije_id(int civije_id) {
        this.civije_id = civije_id;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }
    
}
