class PasswordValidator {
  // 1. Константные требования к паролю
  static const int minLength = 8;
  
  // Регулярное выражение для проверки наличия хотя бы одной цифры
  static final RegExp _digitRegExp = RegExp(r'\d');

  // 2. Статический метод для проверки пароля
  static bool validate(String password) {
    // Проверка длины пароля
    if (password.length < minLength) {
      return false;
    }
    
    // Проверка наличия хотя бы одной цифры
    if (!_digitRegExp.hasMatch(password)) {
      return false;
    }

    return true; // Пароль прошёл все проверки
  }
}

void main() {
  print('--- Тестирование PasswordValidator ---');

  List<String> testPasswords = [
    'Aezakmi',       // Меньше 8 символов, нет цифры (false)
    'Qwertyuiop',   // Больше 8 символов, но нет цифры (false)
    '1234567',      // Меньше 8 символов, есть цифры (false)
    'Password123',  // Больше 8 символов, есть цифры (true)
    'TestPass321',  // Больше 8 символов, есть цифры (true)
  ];

  for (var pass in testPasswords) {
    bool isValid = PasswordValidator.validate(pass);
    print('Пароль: "$pass" -> ${isValid ? "Корректный ✔" : "Некорректный ❌"}');
  }
}
