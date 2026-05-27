import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Заголовок
                const Text(
                    '"Электрический самокат Kugoo Kirin X1"',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                // Изображение
                Image.network(
                  'https://ir.ozone.ru/s3/multimedia-1-7/wc2500/7020090547.jpg',
                  width: 200,
                  height: 150,
                ),
                const SizedBox(height: 10),

                // Описание и характеристики
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Аккумулятор 48 V 13 Ah, мощность 600 W, до 45 км./ч., до 45 км., 20 кг., задний привод, 8"',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),

                Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    // Цена
                    Text(
                      '47 990 руб.',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    // Рейтинг
                    Text(
                      'Рейтинг: 4.68',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
