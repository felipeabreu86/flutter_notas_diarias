import 'dart:convert';

class Anotacao {
  int id;
  String titulo;
  String descricao;
  String data;

  Anotacao.id({
    this.id,
    this.titulo,
    this.descricao,
    this.data,
  });

  Anotacao({
    this.titulo,
    this.descricao,
    this.data,
  });

  Anotacao copyWith({
    int id,
    String titulo,
    String descricao,
    String data,
  }) {
    return Anotacao.id(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "titulo": this.titulo,
      "descricao": this.descricao,
      "data": this.data,
    };
    if (this.id != null) {
      map["id"] = this.id;
    }
    return map;
  }

  static Anotacao fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Anotacao.id(
      id: map['id'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  static Anotacao fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Anotacao id: $id, titulo: $titulo, descricao: $descricao, data: $data';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Anotacao &&
        o.id == id &&
        o.titulo == titulo &&
        o.descricao == descricao &&
        o.data == data;
  }

  @override
  int get hashCode {
    return id.hashCode ^ titulo.hashCode ^ descricao.hashCode ^ data.hashCode;
  }
}
