import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  final String _validEmail = "goku@dragonball.com";
  final String _validPassword = "Default123!";

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      if (email == _validEmail && password == _validPassword) {
        if (mounted) {
          context.go('/home');
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Usuario o contraseña incorrectos"),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });

    // Comunicación con el backend
    /*
    final response = await http.post(
      Uri.parse("http://127.0.0.1:3000/usuarios"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email, "password": password}),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      context.go('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Credenciales inválidas: ${response.body}",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: const NetworkImage(
                    'https://cloudfront-us-east-1.images.arcpublishing.com/metroworldnews/GVKYFVL425H4NLXPYQAGL4FTXE.jpg',
                  ),
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
                const SizedBox(height: 20),
                Text(
                  "Bienvenidos",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 24,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 32.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    labelStyle: const TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: theme.brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.black12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    labelStyle: const TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: theme.brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.black12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 32.0),
                _isLoading
                    ? const CircularProgressIndicator(color: Colors.orange)
                    : ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 15.0),
                        ),
                        child: Text(
                          "Iniciar Sesión",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
