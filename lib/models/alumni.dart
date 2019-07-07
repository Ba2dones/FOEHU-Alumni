class Alumni
{
  int alID;
  String email;
  String password;
  String name;
  int phone;
  String department;
  int gradYear;


  Alumni(this.email,this.password,this.name,this.phone,this.department,this.gradYear);
 

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["Alemail"] = email;
    map["Alpassword"] = password;
    map["Alname"] = name;
    map["Alphone"] = phone;
    map["AlDep"] = department;
    map["Algradyear"] = gradYear;


    if (alID != null) {
      map["Alid"] = alID;
    }
    return map;
  }

  Alumni.fromMap(Map<String, dynamic> map) {

    this.alID = map["Alid"];
    this.email=map["Alemail"];
    this.password=map["Alpassword"];
    this.name= map["Alname"];
    this.phone=map["Alphone"];
    this.department=map["AlDep"];
    this.gradYear=map["Algradyear"];
    

  }
}