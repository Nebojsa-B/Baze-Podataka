

/**
 *
 * @author Nesa
 */
public class Kobilica {
   private int kobilica_id;

    public Kobilica() {
    }

    public Kobilica(int kobilica_id) {
        this.kobilica_id = kobilica_id;
    }

    public int getKobilica_id() {
        return kobilica_id;
    }

    public void setKobilica_id(int kobilica_id) {
        this.kobilica_id = kobilica_id;
    }

    @Override
    public String toString() {
        return "Kobilica{" + "kobilica_id=" + kobilica_id + '}';
    }
   
}
