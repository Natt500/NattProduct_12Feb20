class UserModel {

// Field

String id, name, user, password;

// Method
UserModel(this.id, this.name, this.user, this.password);

UserModel.frmMap(Map<String, dynamic> map){
id = map['id'];
name = map['Name'];
user = map['User'];
password = map['Password'];
}

  
}