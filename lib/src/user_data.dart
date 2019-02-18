class UserData {
  String name;
  String email;
  List<String> answers;

  UserData(this.name, this.email, this.answers);

  UserData.empty();

  Map<String, dynamic> toMap() => {
    'name': name,
    'email': email,
    'answer': answers
  };
}
