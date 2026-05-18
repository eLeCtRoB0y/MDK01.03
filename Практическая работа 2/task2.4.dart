import 'dart:math';

// Класс Банковский счет
class BankAccount {
  final String accountNumber;
  double balance;
  String ownerName;

  // Конструктор: balance по умолчанию = 0, accountNumber генерируется случайно
  BankAccount(this.ownerName)
      : balance = 0.0,
        accountNumber = _generateAccountNumber();

  // Приватный метод для генерации случайного 10-значного номера счета
  static String _generateAccountNumber() {
    final random = Random();
    String number = '';
    for (int i = 0; i < 10; i++) {
      number += random.nextInt(10).toString();
    }
    return number;
  }

  // Пополнение счета
  void deposit(double amount) {
    if (amount <= 0) {
      print('Ошибка: сумма пополнения должна быть больше нуля.');
      return;
    }
    balance += amount;
    print('Счет $accountNumber пополнен на $amount руб. Текущий баланс: $balance руб.');
  }

  // Снятие денег
  bool withdraw(double amount) {
    if (amount <= 0) {
      print('Ошибка: сумма снятия должна быть больше нуля.');
      return false;
    }
    if (amount > balance) {
      print('Ошибка: недостаточно средств на счете $accountNumber (доступно: $balance руб.).');
      return false;
    }
    balance -= amount;
    print('Со счета $accountNumber снято $amount руб. Текущий баланс: $balance руб.');
    return true;
  }

  // Вывод текущего баланса
  void displayBalance() {
    print('Владелец: $ownerName | Счет: $accountNumber | Баланс: $balance руб.');
  }
}

// Класс Банк
class Bank {
  List<BankAccount> accounts = [];

  // Создает новый счет и добавляет его в список
  void addAccount(String ownerName) {
    final newAccount = BankAccount(ownerName);
    accounts.add(newAccount);
    print('Создан новый счет для пользователя $ownerName (№ ${newAccount.accountNumber}).');
  }

  // Поиск счета по номеру (возвращает счет или null)
  BankAccount? findAccount(String accountNumber) {
    for (var account in accounts) {
      if (account.accountNumber == accountNumber) {
        return account;
      }
    }
    return null;
  }

  // Перевод денег между счетами
  void transfer(String fromAccountNumber, String toAccountNumber, double amount) {
    if (amount <= 0) {
      print('Ошибка перевода: сумма должна быть больше нуля.');
      return;
    }

    final fromAccount = findAccount(fromAccountNumber);
    final toAccount = findAccount(toAccountNumber);

    if (fromAccount == null) {
      print('Ошибка перевода: счет отправителя $fromAccountNumber не найден.');
      return;
    }
    if (toAccount == null) {
      print('Ошибка перевода: счет получателя $toAccountNumber не найден.');
      return;
    }

    // Если получилось успешно снять деньги со счета отправителя, то зачисляем получателю
    if (fromAccount.withdraw(amount)) {
      toAccount.balance += amount; // Зачисляем напрямую без вывода лишних принтов deposit
      print('Успешный перевод: $amount руб. со счета $fromAccountNumber на счет $toAccountNumber.');
    }
  }
}

void main() {
  print('--- Тестирование банковской системы ---');
  Bank sber = Bank();

  // 1. Создаем два счета
  sber.addAccount('Алексей');
  sber.addAccount('Мария');

  // Получаем сгенерированные номера для тестов
  String acc1 = sber.accounts[0].accountNumber;
  String acc2 = sber.accounts[1].accountNumber;

  print('\n--- Проверка баланса изначально ---');
  sber.accounts[0].displayBalance();
  sber.accounts[1].displayBalance();

  print('\n--- Операции со счетом Алексея ---');
  sber.accounts[0].deposit(5000); // Пополнение
  sber.accounts[0].withdraw(1500); // Корректное снятие
  sber.accounts[0].withdraw(10000); // Попытка снять больше, чем есть

  print('\n--- Операция перевода Марии ---');
  sber.transfer(acc1, acc2, 2000); // Перевод 2000 рублей

  print('\n--- Итоговое состояние счетов ---');
  sber.accounts[0].displayBalance();
  sber.accounts[1].displayBalance();
}
