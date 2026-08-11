Future<String> buscarNomeDeUsuario(int id) {
  
  return Future.delayed(Duration(seconds: 2), () {
    return 'Usuário com ID $id: Ana';
  });
}

Future<void> main() async {
  print('Buscando usuário...');

   String data = await buscarNomeDeUsuario(5);
  
  print(data);
}
