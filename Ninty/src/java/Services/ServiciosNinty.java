/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import Classes.*;
import java.sql.SQLException;

/**
 *
 * @author David
 */
@WebService(serviceName = "ServiciosNinty")
public class ServiciosNinty {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello Ninty" + txt + " !";
    }
    
    @WebMethod(operationName = "registrarAdminServicio")
    public String registrarAdminServicio(@WebParam(name = "nombre") String nombre,@WebParam(name = "correo") String correo,@WebParam(name = "contraseña") String contraseña) throws SQLException {
        Usuario user = new Usuario();
        user.registrarAdministradorServicios(nombre, correo, contraseña, 1);
        return "Registrado Exitosamente";
    }

}
