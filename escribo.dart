import 'dart:io';

main() {
  int number = getNumber();
  print('\n\n');

  print('O número fornecido foi $number');

  int result = 0;
  for (int i = 0; i < number; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      result += i;
    }
  }

  print('Somatório igual a $result');
}

int getNumber() {
  print(
      'Essa aplicação retornar o somatório de todos os valores inteiros diviśiveis por 3 ou 5 que sejam inferiores ao número fornecido.\n');
  print('Insira abaixo o número que deseja testar:');

  String? number = stdin.readLineSync();

  while (!isValid(number)) {
    number = stdin.readLineSync();
  }

  return int.parse(number!);
}

bool isValid(String? number) {
  final isEmpty = number == null || number.isEmpty ? true : false;
  if (isEmpty) {
    print('Você ainda não forneceu o número, o digite abaixo:');
    return false;
  }

  final isNotNumeric = num.tryParse(number!) == null ? true : false;
  if (isNotNumeric) {
    print('Número fornecido incorretamente, tente novamente:');
    return false;
  }

  try {
    int.parse(number);
  } catch (e) {
    print('O número fornecido não é um inteiro, insiria um valor válido:');
    return false;
  }

  bool isNegative = (int.parse(number)).isNegative;
  if (isNegative) {
    print('Número fornecido é negativo, insira um valor positivo:');
    return false;
  }

  return true;
}
