import 'package:flutter/material.dart';
import 'widgets.dart'; // HeaderWidget, LabelWidget y CustomButton

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  bool rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // -------------------------
          // HEADER ESTILO APPBAR
          // -------------------------
          Container(
            width: double.infinity, // ocupa todo el ancho
            color: Colors.orange, // fondo naranja
            height: 50, // altura más delgada
            alignment: Alignment.center, // centra el texto
            child: const Text(
              "RecetaNotes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // -------------------------
          // RESTO DEL LOGIN CENTRADO
          // -------------------------
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Usuario
                    const LabelWidget(text: "Usuario"),
                    const SizedBox(height: 8),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        hintText: "Ingrese su nombre de usuario",
                        hintStyle: TextStyle(color: Colors.orange),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      style: TextStyle(color: Colors.orange),
                    ),

                    const SizedBox(height: 25),

                    // Contraseña + Ojo afuera
                    const LabelWidget(text: "Contraseña"),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            obscureText: !showPassword,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color.fromARGB(255, 255, 152, 0), width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orange, width: 2),
                              ),
                              hintText: "Ingrese su contraseña",
                              hintStyle: TextStyle(color: Colors.orange),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                            style: const TextStyle(color: Colors.orange),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.orange,
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Recordar contraseña
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: rememberPassword,
                          activeColor: Colors.orange, // color del cuadradito
                          onChanged: (value) {
                            setState(() {
                              rememberPassword = value!;
                            });
                          },
                        ),
                        const Text(
                          "Recordar contraseña",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Botón iniciar sesión
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero), // rectángulo
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Botón "Inicio con Google"
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero), // rectángulo
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Inicio con Google",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Crear cuenta
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Crear cuenta",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),

                    // Recuperar contraseña
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Recuperar contraseña",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
