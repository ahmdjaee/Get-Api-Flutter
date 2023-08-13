class DataPerson {
  String id, nama, avatar, alamat, email, pekerjaan, quote;

  DataPerson(
      {required this.alamat,
      required this.avatar,
      required this.email,
      required this.id,
      required this.nama,
      required this.pekerjaan,
      required this.quote});

  factory DataPerson.fromJson(Map<String, dynamic> json) {
    return DataPerson(
        id: json['id'],
        nama: json['nama'],
        avatar: json['avatar'],
        alamat: json['alamat'],
        email: json['email'],
        pekerjaan: json['pekerjaan'],
        quote: json['quote']);
  }
}
