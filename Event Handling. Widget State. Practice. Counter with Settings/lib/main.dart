import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CounterApp(),
  ));
}

// Задание 1: Базовая структура приложения
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  // Задание 1.3: Переменная счетчика
  int _counter = 0;
  // Задание 5.2: Переменная для хранения истории
  int? _previousCounter;

  // Задание 3.2 и 5.1: Изменение значения с ограничением диапазона
  void _updateCounter(int delta) {
    setState(() {
      int newValue = _counter + delta;
      // Ограничение диапазона от -10 до 10
      if (newValue >= -10 && newValue <= 10) {
        _previousCounter = _counter;
        _counter = newValue;
      }
    });
  }

  // Задание 3.2: Сброс счетчика
  void _resetCounter() {
    setState(() {
      if (_counter != 0) {
        _previousCounter = _counter;
        _counter = 0;
      }
    });
  }

  // Задание 4.1: Определение цвета в зависимости от значения
  Color _getCounterColor() {
    if (_counter > 0) return Colors.green;
    if (_counter < 0) return Colors.red;
    return Colors.blue;
  }

  // Задание 4.2: Определение сообщения под счетчиком
  String _getCounterMessage() {
    if (_counter > 0) return 'Положительное число';
    if (_counter < 0) return 'Отрицательное число';
    return 'Ноль';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Счетчик'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Задание 2: Крупный и выделенный текст с динамическим цветом
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: _getCounterColor(),
              ),
            ),
            const SizedBox(height: 10),
            // Задание 4.2: Динамическое сообщение
            Text(
              _getCounterMessage(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            // Задание 5.2: Виджет истории
            Text(
              _previousCounter != null
                  ? 'Предыдущее значение: $_previousCounter'
                  : 'Предыдущее значение: —',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            // Задание 3.1: Строка с тремя кнопками управления
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _updateCounter(-1),
                  child: const Text('-1'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: const Text('Сбросить'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () => _updateCounter(1),
                  child: const Text('+1'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
