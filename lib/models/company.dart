class Company
{
  int coID;
  String email;
  String password;
  String name;
  String address;
  String website;
  

 Company(this.email,this.password,this.name,this.address,this.website);
 

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["Coemail"] = email;
    map["Copassword"] = password;
    map["Coname"] =name;
    map["Coaddress"] = address;
    map["Cowebsite"] = website;
    



    if (coID != null) {
      map["Coid"] = coID;
    }
    return map;
  }

  Company.fromMap(Map<String, dynamic> map) {

    this.coID = map["Coid"];
    this.email=map["Coemail"];
    this.password=map["Copassword"];
    this.name=map["Coname"];
    this.address= map["Coaddress"];
    this.website=map["Cowebsite"];
  }
}