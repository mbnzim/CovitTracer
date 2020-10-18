class User {
  String id;
  String uuid;
  String userConfirmed;
  String status;


  User({this.id,this.uuid,this.userConfirmed,this.status});
  
  factory User.fromJson(Map<String, dynamic> item) {
    return User(
      id: item['id'],
      uuid: item['uuid'],
      userConfirmed: item['userConfirmed'],
      status: item['status']
    );
  }
}
