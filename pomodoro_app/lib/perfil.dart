import 'package:flutter/material.dart';
import 'package:pomodoro_app/tempo.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    TempoScreen(), // Navega de volta para TempoScreen
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: ProfileWidget(),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://www.example.com/sua_imagem.jpg'), // URL da imagem do usuário
        ),
        SizedBox(height: 20),
        Text(
          'Tempo de uso do app: X horas', // Substitua X pelo tempo real de uso
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(labelText: 'Nome'),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Senha'),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Nova Senha'),
        ),
        SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            // Ação para esqueceu senha
          },
          child: Text(
            'Esqueceu a senha?',
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Ação para salvar as informações
          },
          child: Text('Salvar'),
        ),
      ],
    );
  }
}
