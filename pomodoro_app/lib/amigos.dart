import 'package:flutter/material.dart';

// Modelo para categorias de cartões
class CardCategory {
  final String category;
  final int cardCount;

  CardCategory({
    required this.category,
    required this.cardCount,
  });
}

// Modelo para amigos
class Friend {
  final String name;
  final String profilePic;
  final String appUsageTime;
  final List<CardCategory> cardCategories;

  Friend({
    required this.name,
    required this.profilePic,
    required this.appUsageTime,
    required this.cardCategories,
  });
}

// Tela principal que lista os amigos
class Amigoslist extends StatelessWidget {
  final List<Friend> friends = [
    Friend(
      name: "João",
      profilePic: "assets/joao.jpg",
      appUsageTime: "6 meses",
      cardCategories: [
        CardCategory(category: "Animal", cardCount: 10),
        CardCategory(category: "Filosofia", cardCount: 5),
        CardCategory(category: "Matemática", cardCount: 8),
      ],
    ),
    Friend(
      name: "Maria",
      profilePic: "assets/maria.jpg",
      appUsageTime: "1 ano",
      cardCategories: [
        CardCategory(category: "Animal", cardCount: 8),
        CardCategory(category: "Filosofia", cardCount: 3),
        CardCategory(category: "Matemática", cardCount: 6),
      ],
    ),
    Friend(
      name: "Pedro",
      profilePic: "assets/pedro.jpg",
      appUsageTime: "3 meses",
      cardCategories: [
        CardCategory(category: "Animal", cardCount: 5),
        CardCategory(category: "Filosofia", cardCount: 2),
        CardCategory(category: "Matemática", cardCount: 4),
      ],
    ),
    Friend(
      name: "Ana",
      profilePic: "assets/ana.jpg",
      appUsageTime: "2 anos",
      cardCategories: [
        CardCategory(category: "Animal", cardCount: 12),
        CardCategory(category: "Filosofia", cardCount: 7),
        CardCategory(category: "Matemática", cardCount: 10),
      ],
    ),
    Friend(
      name: "Carlos",
      profilePic: "assets/carlos.jpg",
      appUsageTime: "8 meses",
      cardCategories: [
        CardCategory(category: "Animal", cardCount: 7),
        CardCategory(category: "Filosofia", cardCount: 4),
        CardCategory(category: "Matemática", cardCount: 6),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          'Lista de Amigos',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.green[300], // Cor de fundo da tela
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white, // Cor de fundo do cartão
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: AssetImage(friends[index].profilePic),
                ),
                title: Text(
                  friends[index].name,
                  style: TextStyle(
                    color: Colors.green[900], // Cor do texto do nome
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text(
                  'Tempo de uso: ${friends[index].appUsageTime}',
                  style: TextStyle(
                    color: Colors.green[900], // Cor do texto do tempo de uso
                    fontSize: 14.0,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FriendProfileScreen(friend: friends[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// Tela de perfil completo do amigo
class FriendProfileScreen extends StatelessWidget {
  final Friend friend;

  FriendProfileScreen({required this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          friend.name,
          style: TextStyle(
              color:
                  Colors.white), // Define a cor do texto do título como branco
        ),
        backgroundColor: Colors.green[900], // Cor de fundo do cabeçalho
        iconTheme: IconThemeData(
            color: Colors.white), // Define a cor do ícone como branco
      ),
      body: Container(
        color: Colors.green[50], // Cor de fundo do corpo da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage(friend.profilePic),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(
                friend.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Altera a cor do texto para preto
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Tempo de uso: ${friend.appUsageTime}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.green[900], // Cor do texto
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Lista de Cards:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900], // Cor do texto
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: friend.cardCategories.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    elevation: 4.0,
                    child: ListTile(
                      title: Text(friend.cardCategories[index].category),
                      subtitle: Text(
                        'Quantidade de cartas: ${friend.cardCategories[index].cardCount}', // Altera o texto 'Quantidade' para 'Quantidade de cartas'
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
