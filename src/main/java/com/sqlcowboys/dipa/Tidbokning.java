package com.sqlcowboys.dipa;
import java.sql.*;

public class Tidbokning {
    
    public Context ctx;

    private static final String sql_bokningar =
    "select t.bokad_tid, b.namn, p.fnamn, p.enamn " +
    "from tidbokning t, tidbok_personal tp, besok_typ b, patient p " +
    "where b.id = t.besok_typ_id " +
    "  and p.id = t.patient_id " +
    "  and t.id = tp.tidbok_id " +
    "  and tp.personal_id = ? " +
    "order by 1";

    private PreparedStatement sta;
    private ResultSet rs;
    private boolean unprepared;

    public Tidbokning (Context ctx) {
        this.ctx = ctx;
        this.unprepared = true;
    }

    private void prepare() throws SQLException {
        sta = ctx.db.prepareStatement(sql_bokningar);
        unprepared = false;
    }

    public void list (int personal_id) throws SQLException {
        if (unprepared) {
            prepare();
        }
        sta.setInt(1, personal_id);
        rs = sta.executeQuery();
        while (rs.next()) {
            System.out.printf("   %s %s %s %s\n", rs.getString("t.bokad_tid"), rs.getString("b.namn"), rs.getString("p.fnamn"), rs.getString("p.enamn"));
        }
        rs.close();
    }
}
