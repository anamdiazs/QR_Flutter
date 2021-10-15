import 'dart:convert';

Welcome scanModelFromJson(String str) => Welcome.fromJson(json.decode(str));

String scanModelToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome();

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    );

    Map<String, dynamic> toJson() => {
    };
}
