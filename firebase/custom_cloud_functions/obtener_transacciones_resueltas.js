const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.obtenerTransaccionesResueltas = functions.https.onCall(
  async (data, context) => {
    try {
      const db = admin.firestore(); // Inicializar Firestore

      // Verificar que el usuario esté autenticado
      if (!context.auth) {
        throw new functions.https.HttpsError(
          "unauthenticated",
          "El usuario no está autenticado.",
        );
      }

      // Obtener el UID del usuario autenticado
      const uid = context.auth.uid;

      // Consultar la colección Transacciones solo del usuario autenticado
      const transaccionesSnapshot = await db
        .collection("Transacciones")
        .where("uid", "==", uid) // Filtra por el UID del usuario autenticado
        .get();

      let transaccionesGasto = [];
      let transaccionesIngreso = [];
      let transaccionesTraspaso = [];
      let transaccionesAhorro = [];

      // Iterar sobre las transacciones
      for (let transDoc of transaccionesSnapshot.docs) {
        const transData = transDoc.data();

        // Resolver referencias de categoría
        let categoria = "Sin Categoría";
        if (
          transData.categoria &&
          transData.categoria instanceof admin.firestore.DocumentReference
        ) {
          const categoriaDoc = await transData.categoria.get();
          categoria = categoriaDoc.exists
            ? categoriaDoc.data().categoria
            : "Sin Categoría";
        }

        // Resolver referencias de etiqueta o asignar "Sin Etiqueta" si el campo es nulo o no es una referencia
        let etiqueta = "Sin Etiqueta";
        if (
          transData.etiqueta &&
          transData.etiqueta instanceof admin.firestore.DocumentReference
        ) {
          const etiquetaDoc = await transData.etiqueta.get();
          etiqueta = etiquetaDoc.exists
            ? etiquetaDoc.data().etiqueta
            : "Sin Etiqueta";
        }

        // Resolver referencias de cuenta
        let cuenta = "Sin Cuenta";
        if (
          transData.cuenta &&
          transData.cuenta instanceof admin.firestore.DocumentReference
        ) {
          const cuentaDoc = await transData.cuenta.get();
          cuenta = cuentaDoc.exists ? cuentaDoc.data().cuenta : "Sin Cuenta";
        }

        // Agrupar por tipo de movimiento
        const movimiento = transData.movimiento.toLowerCase();

        if (movimiento === "gasto") {
          transaccionesGasto.push({
            ...transData,
            categoria,
            etiqueta,
            cuenta,
          });
        } else if (movimiento === "ingreso") {
          transaccionesIngreso.push({
            ...transData,
            categoria,
            cuenta,
          });
        } else if (movimiento === "traspaso") {
          transaccionesTraspaso.push({
            ...transData,
            cuenta,
          });
        } else if (movimiento === "ahorro") {
          transaccionesAhorro.push({
            ...transData,
            cuenta,
          });
        }
      }

      // Log para mostrar los datos obtenidos
      console.log(
        "Transacciones de Gasto:",
        JSON.stringify(transaccionesGasto),
      );
      console.log(
        "Transacciones de Ingreso:",
        JSON.stringify(transaccionesIngreso),
      );
      console.log(
        "Transacciones de Traspaso:",
        JSON.stringify(transaccionesTraspaso),
      );
      console.log(
        "Transacciones de Ahorro:",
        JSON.stringify(transaccionesAhorro),
      );

      // Devolver las transacciones agrupadas
      return {
        transaccionesGasto,
        transaccionesIngreso,
        transaccionesTraspaso,
        transaccionesAhorro,
      };
    } catch (error) {
      console.error("Error al obtener las transacciones: ", error);
      throw new functions.https.HttpsError(
        "internal",
        "Error al procesar las transacciones",
      );
    }
  },
);
