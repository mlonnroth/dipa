package com.sqlcowboys.dipa;
import java.sql.*;

public class EventLoop {
    
    public Context ctx;

    public EventLoop(Context ctx) {
        this.ctx = ctx;
    }

    public void run() throws SQLException {
        Personal personal = new Personal(ctx);
        System.out.println("Digitalt Patientflöde");
        personal.list();
     }


}
