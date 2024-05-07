package com.sqlcowboys.dipa;

import java.sql.*;

public class PreProcessor {
    
    Context ctx;

    public PreProcessor(Context ctx) {
        this.ctx = ctx;
    }

    public void run() throws SQLException {
        if (!ctx.isConnected) {
            ctx.db = DriverManager.getConnection(ctx.dbURL, ctx.dbUser, ctx.dbPass);
            ctx.isConnected = true;
            if (ctx.isVerbose) {
                System.out.println("Connected to " + ctx.dbURL + " as " + ctx.dbUser);
            }
        }
    }
}
