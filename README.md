# dipa
Digitalt patientflöde

I filen cretab.sql skapas normaliserade tabeller inkl. fiktiv testdata motsvarande den logiska informationsmodellen i ADD DIPA (0.5) kap. 5.2.1.3.
Har testats mot MariaDB 11.3.2 på Windows 10.

I pom.xml finns konfiguration för att bygga testprogram i Java med hjälp av Maven. Testprogrammet är enklast möjliga och demonstrerar endast
hur tidbokningar kan hämtas per anställd via enkel JDBC.

Ändra parametrar för inloggning i DB i filen Context.java:

    public String dbDriver = "org.mariadb.jdbc.Driver";
    public String dbURL = "jdbc:mariadb://localhost:3306/pas";
    public String dbUser = "maglo5";
    public String dbPass = "";

För att installera:
1) Installera MariaDB, OpenJDK, Maven, git
2) Fork/clone den här modulen och installera lokalt med git clone
3) Öppna med MS Code
