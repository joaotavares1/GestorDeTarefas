import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

import 'tela_cadastro.dart';
import 'tela_home.dart'; 

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _carregarEmailSalvo();
  }

  
  void _carregarEmailSalvo() async {
    final prefs = await SharedPreferences.getInstance();
    final emailSalvo = prefs.getString('email');
    
    if (emailSalvo != null) {
      _emailController.text = emailSalvo;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }


  void _fazerLogin() async {
    final email = _emailController.text;
    final senha = _senhaController.text;
    
    print('Email digitado: $email');
    print('Senha digitada: $senha');
    

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text); 
    
   
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TelaHome(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 30), 

            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            
            const SizedBox(height: 10), 
            
            TextField(
              controller: _senhaController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            
            const SizedBox(height: 20), 
            
            SizedBox(
              width: double.infinity, 
              child: ElevatedButton(
                onPressed: _fazerLogin,
                child: const Text('Entrar'),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaCadastro(),
                  ),
                );
              },
              child: const Text('Criar nova conta'),
            ),
          ],
        ),
      ),
    );
  }
}