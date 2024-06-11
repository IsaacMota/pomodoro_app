import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnimalScreen(),
  ));
}

class AnimalScreen extends StatelessWidget {
  final List<bool> isUnlocked = List<bool>.filled(animalNames.length, false)
    ..[0] = true; // Primeira carta desbloqueada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 44, 144, 202),
        title: Text(
          'Castas de animais',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.lightBlue[50], // Fundo azul claro
        child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: animalNames.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return AnimalCard(
              imageUrl: animalImages[index],
              animalName: animalNames[index],
              isUnlocked: isUnlocked[index],
            );
          },
        ),
      ),
    );
  }
}

class AnimalCard extends StatefulWidget {
  final String? imageUrl; // Alterado para aceitar null
  final String animalName;
  final bool isUnlocked;

  const AnimalCard({
    Key? key,
    required this.imageUrl,
    required this.animalName,
    required this.isUnlocked,
  }) : super(key: key);

  @override
  _AnimalCardState createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isUnlocked) {
          setState(() {
            _isTapped = !_isTapped;
          });
        }
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: _isTapped
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'A mariposa-imperador (Thysania agrippina) é o maior inseto do mundo, com uma envergadura de asa que pode chegar a 30 centímetros. É nativa da América Latina, encontrada na Amazônia e no México.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        if (widget.imageUrl !=
                            null) // Verifica se a URL da imagem não é nula
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                            child: Image.network(
                              widget.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (widget.imageUrl ==
                            null) // Se a URL da imagem for nula, mostra um espaço em branco
                          Container(
                              color: Colors
                                  .white), // Você pode personalizar isso de acordo com a aparência desejada
                        if (!widget.isUnlocked)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black54,
                              child: Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 50.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      widget.animalName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: widget.isUnlocked ? Colors.black : Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

final List<String> animalNames = [
  'Mariposa-imperador',
  'Lula-gigante',
  'Besouro-Bombardeiro',
  'Bicho-pau',
  'Toupeira-nariz-de-estrela',
  'Elefante-Africano',
  'Largarto-com-chifres-do-Texas',
  'Baleia-azul',
  'Beija-flor',
  'Golfinhos',
];

final List<String?> animalImages = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkpS1l-ro6GYEjvQZTsto3F4YErllOFNBWWCNo7pE3fCR8kK5DOn1LqNovRbB7pz17XgM&usqp=CAU', // URL da imagem da primeira carta
  null, // As imagens restantes estão definidas como null
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
];
