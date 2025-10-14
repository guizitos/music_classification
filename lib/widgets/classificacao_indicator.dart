import 'package:flutter/material.dart';

Widget buildClassificacaoIndicator(double nota) {
  Color cor;
  String texto;
  if (nota >= 9.0) {
    cor = Colors.green;
    texto = "Excelente";
  } else if (nota >= 7.0) {
    cor = Colors.blue;
    texto = "Bom";
  } else if (nota >= 5.0) {
    cor = Colors.orange;
    texto = "Regular";
  } else {
    cor = Colors.red;
    texto = "Ruim";
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration:
        BoxDecoration(color: cor, borderRadius: BorderRadius.circular(12)),
    child: Text("${nota.toStringAsFixed(1)} • $texto",
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  );
}
