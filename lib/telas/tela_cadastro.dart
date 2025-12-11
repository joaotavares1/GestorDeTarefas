import 'package:flutter/material.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center, 
          
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: <Widget>[
            const Text(
              'Novo Cadastro',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 30), 

        
            const Text('Email'),
            
            const SizedBox(height: 10), 
            
            
            const Text('Senha'),
            
            const SizedBox(height: 10), 
            
          
            const Text('Confirmar Senha'),
            
            const SizedBox(height: 20), 
            
         
            SizedBox(
              width: double.infinity, 
              child: ElevatedButton(
                onPressed: () {
                }, 
                child: const Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}