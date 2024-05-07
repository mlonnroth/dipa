package com.sqlcowboys.dipa;
import java.sql.*;

public class Personal {

    Context ctx;

    static final String sql_list =
    "select p.id, p.vgrid, p.fnamn, p.enamn, t.namn " +
    "from personal p, personal_typ t "+
    "where t.id = p.personal_typ_id;";

    public Personal(Context ctx) {
        this.ctx = ctx;
    }

    public void list() throws SQLException {
        Tidbokning tidbokning = new Tidbokning(ctx);
        PreparedStatement sta = ctx.db.prepareStatement(sql_list);
        ResultSet rsa = sta.executeQuery();
        System.out.printf("Personal\n");
        System.out.printf("========\n");
        while (rsa.next()) {
            System.out.printf("%-9s %-10s %-10s %s\n", rsa.getString("p.vgrid"), rsa.getString("p.fnamn"), 
                rsa.getString("p.enamn"), rsa.getString("t.namn"));
            int personal_id = rsa.getInt("p.id");
            tidbokning.list(personal_id);
        }
        rsa.close();

    }

}
