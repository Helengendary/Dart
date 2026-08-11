void main() {
  var conta = ContaBancaria(titular: 'helena');
  
  conta.sacar(9.0);
  conta.depositar(9.0);
  conta.sacar(8.0);
  
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
    
    print('saldo insuficiente!');
    return false;
  }
}
