import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
    Transaction({
        this.idTransaction,
        this.idUser,
        this.type,
        this.value,
        this.description,
    });

    String idTransaction;
    String idUser;
    String type;
    String value;
    String description;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        idTransaction: json["id_transaction"],
        idUser: json["id_user"],
        type: json["type"],
        value: json["value"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id_transaction": idTransaction,
        "id_user": idUser,
        "type": type,
        "value": value,
        "description": description,
    };
}
