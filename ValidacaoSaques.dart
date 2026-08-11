void main() {
  var conta = ContaBancaria(titular: 'helena');

  try {
    conta.sacar(9.0);  
  } catch (error) {
    print('Ocorreu um problema: $error');
  }
  
  conta.depositar(9.0);
  
  try {
    conta.sacar(8.0);  
  } catch (error) {
    print('Ocorreu um problema: $error');
  }
  
  double currentSaldo = conta.saldo;
  
  print('saldo: $currentSaldo');
}

class ContaBancaria {
  String titular;
  double saldo;
  
  ContaBancaria({required this.titular, this.saldo = 0.0});
  
  void depositar(double valor) {
    this.saldo += valor;
    print('depositou!');
  }
  
  bool sacar(double valor) {
    
    if (valor <= this.saldo) {
      saldo -= valor;
      print('sacou!');
      return true;
    }
    
    throw Exception('Saldo insuficiente para este saque!');
  }
}
