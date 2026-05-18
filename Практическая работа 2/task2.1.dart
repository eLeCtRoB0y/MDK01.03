import 'dart:math';

class MathProcessor {
  final List<double> numbers;

  // 1. Конструктор принимает список чисел List<double>
  MathProcessor(this.numbers);

  // 2. Метод process принимает функцию-обработчик и возвращает новый список
  List<double> process(double Function(double) processor) {
    List<double> result = [];
    for (double num in numbers) {
      result.add(processor(num)); // Применяем переданную функцию к числу
    }
    return result;
  }

  // 3. Статический метод генерирует список случайных чисел дробного типа
  static List<double> getRandomNumbers(int count, {double max = 100.0}) {
    final random = Random();
    return List.generate(count, (_) => random.nextDouble() * max);
  }
}

void main() {
  print('--- Генерация случайных чисел ---');
  // Генерируем 5 случайных чисел
  List<double> randomList = MathProcessor.getRandomNumbers(5, max: 10.0);
  
  // Создаем объект обработчика
  MathProcessor processor = MathProcessor(randomList);
  
  print('Исходный список:');
  print(processor.numbers.map((n) => n.toStringAsFixed(2)).toList());

  print('\n--- Тест 1: Возведение в квадрат (анонимная функция) ---');
  List<double> squared = processor.process((num) => num * num);
  print(squared.map((n) => n.toStringAsFixed(2)).toList());

  print('\n--- Тест 2: Умножение на 10 (стрелочная функция) ---');
  List<double> multiplied = processor.process((num) => num * 10);
  print(multiplied.map((n) => n.toStringAsFixed(2)).toList());
}
