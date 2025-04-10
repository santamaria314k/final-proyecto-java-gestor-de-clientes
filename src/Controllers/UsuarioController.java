package Controllers;

import Models.Usuario;
import Services.UsuarioService;
import Views.AdminMenu;
import Views.ClienteMenu;
import javax.swing.JOptionPane;

public class UsuarioController {
    private UsuarioService servicioUsuario;

    public UsuarioController() {
        this.servicioUsuario = new UsuarioService();
    }

    public boolean registrarUsuario(Usuario usuario) {
        return this.servicioUsuario.insertarUsuario(usuario);
    }

    public boolean validarUsuarioExistente(int identificacion) {
        return this.servicioUsuario.validarUsuarioExistente(identificacion);
    }

    public Usuario login(String username, String password) {
        return this.servicioUsuario.login(username, password);
    }
    
    public void iniciarSesion(String username, String password) {
        Usuario usuario = login(username, password);
        
        if (usuario != null) {
            JOptionPane.showMessageDialog(null, "Bienvenido " + usuario.getUsername());
            
            if (usuario.isIsAdmin()) {
                new AdminMenu().setVisible(true);
            } else {
                new ClienteMenu().setVisible(true);
            }
        } else {
            JOptionPane.showMessageDialog(null, "Credenciales incorrectas");
        }
    }
    
    public boolean registrarUsuarioNatural(Usuario usuario) {
        return this.servicioUsuario.insertarUsuarioNatural(usuario);
    }
}