import 'package:flutter/material.dart';

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
        backgroundColor:
            Colors.green[900], // Cor de fundo do topo em verde escuro
        title: Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white, // Cor do texto em branco
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Cor do ícone da seta em branco
        ),
      ),
      backgroundColor: Colors.green[300], // Cor de fundo da tela em verde
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
          decoration: InputDecoration(
            labelText: 'Nome',
            fillColor: Colors.white, // Cor do campo de texto em branco
            filled: true,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            fillColor: Colors.white, // Cor do campo de texto em branco
            filled: true,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Senha',
            fillColor: Colors.white, // Cor do campo de texto em branco
            filled: true,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Nova Senha',
            fillColor: Colors.white, // Cor do campo de texto em branco
            filled: true,
          ),
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
          child: Text(
            'Salvar',
            style: TextStyle(
              color: Colors.white, // Cor do texto do botão em branco
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.green[900]), // Cor do botão em verde escuro
          ),
        ),
      ],
    );
  }
}
