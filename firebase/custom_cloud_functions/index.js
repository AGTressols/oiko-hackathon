const admin = require("firebase-admin/app");
admin.initializeApp();

const obtenerTransaccionesResueltas = require("./obtener_transacciones_resueltas.js");
exports.obtenerTransaccionesResueltas =
  obtenerTransaccionesResueltas.obtenerTransaccionesResueltas;
