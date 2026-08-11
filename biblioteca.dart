void main() {

  Livro jogosVorazes = Livro(titulo: 'Jogos Vorazes');
  Livro storytelling = Livro(titulo: 'Storytelling');
  Livro milNovencentoEOitenteEQuatro = Livro(titulo: '1984');
  
  Biblioteca biblioteca = Biblioteca(acervo: [jogosVorazes, storytelling]);
  
  try {
    biblioteca.adicionarLivro(milNovencentoEOitenteEQuatro);
  } catch (error) {
    print('Ocorreu um problema: $error');
  }
  
  try {
    biblioteca.adicionarLivro(milNovencentoEOitenteEQuatro);
  } catch (error) {
    print('Ocorreu um problema: $error');
  }
  
  try {
    biblioteca.emprestarLivro('1984');
  } catch (error) {
    print('Ocorreu um problema: $error');
  }
  
  try {
    biblioteca.emprestarLivro('12343284');
  } catch (error) {
    print('Ocorreu um problema: $error');
  }
  
  try {
    biblioteca.emprestarLivro('1984');
  } catch (error) {
    print('Ocorreu um problema: $error');
  }
  
  biblioteca.exibirAcervo();
}

class Livro {
  String titulo;
  bool emprestado;
  
  Livro({required this.titulo, this.emprestado = false});
}

class Biblioteca {
  List<Livro> acervo;
  
  Biblioteca({required this.acervo});
  
  void adicionarLivro(Livro livro) {
    bool existe = false;
    
    acervo.forEach((livroCurrent) {
      if (livro.titulo == livroCurrent.titulo){
        existe = true;
      }    
    });
    
    if (existe) {
      throw Exception('Livro já cadastrado');
    } else {
      acervo.add(livro);
      print('Livro adicionado: ' + livro.titulo);
    }
  }
  
  void emprestarLivro(String tituloDoLivro) {
    Livro? emprestado;
 
    acervo.forEach((livro) {
      if (tituloDoLivro == livro.titulo) {
       emprestado = livro;
      }
    });
    
    if (emprestado != null) {
      if (emprestado!.emprestado) {
        throw Exception('Livro já emprestado!');
      } else {
        emprestado!.emprestado = true;
        print('Livro alugado com sucesso!');
      }
    }
  }
  
  void exibirAcervo() {
    acervo.forEach((livro) {
      String titulo = livro.titulo;
      String status = livro.emprestado ? "EMPRESTADO" : "DISPONÍVEL";
      print('Livro: $titulo, Status: $status');
    });
  }
 }
