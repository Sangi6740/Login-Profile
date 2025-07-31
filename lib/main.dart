import 'package:flutter/material.dart';
import 'package:login/signup.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final _formkey = GlobalKey<FormState>;
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  String? validateemail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty!';
    }
    return null;
  }

  String? validatepass(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty!';
    }
    if (value.length < 6) {
      return 'Password cannot be less than 6 characters.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 420,
          width: 340,

          child: Column(
            children: [
              Text(
                "Login\nEnter your credentials to login.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                      labelText: "Email",

                      labelStyle: TextStyle(color: Colors.black),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: validateemail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  obscureText: _obscureText,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 10,
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    labelText: "Password",

                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  validator: validatepass,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text("Login"),
              ),

              SizedBox(height: 10),

              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(text: 'Do not have an account? '),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                    ),
                    TextSpan(text: ' to continue.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
