/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author David
 */
public class Usuario {
   
    public void registrarAdministrador(int idadministrador,String nombreadmin,String correo, String contraseña) throws SQLException{
        Conection con = new Conection();
        Connection conn = con.realizaConexion();
        PreparedStatement st = conn.prepareStatement("INSERT INTO ADMINISTRADOR (idadministrador,nombreadmin,correo,contraseña) VALUES (?, ?, ?, ?)");
            st.setInt(1, idadministrador);
            st.setString(2, nombreadmin);
            st.setString(3, correo);
            st.setString(4, contraseña);
            //st.setObject(4, date);
            st.executeUpdate();
            st.close();
    }
    
    public void registrarAdministradorServicios(String nombreusuario,String correousuario, String contraseñausuario, int rolusuario) throws SQLException{
        Conection con = new Conection();
        Connection conn = con.realizaConexion();
        PreparedStatement st = conn.prepareStatement("INSERT INTO USUARIO (nombreusuario,correousuario,contraseñausuario,rolusuario) VALUES (?, ?, ?, ?)");
            st.setString(1, nombreusuario);
            st.setString(2, correousuario);
            st.setString(3, contraseñausuario);
            st.setInt(4, rolusuario);
            //st.setObject(4, date);
            st.executeUpdate();
            st.close();
    }
    
    public void consultaEasy() throws SQLException{
        Conection conm = new Conection();
            Connection con = conm.realizaConexion();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM USUARIO");

            if (rs.next()) {
                System.out.println(rs.getString("nombreusuario"));
            } 
    }
}
