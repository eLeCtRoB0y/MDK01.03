import 'dart:math';

// 1. Абстрактный класс Character
abstract class Character {
  String name;
  int health = 100;
  int level = 1;

  Character(this.name, {this.health = 100, this.level = 1});

  // Абстрактные методы
  int attack();
  void defend(int damage);

  // Общий метод
  bool isAlive() {
    return health > 0;
  }
}

// 2.а Класс Warrior (Воин)
class Warrior extends Character {
  Warrior(String name, {int level = 1}) : super(name, level: level);

  @override
  int attack() {
    return 15 + level * 2;
  }

  @override
  void defend(int damage) {
    // Защита: уменьшает урон на 20%
    int actualDamage = (damage * 0.8).round();
    health -= actualDamage;
    if (health < 0) health = 0;
    print('$name (Воин) заблокировал 20% урона. Получено урона: $actualDamage. Осталось HP: $health');
  }
}

// 2.б Класс Mage (Маг)
class Mage extends Character {
  Mage(String name, {int level = 1}) : super(name, level: level);

  @override
  int attack() {
    return 10 + level * 3;
  }

  @override
  void defend(int damage) {
    // Защита: получает полный урон, но вылечивается на 5 HP
    health -= damage;
    if (health > 0) {
      health += 5;
      if (health > 100) health = 100; // Здоровье не может быть выше начального
      print('$name (Маг) получил полный урон $damage, но исцелился на 5 HP. Осталось HP: $health');
    } else {
      health = 0;
      print('$name (Маг) получил урон $damage и погиб.');
    }
  }
}

// 2.в Класс Rogue (Разбойник)
class Rogue extends Character {
  final Random _random = Random();

  Rogue(String name, {int level = 1}) : super(name, level: level);

  @override
  int attack() {
    int baseDamage = 12 + level * 2; // Базовый урон для баланса игры
    // 20% шанс на критический удар (х3)
    if (_random.nextInt(100) < 20) {
      print(' КРИТИЧЕСКИЙ УДАР от $name!');
      return baseDamage * 3;
    }
    return baseDamage;
  }

  @override
  void defend(int damage) {
    // Защита: уворот (50% шанс избежать урона)
    if (_random.nextBool()) {
      print(' $name (Разбойник) уклонился от атаки! Урон не получен. Осталось HP: $health');
    } else {
      health -= damage;
      if (health < 0) health = 0;
      print('$name (Разбойник) не успел уклониться. Получено урона: $damage. Осталось HP: $health');
    }
  }
}

// Дополнительно: Симуляция боя между двумя персонажами
void startBattle(Character p1, Character p2) {
  print('\n!!! БИТВА НАЧИНАЕТСЯ: ${p1.name} VS ${p2.name} !!!\n');
  int round = 1;

  while (p1.isAlive() && p2.isAlive()) {
    print('--- Раунд $round ---');
    
    // Ход первого персонажа
    int damageP1 = p1.attack();
    print('${p1.name} атакует на $damageP1 урона.');
    p2.defend(damageP1);
    
    if (!p2.isAlive()) {
      print('\n ${p1.name} побеждает в бою!');
      break;
    }

    print(''); // Разделитель ходов

    // Ход второго персонажа
    int damageP2 = p2.attack();
    print('${p2.name} атакует на $damageP2 урона.');
    p1.defend(damageP2);

    if (!p1.isAlive()) {
      print('\n ${p2.name} побеждает в бою!');
      break;
    }

    round++;
    print('=' * 40);
  }
}

void main() {
  // Создаем персонажей 3-го уровня
  Warrior boris = Warrior('Борис', level: 3);
  Mage sorceress = Mage('Волшебница', level: 3);
  Rogue vitaliy = Rogue('Виталий', level: 3);

  //  передаем в бой реально созданных персонажей (например, Бориса и Виталия)
  startBattle(boris, vitaliy);
}

