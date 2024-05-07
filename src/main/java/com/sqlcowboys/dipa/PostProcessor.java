package com.sqlcowboys.dipa;

import java.sql.*;

public class PostProcessor {
    
    Context ctx;

    public PostProcessor(Context ctx) {
        this.ctx = ctx;
    }

    public void run() throws SQLException {
        if (ctx.isConnected) {
            ctx.db.close();
            if (ctx.isVerbose) {
                System.out.println("Disconnected from" + ctx.dbURL);
            }
        }
    }
}
