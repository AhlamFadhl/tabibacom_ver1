class Doctors_Hospital {
  int hsptl_no;
  int doc_no;
  int doc_owner;
  dynamic doc_price;
  String doc_note;
  int doc_publish;

  Doctors_Hospital({
    required this.hsptl_no,
    required this.doc_no,
    required this.doc_owner,
    required this.doc_price,
    required this.doc_publish,
    required this.doc_note,
  });

  factory Doctors_Hospital.fromJson(Map<String, dynamic> json) {
    return Doctors_Hospital(
      hsptl_no: json['hsptl_no'],
      doc_no: json['doc_no'],
      doc_owner: json['doc_owner'],
      doc_price: json['doc_price'],
      doc_publish: json['doc_publish'],
      doc_note: json['doc_note'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'hsptl_no': hsptl_no,
      'doc_no': doc_no,
      'doc_owner': doc_owner,
      'doc_price': doc_price,
      'doc_publish': doc_publish,
      'doc_note': doc_note
    };
  }
}
