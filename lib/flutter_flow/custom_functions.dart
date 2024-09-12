import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> calendarDropdown() {
  List<String> todosLosMeses = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  DateTime ahora = DateTime.now();
  int indiceMesActual = ahora.month;

  // Filtrar los meses que son mayores al mes actual
  List<String> mesesDisponibles = todosLosMeses.sublist(0, indiceMesActual);

  return mesesDisponibles;
}

int? presupuestoDisponibleValido(int? presupuestoDisponibleGrafico) {
  return (presupuestoDisponibleGrafico != null &&
          presupuestoDisponibleGrafico >= 0)
      ? presupuestoDisponibleGrafico
      : 0;
}

double? funcionAjusteDeCuenta(double? monto) {
  // Verificar si monto no es nulo
  if (monto != null) {
    double ajuste = monto * (-1); // Multiplicar por -1 para invertir el signo
    return ajuste; // Devolver el ajuste calculado
  } else {
    return null; // Si el monto es nulo, devolver nulo
  }
}
