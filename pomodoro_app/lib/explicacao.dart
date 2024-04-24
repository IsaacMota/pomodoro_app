import 'package:flutter/material.dart';
import 'package:pomodoro_app/tempo.dart';

class ExplicacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Removido o texto da AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bloqueio de Tempo',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Trabalhar em blocos de tempo é uma estratégia eficaz para usar o tempo de forma inteligente e alcançar melhores resultados. Ajuda a estruturar o seu processo de trabalho, permitindo focar em uma tarefa por vez, limitar distrações e procrastinação. É usado por desenvolvedores, designers, escritores e estudantes em todo o mundo.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Como Funciona o Método Pomodoro?',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Começando com um período de trabalho de 25 minutos, chamado de "pomodoro", seguido por uma pausa curta de 5 minutos, o ciclo é repetido. Após quatro pomodoros, é hora de uma pausa mais longa, geralmente entre 15 a 30 minutos. Durante cada pomodoro, o foco total é mantido na tarefa designada até que o temporizador toque, indicando o fim do período de trabalho.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Por Que o Método Funciona?',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'O estudo de 2011 publicado na revista Cognition destaca a importância das breves pausas mentais para manter o foco e melhorar significativamente a capacidade de concentração em tarefas prolongadas. Ele identifica um fenômeno comum em que a atenção e o desempenho diminuem após períodos prolongados de atividade contínua. Dividir as tarefas em períodos com pausas regulares pode torná-las menos cansativas, pois o cérebro está motivado pela perspectiva das pausas. A cada período de foco, o cérebro recebe uma dose de dopamina, um hormônio associado ao centro de recompensa, que reforça a motivação e a concentração.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Recompensa',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Após utilizar o método Pomodoro, você pode ser recompensado com gemas para diferentes funcionalidades ao longo de 1 dia, 1 semana e 1 mês. Por um dia de uso, você recebe 15 gemas azuis, que podem ser acumuladas para desbloquear Cards de Conhecimento Geral ou Temas. Após uma semana, você ganha 1 gema vermelha, facilitando o resgate de seus Cards e Temas. Após um mês, você ganha 1 gema verde, que facilita a compra de Temas.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Dê à sua atividade total atenção. O mundo pode esperar 25 minutos até você terminar suas tarefas.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela TempoScreen quando o botão for pressionado
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TempoScreen()),
                );
              },
              child: Text('VAMOS COMEÇAR'),
            ),
          ],
        ),
      ),
    );
  }
}
