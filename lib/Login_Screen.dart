import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String _username = "user";
  final String _password = "123";
  String _errorMessage = '';

  void _login() async {
    if (_usernameController.text == _username &&
        _passwordController.text == _password) {
      setLogin();
      Navigator.pushReplacementNamed(context, 'details');
    } else {
      setState(() {
        _errorMessage = 'Incorrect username or password';
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Welcome!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                    fontFamily: 'Teko',
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 107, 128),
                  ),
                ),

                // username

                TextFormField(
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'Enter valid input';
                    } else if (value.length < 3) {
                      return 'User name Must contain at least 3 characters';
                    } else {
                      return null;
                    }
                  },
                  controller: _usernameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 227, 254, 254),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Enter username'),
                ),
                const SizedBox(
                  height: 30,
                ),

                const Text(
                  'Password',
                  style: TextStyle(
                    fontFamily: 'Teko',
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 107, 128),
                  ),
                ),

                //  password

                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 227, 254, 254),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Enter Password'),
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return 'Entere valid input';
                    } else if (value.length < 3) {
                      return 'Password Must contain 3 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  child: const Text('Log in'),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  )
              ],
            ),
          ),
        ),
        //
      ),
    );
  }

  Future<bool> setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final v = await prefs.setBool('isLoggedIn', true);
    return v;
  }
}
