class Transporte {
  final int id;
  final String nombre;
  final String imagen;

  Transporte({this.id, this.nombre, this.imagen});
}

final colectivo =
    Transporte(id: 0, nombre: 'Colectivo', imagen: 'colectivo.png');

final subte = Transporte(id: 1, nombre: 'Subte', imagen: 'subte.png');

final tren = Transporte(id: 2, nombre: 'Tren', imagen: 'tren.png');

final telepase = Transporte(id: 3, nombre: 'Telepase', imagen: 'telepase.png');

final beneficio =
    Transporte(id: 4, nombre: 'Beneficios', imagen: 'beneficio.png');

final transportes = [colectivo, subte, tren, telepase, beneficio];
