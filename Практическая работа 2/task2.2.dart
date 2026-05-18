import 'dart:math';

// 1. Абстрактный класс Shape
abstract class Shape {
  // Абстрактный метод для вычисления площади
  double area();

  // 3. Фабричный конструктор для создания Circle или Rectangle на основе JSON
  factory Shape.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    
    if (type == 'circle') {
      // Приведение к double на случай, если в JSON придет int (например, 5 вместо 5.0)
      return Circle((json['radius'] as num).toDouble());
    } else if (type == 'rectangle') {
      return Rectangle(
        (json['width'] as num).toDouble(),
        (json['height'] as num).toDouble(),
      );
    } else {
      throw ArgumentError('Неизвестный тип фигуры: $type');
    }
  }
}

// 2. Класс Circle, наследующий Shape
class Circle implements Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() {
    return pi * radius * radius;
  }
}

// 2. Класс Rectangle, наследующий Shape
class Rectangle implements Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

void main() {
  // Тестовые JSON-данные из условия задачи
  final circleJson = {"type": "circle", "radius": 5};
  final rectangleJson = {"type": "rectangle", "width": 4, "height": 6};

  print('--- Парсинг и расчет площадей из JSON ---');

  // Создаем круг через фабричный конструктор абстрактного класса
  Shape figure1 = Shape.fromJson(circleJson);
  print('Фигура 1 (Круг):');
  print('Площадь: ${figure1.area().toStringAsFixed(2)}');

  print('-----------------------------------------');

  // Создаем прямоугольник через фабричный конструктор абстрактного класса
  Shape figure2 = Shape.fromJson(rectangleJson);
  print('Фигура 2 (Прямоугольник):');
  print('Площадь: ${figure2.area().toStringAsFixed(2)}');
}
