package com.sqlcowboys.dipa;
import java.sql.*;

public class Main 
{
    public static void main( String[] args ) throws SQLException {

        // 1. Initialize context and program components
        Context ctx = new Context(args);
        PreProcessor pre = new PreProcessor(ctx);
        EventLoop loop = new EventLoop(ctx);
        PostProcessor post = new PostProcessor(ctx);

        // 2. Verify pre-conditions and prepare main event-loop
        pre.run();

        // 3. Enter main event-loop
        loop.run();

        // 4. Verifiy post-conditions and finalize everythin
        post.run();


        
    }

}