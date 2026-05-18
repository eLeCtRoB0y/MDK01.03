import 'dart:io';

// Рекурсивная функция вывода чисел
void printNumbersRecursive(int a, int b) {
  print(a);

  if (a == b) {
    return;
  }

  if (a < b) {
    printNumbersRecursive(a + 1, b);
  } else {
    printNumbersRecursive(a - 1, b);
  }
}

void main() {
  print('--- Рекурсивный вывод чисел ---');

  // Ввод числа А
  stdout.write('Введите число A: ');
  String inputA = stdin.readLineSync() ?? '';
  int? a = int.tryParse(inputA);

  // Ввод число B
  stdout.write('Введите число B: ');
  String inputB = stdin.readLineSync() ?? '';
  int? b = int.tryParse(inputB);

  // Проверка на корректность ввода
  if (a == null || b == null) {
    print('Ошибка: вводимые значения должны быть целыми числами!');
    return;
  }

  print('\nРезультат вывода:');
  printNumbersRecursive(a, b);
}
