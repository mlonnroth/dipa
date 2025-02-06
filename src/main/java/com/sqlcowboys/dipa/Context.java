package com.sqlcowboys.dipa;
import java.sql.Connection;

public class Context {
    
    // The context holds these elements
    public String[] args;
    public boolean isDebug = false;
    public boolean isVerbose = true;
    public boolean isConnected = false;
    public Connection db;
    public String dbDriver = "org.mariadb.jdbc.Driver";
    public String dbURL = "jdbc:mariadb://localhost:3306/vgr";
    public String dbUser = "magnus";
    public String dbPass = "";

    public Context (String[] args) {
        this.args = args; 
    }
}
