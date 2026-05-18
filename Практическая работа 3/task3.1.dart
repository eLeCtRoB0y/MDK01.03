class Phone {
  String number;
  String model;
  double weight;

  // 1. Главный конструктор с тремя параметрами — он просто принимает все три поля напрямую
  Phone(this.number, this.model, this.weight);

  // 2. Конструктор с двумя параметрами вызывает конструктор с тремя, 
  // подставляя для веса значение 0.0 по умолчанию
  Phone.twoParams(String number, String model) : this(number, model, 0.0);

  // 3. Конструктор без параметров вызывает конструктор с тремя, подставляя дефолты
  Phone.empty() : this('Неизвестно', 'Неизвестно', 0.0);

  // Метод принимает имя звонящего
  void receiveCall(String name) {
    print('Звонит $name');
  }

  // Метод возвращает номер телефона
  String getNumber() {
    return number;
  }

  // Метод принимает аргументы переменной длины
  void sendMessage(List<String> numbers) {
    print('Сообщение будет отправлено на следующие номера:');
    for (var num in numbers) {
      print(num);
    }
  }
}

void main() {
  Phone phone1 = Phone('+7-999-111-22-33', 'iPhone 15', 187.0);
  Phone phone2 = Phone.twoParams('+7-999-444-55-66', 'Samsung S24');
  Phone phone3 = Phone.empty();

  print('--- Телефон 1 ---');
  print('Номер: ${phone1.number}, Модель: ${phone1.model}, Вес: ${phone1.weight}г');
  
  print('\n--- Телефон 2 ---');
  print('Номер: ${phone2.number}, Модель: ${phone2.model}, Вес: ${phone2.weight}г');
  
  print('\n--- Телефон 3 ---');
  print('Номер: ${phone3.number}, Модель: ${phone3.model}, Вес: ${phone3.weight}г');

  print('\n--- Тестирование методов ---');
  phone1.receiveCall('Анна');
  print('Получен номер: ${phone1.getNumber()}');
  print('---');

  phone1.sendMessage(['+7-900-000-00-01', '+7-900-000-00-02']);
}
