void main() {
  double resultadoIMC = calcularIMC(0.78, 8.76); 
  print('IMC: $resultadoIMC');
  interpretarIMC(resultadoIMC);
}

double calcularIMC(double peso, double altura) {
  return peso / (altura * altura);
}

void interpretarIMC(double imc) {
  if (imc < 18) {
    print('Abaixo do peso');
  } else if (imc < 25) {
    print('Peso normal');
  } else if (imc < 30) {
    print('Sobrepeso');
  } else {
    print('Obesidade');
  }
}
