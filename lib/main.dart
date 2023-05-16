import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login App",
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username == "admin" && password == "admin") {
      // Jika username dan password benar, tampilkan pesan sukses
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Login Successful!"),
          content: Text("Welcome, $username!"),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      // Jika username atau password salah, tampilkan pesan error
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Login Failed!"),
          content: Text("Invalid username or password."),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Bergerak"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => login(context),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
