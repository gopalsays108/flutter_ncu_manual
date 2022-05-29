class Show {
  late String name;
  late String lang;
  late String type;
  late String url;
  late String certificate;
  late int likes;
  late int votes;
  late bool isNew;

  Show({
    required this.name,
    required this.lang,
    required this.type,
    required this.certificate,
    required this.likes,
    required this.votes,
    required this.isNew,
    required this.url,
  });
}
