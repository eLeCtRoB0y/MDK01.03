void main() {
  // 1. Объявление переменных с подходящими типами данных
  String name = 'Дамир';          // Имя (строка)
  int age = 32;                     // Возраст (целое число)
  double averageGrade = 4.75;       // Средний балл (дробное число)
  bool isStudent = true;            // Статус студента (логический тип)

  // 2. Вывод значений и их типов в консоль с помощью .runtimeType
  print('Имя: $name [${name.runtimeType}]');
  print('Возраст: $age [${age.runtimeType}]');
  print('Средний балл: $averageGrade [${averageGrade.runtimeType}]');
  
  // Для статуса студента используем тернарный оператор, чтобы вывести "да" или "нет"
  String studentStatusText = isStudent ? 'да' : 'нет';
  print('Студент: $studentStatusText [${isStudent.runtimeType}]');
}
