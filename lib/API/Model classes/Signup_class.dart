class Signup {
  String? error;
  String? errorMsg;

  Signup({this.error, this.errorMsg});

  Signup.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorMsg = json['error_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['error_msg'] = this.errorMsg;
    return data;
  }
}
