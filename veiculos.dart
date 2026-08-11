void main() {
  Moto moto = Moto(marca: 'mitsubshi');
  Carro carro = Carro(marca: 'audi', numeroDePortas: 2);
  
  moto.acelerar();
  carro.acelerar();
}

class Veiculos {
  String marca;
  
  Veiculos({required this.marca});
  
  void acelerar() {
    print('o veículo está acelerando!');
  }
}

class Carro extends Veiculos {
  int numeroDePortas;
  Carro({required String marca, required this.numeroDePortas}) : super(marca: marca);
  
  @override
  void acelerar() {
    print('O carro está acelerando! Vrum vrum!');
  }
}

class Moto extends Veiculos {
  
  Moto({required String marca}) : super(marca: marca);
  
  @override
  void acelerar() {
    print('A moto está acelerando! Randandan!');
  }
}
