void main() {
  List<Produto> produtos;
  
  Produto leite = Produto(nome: 'leite Tirol', preco: 10.0, status: StatusProduto.DISPONIVEL);
  Produto queijo = Produto(nome: 'queijo Tirol', preco: 25.0, status: StatusProduto.ESGOTADO);
  Produto chocolate = Produto(nome: 'chocolate', preco: 0.99, status: StatusProduto.ESGOTADO);
  
  produtos = [leite, queijo, chocolate];
  
  produtos.forEach((produto) {
    produto.displayInfo();
  });
}

enum StatusProduto {DISPONIVEL, ESGOTADO}

class Produto{
  String nome;
  double preco;
  StatusProduto status;
  
  Produto({required this.nome, required this.preco, required this.status});
  
  void displayInfo() {
    print('Produto: $nome, Preço: $preco, Status: $status');
  }
}
