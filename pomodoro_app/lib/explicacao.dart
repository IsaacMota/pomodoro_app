import 'package:flutter/material.dart';
import 'package:pomodoro/tempo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExplicacaoScreen extends StatefulWidget {
  @override
  _ExplicacaoScreenState createState() => _ExplicacaoScreenState();
}

class _ExplicacaoScreenState extends State<ExplicacaoScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _handleTapDown(TapDownDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapPosition = details.globalPosition.dx;

    if (tapPosition < screenWidth / 2) {
      // Tapped on the left side of the screen
      if (_currentPage > 0) {
        _controller.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else {
      // Tapped on the right side of the screen
      if (_currentPage < 3) {
        _controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Explicação', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF4CAF50), // Tela de fundo verde
      body: GestureDetector(
        onTapDown: _handleTapDown,
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildPage(
                    title: 'Bloqueio de Tempo',
                    content:
                        'Trabalhar em blocos de tempo é uma estratégia eficaz para usar o tempo de forma inteligente e alcançar melhores resultados. Ajuda a estruturar o seu processo de trabalho, permitindo focar em uma tarefa por vez, limitar distrações e procrastinação. É usado por desenvolvedores, designers, escritores e estudantes em todo o mundo.',
                  ),
                  _buildPage(
                    title: 'Como Funciona o Método Pomodoro?',
                    content:
                        'Começando com um período de trabalho de 25 minutos, chamado de "pomodoro", seguido por uma pausa curta de 5 minutos, o ciclo é repetido. Após quatro pomodoros, é hora de uma pausa mais longa, geralmente entre 15 a 30 minutos. Durante cada pomodoro, o foco total é mantido na tarefa designada até que o temporizador toque, indicando o fim do período de trabalho.',
                  ),
                  _buildPage(
                    title: 'Por Que o Método Funciona?',
                    content:
                        'O estudo de 2011 publicado na revista Cognition destaca a importância das breves pausas mentais para manter o foco e melhorar significativamente a capacidade de concentração em tarefas prolongadas. Ele identifica um fenômeno comum em que a atenção e o desempenho diminuem após períodos prolongados de atividade contínua. Dividir as tarefas em períodos com pausas regulares pode torná-las menos cansativas, pois o cérebro está motivado pela perspectiva das pausas. A cada período de foco, o cérebro recebe uma dose de dopamina, um hormônio associado ao centro de recompensa, que reforça a motivação e a concentração.',
                  ),
                  _buildPage(
                    title: 'Recompensa',
                    content:
                        'Após utilizar o método Pomodoro, você pode ser recompensado com gemas para diferentes funcionalidades ao longo de 1 dia, 1 semana e 1 mês. Por um dia de uso, você recebe 15 gemas azuis, que podem ser acumuladas para desbloquear Cards de Conhecimento Geral ou Temas. Após uma semana, você ganha 1 gema vermelha, facilitando o resgate de seus Cards e Temas. Após um mês, você ganha 1 gema verde, que facilita a compra de Temas.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: WormEffect(
                dotColor: Colors.white.withOpacity(0.5),
                activeDotColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            if (_currentPage == 3)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TempoScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Cor do fundo do botão
                  foregroundColor: Colors.green, // Cor do texto do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
                child: Text(
                  'VAMOS COMEÇAR',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String content,
    bool isCentered = false,
  }) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment:
            isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: isCentered ? TextAlign.center : TextAlign.start,
            ),
          SizedBox(height: 10.0),
          Text(
            content,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
          ),
        ],
      ),
    );
  }
}
