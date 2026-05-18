void main() {
  // 1. Принимаем строку
  String inputString = 'Flutter';
  
  // Строка со всеми английскими гласными буквами (включая y)
  String vowels = 'aeiouy';
  int count = 0;

  // 2. Подсчитываем количество гласных букв в цикле
  for (int i = 0; i < inputString.length; i++) {
    // Берем текущий символ и переводим в нижний регистр для учета регистра
    String char = inputString[i].toLowerCase();
    
    // Если символ есть в строке гласных, увеличиваем счетчик
    if (vowels.contains(char)) {
      count++;
    }
  }

  // 3. Выводим результат в нужном формате
  print('Слово: $inputString');
  print('Гласных букв: $count');
}
