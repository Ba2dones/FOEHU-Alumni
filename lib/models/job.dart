class Job{

  int id;
  String jobTitle;
  String jobType;
  String jopLocation;
  String jopDepartment;
  int yearsOfExperiance;
  String jopURL;
  String jobDescription;
  //int approved;

  Job(this.jobTitle,this.jobType,this.jopLocation,this.jopDepartment,this.yearsOfExperiance,this.jopURL,this.jobDescription);

  //Job.withId(this._id,this._jobTitle,this._yearOfExperiance,this._salary,this._jopDepartment,this._jobDescription);
  
  int get Id => id;
  String get title => jobTitle;
  String get type => jobType;
  String get loaction => jopLocation;
  String get department => jopDepartment;
  int get year => yearsOfExperiance;
  String get url => jopURL;
  String get description => jobDescription;
 

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["jobTitle"] = jobTitle;
    map["jobType"] = jobType;
    map["jopLocation"] = jopLocation;
    map["jopDepartment"] = jopDepartment;
    map["yearsOfExperiance"] = yearsOfExperiance;
    map["jopURL"] = jopURL;
    map["jobDescription"] = jobDescription;

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Job.fromMap(Map<String, dynamic> map) {

    this.id = map["id"];
    this.jobTitle=map["jobTitle"];
    this.jobType=map["jobType"];
    this.jopLocation=map["jopLocation"];
    this.jopDepartment= map["jopDepartment"];
    this.yearsOfExperiance=map["yearsOfExperiance"];
    this.jopURL= map["jopURL"];
    this.jobDescription=map["jobDescription"];
  }


}