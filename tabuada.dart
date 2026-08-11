void main() {
  exibirTabuada(7);
}

void exibirTabuada(int num) {
  for (int i = 1; i <= 10; i++) {
    int resultado = num * i;
    print('$i x $num = $resultado');
  }
}
