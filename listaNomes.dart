void main() {
  List<String> nomes =  ['ana', 'Bia', 'Carlos', 'daniel'];
  
  formatarNomes(nomes).forEach((nome) {
    print(nome);
  });
  
}

List<String> formatarNomes(List<String> nomes) {
  List<String> finalNames = [];
  
  nomes.forEach((nome) {
    finalNames.add(nome.replaceFirst(nome[0], nome[0].toUpperCase()));
  });
  
  return finalNames;
}
