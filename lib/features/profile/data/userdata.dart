class UserProfile {
  final String uid;
  final String? FristName;
  final String? LastName;
  final String? email;

  UserProfile({this.LastName, required this.uid, this.FristName, this.email});

  UserProfile.fromData(Map<String, dynamic> data) :
    uid = data['uid'],
    FristName = data['frist_name'],
    LastName = data['frist_name'],
    email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'frist_name': FristName,
      'last_name': FristName,
      'email': email,
    };
  }
}



