
package Classes;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Conection {


    public Connection realizaConexion(){
                Connection conn = null;
                String urlDatabase =  "jdbc:postgresql://localhost:5432/ninty"; 
                try {
                    conn = DriverManager.getConnection(urlDatabase,"postgres", "");
                    
                } catch (SQLException e) {
                    System.out.println("Ocurrio un error : "+e.getMessage());
                    return conn;
                }
                System.out.println("La conexión se realizo sin problemas! =) ");
                return conn;
    }
    
    public void cerrarConexion(Connection conn) throws SQLException{
        conn.close();
    }
    
}

