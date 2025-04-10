
package Services;

import DB.DataBase;
import Models.PersonaNatural;
import Models.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PersonaNaturalService {
    public boolean insertarCliente(PersonaNatural cliente){
        boolean respuesta = false;
        Connection conn = DataBase.conectar();
        if(conn != null){
            try{
                String sql = "INSERT INTO Personas (identificacion, tipoIdentificacion, nombres, apellidos, genero, telefono, correo, fechaNacimiento) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, cliente.getIdentificacion());
                pstmt.setString(2, cliente.getTipoIdentificacion());
                pstmt.setString(3, cliente.getNombre());
                pstmt.setString(4, cliente.getApellido());
                pstmt.setString(5, cliente.getGenero());
                pstmt.setString(6, cliente.getTelefono());
                pstmt.setString(7, cliente.getCorreo());
                pstmt.setDate(8,cliente.getFechaNacimiento());
                System.out.println(cliente.getIdentificacion());
                System.out.println(cliente.getTipoIdentificacion());
                System.out.println(cliente.getNombre());
                System.out.println(cliente.getApellido());
                System.out.println(cliente.getGenero());
                System.out.println(cliente.getTelefono());
                System.out.println(cliente.getCorreo());
                System.out.println(cliente.getCorreo());
                pstmt.executeUpdate();
                System.out.println("Cliente registrado exitosamente");
                respuesta = true;
            } catch(SQLException ex){
                System.out.println("Error al registrar el Cliente: " + ex.getMessage());
                ex.printStackTrace();
                respuesta = false;
            } finally {
                DataBase.Desconectar(conn);
            }
        }
        return respuesta;
    }
    
    public boolean insertarUsuario (Usuario usuario){
        boolean respuesta = false;
        Connection conn = DataBase.conectar();
        if(conn != null){
            try{
                String sql = "INSERT INTO usuarios (username, clave, identificacionPersona, personaRol) VALUES (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, usuario.getUsername());
                pstmt.setString(2, usuario.getPassword());
                pstmt.setInt(3, usuario.getPersonaNatural().getIdentificacion());
                pstmt.setInt(4, usuario.getRol().getIdrol());
                pstmt.executeUpdate();
                System.out.println("Usuario registrado exitosamente");
                respuesta = true;
            } catch(SQLException ex){
                System.out.println("Error al registrar el usuario: " + ex.getMessage());
                ex.printStackTrace();
                respuesta = false;
            } finally {
                DataBase.Desconectar(conn);
            }
        }
        return respuesta;
    }
}
