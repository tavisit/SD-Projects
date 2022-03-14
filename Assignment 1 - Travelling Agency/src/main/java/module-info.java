module com.octavian.project {
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.web;

    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires validatorfx;
    requires org.kordamp.ikonli.javafx;
    requires org.kordamp.bootstrapfx.core;
    requires eu.hansolo.tilesfx;
    requires java.sql;

    opens com.octavian.project to javafx.fxml;
    exports com.octavian.project;
    exports com.octavian.project.Controller;
    opens com.octavian.project.Controller to javafx.fxml;
}