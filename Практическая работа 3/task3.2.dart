class Matrix {
  List<List<double>> data;
  int rows;
  int columns;

  // Конструктор класса
  Matrix(this.data)
      : rows = data.length,
        columns = data.isNotEmpty ? data[0].length : 0;

  // Метод вывода на печать
  void printMatrix() {
    for (var row in data) {
      print(row.map((val) => val.toStringAsFixed(1)).join('\t'));
    }
  }

  // Метод сложения с другой матрицей
  Matrix add(Matrix other) {
    if (rows != other.rows || columns != other.columns) {
      throw ArgumentError('Размеры матриц должны совпадать для сложения.');
    }

    List<List<double>> resultData = List.generate(rows, (i) => 
      List.generate(columns, (j) => data[i][j] + other.data[i][j])
    );

    return Matrix(resultData);
  }

  // Метод умножения на число
  Matrix multiplyByScalar(double scalar) {
    List<List<double>> resultData = data.map((row) => 
      row.map((val) => val * scalar).toList()
    ).toList();

    return Matrix(resultData);
  }

  // Метод умножения матриц
  Matrix multiply(Matrix other) {
    if (columns != other.rows) {
      throw ArgumentError('Количество столбцов первой матрицы должно быть равно количеству строк второй матрицы.');
    }

    List<List<double>> resultData = List.generate(rows, (_) => List.filled(other.columns, 0.0));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < other.columns; j++) {
        double sum = 0;
        for (int k = 0; k < columns; k++) {
          sum += data[i][k] * other.data[k][j];
        }
        resultData[i][j] = sum;
      }
    }

    return Matrix(resultData);
  }
}

void main() {
  // Создаем тестовые матрицы
  Matrix matrixA = Matrix([
    [1.0, 2.0],
    [3.0, 4.0]
  ]);

  Matrix matrixB = Matrix([
    [5.0, 6.0],
    [7.0, 8.0]
  ]);

  print('--- Матрица А (${matrixA.rows}x${matrixA.columns}) ---');
  matrixA.printMatrix();

  print('\n--- Матрица Б (${matrixB.rows}x${matrixB.columns}) ---');
  matrixB.printMatrix();

  print('\n1. Результат сложения (А + Б):');
  Matrix sumResult = matrixA.add(matrixB);
  sumResult.printMatrix();

  print('\n2. Результат умножения матрицы А на число 3:');
  Matrix scalarResult = matrixA.multiplyByScalar(3);
  scalarResult.printMatrix();

  print('\n3. Результат умножения матриц (А * Б):');
  Matrix multiplyResult = matrixA.multiply(matrixB);
  multiplyResult.printMatrix();
}
