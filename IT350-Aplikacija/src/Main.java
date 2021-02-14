

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 *
 * @author Nesa
 */
public class Main extends Application {

    static Button b = new Button("Unesi: ");
    static Button b1 = new Button("Unesi: ");
    static Button b2 = new Button("Unesi: ");
    static Button b3 = new Button("Generisi");

    static TextField f = new TextField();//zice
    static TextField f1 = new TextField();//zice
    static TextField f2 = new TextField();//civije
    static TextField f3 = new TextField();//korpus
    static TextField f4 = new TextField();//korpus
    static TextField f5 = new TextField();//korpus
    static TextField f6 = new TextField();//korpus
    static TextField f7 = new TextField();

    Label l0 = new Label("ZICE:");
    Label l = new Label("Tip");
    Label l1 = new Label("Datum pravljenja");
    Label l2 = new Label("CIVIJE:");
    Label l3 = new Label("Tip");
    Label lk1 = new Label("KORPUS");
    Label lk2 = new Label("TIP");
    Label lk3 = new Label("VELICINA");
    Label lk4 = new Label("CENA");
    Label lk5 = new Label("DATUM PRAVLJENJA");

    static TextArea a = new TextArea();
    Label l4 = new Label();
    Button b4 = new Button();
    static RadioButton rb = new RadioButton("Broj proizvedenih gitara");
    static RadioButton rb1 = new RadioButton("Datum najvise napravljenih zica za gitaru");
    static RadioButton rb2 = new RadioButton("Najskuplji korpus");
    static RadioButton rb3 = new RadioButton("Najprodavanija lokacija i datum");

    ToggleGroup g = new ToggleGroup();

    VBox v = new VBox();
    VBox v1 = new VBox();
    VBox v2 = new VBox();
    VBox v3 = new VBox();

    public void start(Stage primaryStage) {
        HBox h = new HBox();
        HBox h1 = new HBox();
        rb.setToggleGroup(g);
        rb1.setToggleGroup(g);
        rb2.setToggleGroup(g);
        rb3.setToggleGroup(g);

        v.getChildren().addAll(l0, l, f, l1, f1, b);
        v1.getChildren().addAll(l2, l3, f2, b1);
        v2.getChildren().addAll(lk1, lk2, f3, lk3, f4, lk4, f5, lk5, f6, b2);
        v3.getChildren().addAll(rb, rb1, rb2, rb3, a, b3);
        h.getChildren().addAll(v, v1, v2, v3);
        h.setSpacing(20);
        v.setSpacing(30);
        v.setPadding(new Insets(10));
        v1.setSpacing(30);
        v1.setPadding(new Insets(10));
        v2.setSpacing(30);
        v2.setPadding(new Insets(10));
        v3.setSpacing(30);
        v3.setPadding(new Insets(10));
        Scene scene = new Scene(h, 1000, 500);
        logika();
        primaryStage.setTitle("IT350 - Projekat");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    
    public static void main(String[] args) {
        launch(args);

    }
    static int br = 0;
    static int br1 = 0;
    static int br2 = 0;

    public static void logika() {

        Baza ba = new Baza();
        b.setOnAction((event) -> {
            if (f1.getText().equals("") == false && f.getText().equals("") == false) {
                Zice z = new Zice(br, Integer.parseInt(f.getText()), f1.getText());
                ba.unesiZice(z);
                br++;

            }

        });

        b1.setOnAction((event) -> {
            if (f2.getText().equals("") == false) {
                Civije c = new Civije(br1, f2.getText());
                ba.unesiCivije(c);
                br1++;

            }

        });

        b2.setOnAction((event) -> {
            if (f3.getText().equals("") == false && f4.getText().equals("") == false && f5.getText().equals("") == false && f6.getText().equals("") == false) {
                Korpus k = new Korpus(br2, f3.getText(), f4.getText(), f5.getText(), f6.getText());
                ba.unesiKorpus(k);
                br2++;

            }

        });
        b3.setOnAction((event) -> {
            if (rb.isSelected()) {

                a.setText(ba.brojProizvedenihGitara() + "");

            } else if (rb1.isSelected()) {

                a.setText(ba.datumZice());
            } else if (rb2.isSelected()) {

                a.setText(ba.najskupljiKorpus());
            } else {
                a.setText(ba.datumLokacijaProdaja());
            }
        });

    }
}
