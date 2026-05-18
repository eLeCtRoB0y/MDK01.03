void main() {
  // Примеры матриц для демонстрации работы калькулятора
  List<List<double>> matrixA = [
    [3, 4],
    [2, 6]
  ];

  List<List<double>> matrixB = [
    [5, 7],
    [2, 9]
  ];

  print('--- Матрица А ---');
  printMatrix(matrixA);
  print('--- Матрица Б ---');
  printMatrix(matrixB);

  try {
    print('\n1. Сложение (A + B):');
    printMatrix(add(matrixA, matrixB));

    print('\n2. Вычитание (A - B):');
    printMatrix(subtract(matrixA, matrixB));

    print('\n3. Умножение на число 2 (A * 2):');
    printMatrix(multiplyByScalar(matrixA, 2));

    print('\n4. Умножение матриц (A * B):');
    printMatrix(multiply(matrixA, matrixB));

    print('\n5. Транспонирование (A^T):');
    printMatrix(transpose(matrixA));

    print('\n6. Определитель матрицы А:');
    print(determinant(matrixA));

  } catch (e) {
    print('Ошибка: $e');
  }
}

// Вспомогательный метод для красивого вывода матрицы в консоль
void printMatrix(List<List<double>> matrix) {
  for (var row in matrix) {
    print(row.map((val) => val.toStringAsFixed(1)).join('\t'));
  }
}

// 1. Сложение матриц
List<List<double>> add(List<List<double>> a, List<List<double>> b) {
  if (a.length != b.length || a[0].length != b[0].length) {
    throw ArgumentError('Размеры матриц должны совпадать для сложения.');
  }
  return List.generate(a.length, (i) => 
    List.generate(a[0].length, (j) => a[i][j] + b[i][j])
  );
}

// 2. Вычитание матриц
List<List<double>> subtract(List<List<double>> a, List<List<double>> b) {
  if (a.length != b.length || a[0].length != b[0].length) {
    throw ArgumentError('Размеры матриц должны совпадать для вычитания.');
  }
  return List.generate(a.length, (i) => 
    List.generate(a[0].length, (j) => a[i][j] - b[i][j])
  );
}

// 3а. Умножение матрицы на число (скаляр)
List<List<double>> multiplyByScalar(List<List<double>> matrix, double scalar) {
  return matrix.map((row) => row.map((val) => val * scalar).toList()).toList();
}

// 3б. Умножение двух матриц
List<List<double>> multiply(List<List<double>> a, List<List<double>> b) {
  if (a[0].length != b.length) {
    throw ArgumentError('Количество столбцов матрицы А должно быть равно числу строк матрицы Б.');
  }
  int rowsA = a.length;
  int colsA = a[0].length;
  int colsB = b[0].length;

  List<List<double>> result = List.generate(rowsA, (_) => List.filled(colsB, 0.0));

  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      double sum = 0;
      for (int k = 0; k < colsA; k++) {
        sum += a[i][k] * b[k][j];
      }
      result[i][j] = sum;
    }
  }
  return result;
}

// 4. Транспонирование матрицы
List<List<double>> transpose(List<List<double>> matrix) {
  int rows = matrix.length;
  int cols = matrix[0].length;
  return List.generate(cols, (j) => List.generate(rows, (i) => matrix[i][j]));
}

// 5. Вычисление определителя (для квадратных матриц до 3х3 включительно)
double determinant(List<List<double>> matrix) {
  int rows = matrix.length;
  int cols = matrix[0].length;

  if (rows != cols) {
    throw ArgumentError('Матрица должна быть квадратной для вычисления определителя.');
  }

  if (rows == 1) return matrix[0][0];
  if (rows == 2) return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][2 - 1]; // ad - bc

  if (rows == 3) {
    return matrix[0][0] * (matrix[1][1] * matrix[2][2] - matrix[1][2] * matrix[2][1]) -
           matrix[0][1] * (matrix[1][0] * matrix[2][2] - matrix[1][2] * matrix[2][0]) +
           matrix[0][2] * (matrix[1][0] * matrix[2][1] - matrix[1][1] * matrix[2][0]);
  }

  throw UnimplementedError('Данный алгоритм поддерживает вычисление определителя только до размера 3х3.');
}
