import 'dart:io';

void main() {
  print('--- Умный калькулятор ---');

  try {
    // 1. Ввод первого числа с null-безопасностью (??)
    stdout.write('Введите первое число: ');
    String input1 = stdin.readLineSync() ?? '';
    double num1 = double.tryParse(input1) ?? (throw FormatException('Некорректный ввод числа'));

    // 2. Ввод оператора
    stdout.write('Введите оператор (+, -, *, /, %): ');
    String op = stdin.readLineSync() ?? '';
    
    // Проверка корректности оператора через логический оператор OR (||)
    if (op != '+' && op != '-' && op != '*' && op != '/' && op != '%') {
      throw FormatException('Неподдерживаемый оператор');
    }

    // 3. Ввод второго числа
    stdout.write('Введите второе число: ');
    String input2 = stdin.readLineSync() ?? '';
    double num2 = double.tryParse(input2) ?? (throw FormatException('Некорректный ввод числа'));

    // 4. Вычисление результата
    double result;
    switch (op) {
      case '+': result = num1 + num2; break;
      case '-': result = num1 - num2; break;
      case '*': result = num1 * num2; break;
      case '/':
        // Обработка деления на ноль
        if (num2 == 0) throw UnsupportedError('Деление на ноль невозможно');
        result = num1 / num2;
        break;
      case '%':
        if (num2 == 0) throw UnsupportedError('Деление на ноль невозможно');
        result = num1 % num2;
        break;
      default:
        return;
    }

    // Тернарный оператор для красивого вывода целых чисел без ".0" на конце
    print('Результат: ${result % 1 == 0 ? result.toInt() : result}');

  } on FormatException catch (e) {
    print('Ошибка ввода: ${e.message}');
  } on UnsupportedError catch (e) {
    print('Математическая ошибка: ${e.message}');
  } catch (e) {
    print('Произошла непредвиденная ошибка: $e');
  }
}
