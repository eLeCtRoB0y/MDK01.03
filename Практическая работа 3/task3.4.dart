// Базовый класс Студент
class Student {
  String firstName;
  String lastName;
  String group;
  double averageMark;

  // Конструктор класса Student
  Student(this.firstName, this.lastName, this.group, this.averageMark);

  // Метод для расчета стипендии студента
  int getScholarship() {
    return averageMark == 5 ? 2000 : 1900;
  }
}

// Класс Аспирант, который наследуется от Студента
class Aspirant extends Student {
  String scientificWork; // Научная работа

  // Конструктор класса Aspirant, вызывающий конструктор базового класса через super
  Aspirant(
    String firstName, 
    String lastName, 
    String group, 
    double averageMark, 
    this.scientificWork
  ) : super(firstName, lastName, group, averageMark);

  // Переопределение метода расчета стипендии для аспиранта
  @override
  int getScholarship() {
    return averageMark == 5 ? 2500 : 2200;
  }
}

void main() {
  // Создание массива (List) типа Student, содержащего и студентов, и аспирантов
  List<Student> students = [
    Student('Иван', 'Иванов', 'ИСП-401', 4.8),
    Student('Мария', 'Петрова', 'ИСП-402', 5.0),
    Aspirant('Алексей', 'Сидоров', 'А-101', 4.5, 'Исследование ИИ во Flutter'),
    Aspirant('Елена', 'Козлова', 'А-102', 5.0, 'Оптимизация баз данных NoSQL'),
  ];

  print('--- Расчет стипендий ---');

  // Вызов метода getScholarship() для каждого элемента массива
  for (var person in students) {
    String role = person is Aspirant ? 'Аспирант' : 'Студент';
    
    print('$role: ${person.firstName} ${person.lastName}');
    print('Средняя оценка: ${person.averageMark}');
    print('Стипендия: ${person.getScholarship()} руб.');
    print('-----------------------------------');
  }
}
