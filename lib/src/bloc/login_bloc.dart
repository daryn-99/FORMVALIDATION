import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _nombreController = BehaviorSubject<String>();
  final _apellidoController = BehaviorSubject<String>();
  final _dateController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get nombreStream =>
      _nombreController.stream.transform(validarNombre);
  Stream<String> get apellidoStream =>
      _apellidoController.stream.transform(validarApellido);
  Stream<String> get dateStream =>
      _dateController.stream.transform(validarDate);
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => CombineLatestStream.combine5(
      nombreStream,
      apellidoStream,
      dateStream,
      emailStream,
      passwordStream,
      (n, a, d, e, p) => true);

  //Getters
  //Insertar valores al String

  Function(String) get changeNombre => _nombreController.sink.add;
  Function(String) get changeApellido => _apellidoController.sink.add;
  Function(String) get changeDate => _dateController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el ultimo valor ingresado a los streams
  String get nombre => _nombreController.value;
  String get apellido => _nombreController.value;
  String get date => _dateController.value;
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _nombreController?.close();
    _apellidoController?.close();
    _dateController?.close();
    _emailController?.close();
    _passwordController?.close();
  }
}
