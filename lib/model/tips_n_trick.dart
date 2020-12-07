import 'dart:convert';

List<TipsNTrick> tipsNTrickFromJson(String str) =>
    List<TipsNTrick>.from(json.decode(str).map((x) => TipsNTrick.fromJson(x)));

String tipsNTrickToJson(List<TipsNTrick> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipsNTrick {
  TipsNTrick({
    this.idTnt,
    this.dateCreated,
    this.content,
    this.title,
    this.type,
    this.foto,
  });

  String idTnt;
  DateTime dateCreated;
  String content;
  String title;
  String type;
  String foto;
  List<String> bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  get dateString =>
      " ${dateCreated.day.toString()} ${bulan[(dateCreated.month)-1]} ${dateCreated.year}";

  get urlImage => 'http://192.168.43.150/images/$foto';
  factory TipsNTrick.fromJson(Map<String, dynamic> json) => TipsNTrick(
        idTnt: json["id_tnt"],
        dateCreated: DateTime.parse(json["date_created"]),
        content: json["content"],
        title: json["title"],
        type: json["type"],
        foto: json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "id_tnt": idTnt,
        "date_created":
            "${dateCreated.year.toString().padLeft(4, '0')}-${dateCreated.month.toString().padLeft(2, '0')}-${dateCreated.day.toString().padLeft(2, '0')}",
        "content": content,
        "title": title,
        "type": type,
        "foto": foto,
      };
}
