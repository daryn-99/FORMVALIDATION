import 'dart:convert';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  ProductoModel({
    this.id,
    this.nombre = '',
    this.apellido = '',
    this.fechaDeNacimiento = '',
    this.titulo = "",
    this.valor = 0.0,
    this.disponible = true,
    this.fotoUrl,
  });

  String id;
  String nombre;
  String apellido;
  String fechaDeNacimiento;
  String titulo;
  double valor;
  bool disponible;
  String fotoUrl;

  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        fechaDeNacimiento: json["fecha de nacimiento"],
        titulo: json["titulo"],
        valor: json["valor"],
        disponible: json["disponible"],
        fotoUrl: json["fotoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "fecha de nacimiento": fechaDeNacimiento,
        "titulo": titulo,
        "valor": valor,
        "disponible": disponible,
        "fotoUrl": fotoUrl,
      };
}
