import 'dart:io';

class Usuario {
  String cedula = '';
  String nombre = '';
  String login = '';
  String clave = '';
  String ciudad = '';
}

Usuario usuario = Usuario();
List<String> menuOpciones = [
  '1. Capturar datos del usuario',
  '2. Cambiar clave del usuario',
  '3. Mostrar tablas de multiplicar',
  '4. Verificar si un número es primo',
  '5. Personalizar orden del menú',
  '6. Salir'
];

void main() {
  bool salir = false;

  while (!salir) {
    print('\n📋 MENÚ PRINCIPAL');
    for (var opcion in menuOpciones) {
      print(opcion);
    }

    stdout.write('\nSeleccione una opción: ');
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        capturarDatos();
        break;
      case '2':
        cambiarClave();
        break;
      case '3':
        mostrarTablas();
        break;
      case '4':
        verificarPrimo();
        break;
      case '5':
        personalizarMenu();
        break;
      case '6':
        mostrarDespedida();
        salir = true;
        break;
      default:
        print('❌ Opción inválida. Intente de nuevo.');
    }
  }
}

void capturarDatos() {
  stdout.write('Ingrese cédula: ');
  usuario.cedula = stdin.readLineSync() ?? '';
  stdout.write('Ingrese nombre completo: ');
  usuario.nombre = stdin.readLineSync() ?? '';
  stdout.write('Ingrese login: ');
  usuario.login = stdin.readLineSync() ?? '';
  stdout.write('Ingrese clave: ');
  usuario.clave = stdin.readLineSync() ?? '';
  stdout.write('Ingrese ciudad: ');
  usuario.ciudad = stdin.readLineSync() ?? '';
  print('✅ Datos capturados correctamente.');
}

void cambiarClave() {
  stdout.write('Ingrese login: ');
  String login = stdin.readLineSync() ?? '';
  stdout.write('Ingrese clave actual: ');
  String claveActual = stdin.readLineSync() ?? '';

  if (login == usuario.login && claveActual == usuario.clave) {
    stdout.write('Ingrese nueva clave: ');
    usuario.clave = stdin.readLineSync() ?? '';
    print('🔐 Clave actualizada con éxito.');
  } else {
    print('❌ Login o clave incorrectos.');
  }
}

void mostrarTablas() {
  stdout.write('Ingrese número mínimo: ');
  int min = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  stdout.write('Ingrese número máximo: ');
  int max = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  for (int i = min; i <= max; i++) {
    print('\nTabla del $i');
    for (int j = 1; j <= 10; j++) {
      print('$i x $j = ${i * j}');
    }
  }
}

void verificarPrimo() {
  stdout.write('Ingrese un número entero mayor a 1: ');
  int num = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (num <= 1) {
    print('⚠️ Error: el número debe ser mayor a 1.');
    return;
  }

  bool esPrimo = true;
  for (int i = 2; i <= num ~/ 2; i++) {
    if (num % i == 0) {
      esPrimo = false;
      break;
    }
  }

  print(esPrimo ? '✅ $num es primo.' : '❌ $num no es primo.');
}

void personalizarMenu() {
  print('\nSeleccione su opción preferida (1, 2 o 3):');
  stdout.write('Opción: ');
  String? preferida = stdin.readLineSync();

  if (['1', '2', '3'].contains(preferida)) {
    String seleccionada = menuOpciones[int.parse(preferida!) - 1];
    menuOpciones.remove(seleccionada);
    menuOpciones.insert(0, seleccionada);
    print('🔄 Menú actualizado con su opción preferida al inicio.');
  } else {
    print('❌ Opción inválida.');
  }
}

void mostrarDespedida() {
  print('\n🧾 DATOS PERSONALES');
  print('┌────────────────────────────────────────────┐');
  print('│ Codigo: 1025652983');
  print('│ Nombre completo: Simon Vasquez Escobar'); 
  print('│ Ciudad: Medellin');
  print('│ Correo: simonvasquez550@gmail.com           │');
  print('│ Fecha de nacimiento: 07/07/2008         │');
  print('│ Lugar de nacimiento: Medellin, Antioquia     │');
  print('│ Autoevaluación: 4.0 Me califico con 4.0 porque considero que logré implementar de manera correcta la mayoría de los requerimientos del programa │');
  print('└────────────────────────────────────────────┘');
  print('👋 ¡Gracias por usar el programa!');
}

