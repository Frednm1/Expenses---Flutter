class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

//essa é a classe construtora, pois é ela que efetivamente solicita e aloca o espaço na memória para os parametros recebidos

  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}
