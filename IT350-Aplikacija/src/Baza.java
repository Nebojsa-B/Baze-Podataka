
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author Nesa
 */
public class Baza {

    private static String url = "jdbc:mysql://localhost/gibsondb";
    private static String username = "root";
    private static String pass = "";

    public static void unesiZice(Zice zi) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            Statement st = con.createStatement();

            String upit = "INSERT INTO `zice` (`ZICE_ID`, `TIP`, `DATUM_PRAVLJENJA`) VALUES "
                    + " ( '" + zi.getZice_id() + "', '" + +zi.getTip() + "', '" + zi.getDatumPravljena() + "')";

            st.execute(upit);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void unesiKorpus(Korpus k) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            Statement st = con.createStatement();

            String upit = "INSERT INTO `korpus` (`KORPUS_ID`, `TIP`, `VELICINA`, `CENA`, `DATUM_PRAVLJENJA`) VALUES "
                    + " ( '" + k.getKorpus_id() + "', '" + k.getTip() + "', '" + k.getVelicina() + "', '" + k.getCena() + "', '" + k.getDatumPravljenja() + "')";

            st.execute(upit);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void unesiKobilicu(Kobilica k) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            Statement st = con.createStatement();

            String upit = "INSERT INTO `kobilice` (`KOBILICE_ID`) VALUES "
                    + " ( '" + k.getKobilica_id() + "')";

            st.execute(upit);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void unesiCivije(Civije c) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            Statement st = con.createStatement();

            String upit = "INSERT INTO `civije` (`CIVIJE_ID`, `TIP`) VALUES "
                    + " ( '" + c.getCivije_id() + "', '" + c.getTip() + "')";

            st.execute(upit);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void obrisiZice(int id) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            PreparedStatement st = con.prepareStatement("DELETE FROM zice WHERE ZICE_id = '" + id + "';");

            st.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static void obrisiKorpus(int id) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            PreparedStatement st = con.prepareStatement("DELETE FROM korpus WHERE KORPUS_ID = '" + id + "';");

            st.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static void obrisiKobilice(int id) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            PreparedStatement st = con.prepareStatement("DELETE FROM kobilice WHERE KOBILICE_ID = '" + id + "';");

            st.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static void obrisiCivije(int id) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            PreparedStatement st = con.prepareStatement("DELETE FROM civije WHERE CIVIJE_ID = '" + id + "';");

            st.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static void izmeniZice(String tip, String datumPravljenja, int id) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            PreparedStatement st = con.prepareStatement("UPDATE zice SET TIP = '" + tip + "'," + "DATUM_PRAVLJENJA ='" + datumPravljenja + "' WHERE zice.ZICE_ID = '" + id + "';");

            st.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static void izmeniKorpus(String tip, String velicina, String cena, String datum, int id) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            PreparedStatement st = con.prepareStatement("UPDATE korpus SET TIP = '" + tip + "'," + "VELICINA ='" + velicina + "'," + "CENA ='" + cena + "'," + "DATUM_PRAVLJENJA ='" + datum + "' WHERE korpus.KORPUS_ID = '" + id + "';");

            st.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static void izmeniCivije(String tip, int id) {

        try {
            Connection con = DriverManager.getConnection(url, username, pass);
            PreparedStatement st = con.prepareStatement("UPDATE civije SET TIP = '" + tip + "' WHERE civije.CIVIJE_ID = '" + id + "';");

            st.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static int brojProizvedenihGitara() {

        try {

            Connection con = DriverManager.getConnection(url, username, pass);
            String query = "SELECT COUNT(gitare_id) as Broj_Proizvedenih_Gitara FROM delovizagitare";
            Statement st = (Statement) con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                System.out.println(rs.getInt("Broj_Proizvedenih_Gitara"));
                int br =  rs.getInt("Broj_Proizvedenih_Gitara");

               return br;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
return 1;
    }

    public static String datumZice() {

        try {

            Connection con = DriverManager.getConnection(url, username, pass);
            String query = "SELECT datum_pravljenja as d From zice HAVING COUNT(zice_id)";
            Statement st = (Statement) con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                System.out.println(rs.getString("d"));
return rs.getString("d");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
return "";
    }

    public static String najskupljiKorpus() {

        try {

            Connection con = DriverManager.getConnection(url, username, pass);
            String query = "SELECT MAX(cena),korpus_id,tip from korpus";
            Statement st = (Statement) con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String sve="";
                String maxCena = rs.getString("MAX(cena)");
                sve+=maxCena+" ";
                System.out.println(maxCena);
                int korpusID = rs.getInt("korpus_id");
                sve+=korpusID+" ";
                System.out.println(korpusID);
                String tip = rs.getString("tip");
                sve+=tip+" ";
                System.out.println(tip);
return sve;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

   return ""; }

    public static String datumLokacijaProdaja() {
        try {

            Connection con = DriverManager.getConnection(url, username, pass);
            String query = "SELECT lokacija,datum FROM prodaja HAVING COUNT(datum)";
            Statement st = (Statement) con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String sve="";
                String lokacija = rs.getString("lokacija");
                System.out.println(lokacija);
                sve+=lokacija+" ";
                String datum = rs.getString("datum");
                System.out.println(datum);
                sve+=datum+" ";
                

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

 return "";   }

}
