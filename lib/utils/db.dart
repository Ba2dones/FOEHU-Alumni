import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/job.dart';
import '../models/admin.dart';
import '../models/alumni.dart';
import '../models/company.dart';

class DbHelper
{

  static DbHelper _dbHelper;
  static Database db;
 DbHelper._createInstance();
 Future<Database> get database async{

   if (db == null)
   {
      db = await initDB();
   }
   return db;

 }
  factory DbHelper()
  {
    if (_dbHelper ==null) {
      _dbHelper=DbHelper._createInstance();
    }
     return _dbHelper;
  }
 Future<Database> initDB()async
  {
    Directory docDir = await getApplicationDocumentsDirectory();
    final path = join(docDir.path, 'jobs.db');
    var jobsDB= openDatabase(path,version:2,onCreate:_createDB);
    return jobsDB;

  }
   void _createDB(Database db , int version) async
   {
       print("Created Db Successfully");
      await db.execute('''
      CREATE TABLE Jobs (
        jobID INTEGER PRIMARY KEY AUTOINCREMENT, 
        jobTitle TEXT,
        jobType TEXT,
        jopLocation TEXT,
        jopDepartment TEXT,
        yearsOfExperiance INTEGER,
        jopURL TEXT,
        jobDescription TEXT,
        jobApproved  INTEGER DEFAULT 0
        )''');
        await db.execute('''
      CREATE TABLE Admin (
        Aid INTEGER PRIMARY KEY AUTOINCREMENT, 
        Aemail TEXT,
        Apassword TEXT
        )''');
      await db.execute('''
      CREATE TABLE Alumni (
        Alid INTEGER PRIMARY KEY AUTOINCREMENT, 
        Alemail TEXT,
        Alpassword TEXT,
        Alname TEXT,
        Alphone INTEGER,
        AlDep TEXT,
        Algradyear INTEGER
        )''');
       await db.execute('''
      CREATE TABLE Company (
        Coid INTEGER PRIMARY KEY AUTOINCREMENT, 
        Coemail TEXT,
        Copassword TEXT,
        Coname TEXT,
        Coaddress TEXT,
        Cowebsite TEXT
        )''');
   }


 Future<int> addJob(Job job) async
 {
   print("let's add some Data");

   Database dbs= await this.database;
   var res= await dbs.insert('Jobs', job.toMap());
   //var res=await db.rawInsert("INSERT INTO Jobs(jobTitle,yearOfGraduation,salary,department,URL,jobDescription) VALUES(${job['jobTitle']})");
   return res;
 }

 Future<int> approveJob(int jobID) async
 {
   print("let's Update some Data");

   Database dbs= await this.database;
   var res= await dbs.rawUpdate("UPDATE Jobs SET jobApproved = 1 WHERE jobID = $jobID ");
   //var res=await db.rawInsert("INSERT INTO Jobs(jobTitle,yearOfGraduation,salary,department,URL,jobDescription) VALUES(${job['jobTitle']})");
   return res;
 }

  Future<List<Map<String,dynamic>>> fetchJobs() async
 {
   print("let's get some Data");

   Database dbs= await this.database;
   //var res=await dbs.rawQuery('SELECT * FROM Jobs');
   var res=await dbs.rawQuery('SELECT * FROM Jobs as J , Alumni as A WHERE j.jopDepartment = A.AlDep  AND j.jobApproved= 1');
   //print(res);
   return res;//.toList();
 }

   Future<List<Map<String,dynamic>>> fetchALLJobs() async
 {
   print("let's get some Data");

   Database dbs= await this.database;
   //var res=await dbs.rawQuery('SELECT * FROM Jobs');
   var res=await dbs.rawQuery('SELECT * FROM Jobs');
   //print(res);
   return res;//.toList();
 }
 Future<int> alumniRegister(Alumni alumni) async
 {
   print("let's add some Alumni");

   Database dbs= await this.database;
   var res= await dbs.insert('Alumni', alumni.toMap());
   return res;
 }

  Future<int> adminRegister(Admin admin) async
 {
   print("let's add some Admins");

   Database dbs= await this.database;
   var res= await dbs.insert('Admin', admin.toMap());
   return res;
 }

 Future<int> companyRegister(Company company) async
 {
   print("let's add some companies");
   Database dbs= await this.database;
   var res= await dbs.insert('Company', company.toMap());
   return res;
 }

  Future<List<Map<String,dynamic>>> fetchAdmin(String email, String password) async
 {
   print("let's get some Admins");

   Database dbs= await this.database;
   var res=await dbs.rawQuery("SELECT * FROM Admin WHERE Aemail='$email' AND Apassword='$password' ");
   //print(res);
   return res;//.toList();
 }
  Future<List<Map<String,dynamic>>> fetchAlumni(String email, String password) async
 {
   print("let's get some Alumni");

   Database dbs= await this.database;
   var res=await dbs.rawQuery("SELECT * FROM Alumni WHERE Alemail='$email' AND Alpassword='$password' ");
   //print(res);
   return res;//.toList();
 }
  Future<List<Map<String,dynamic>>> fetchCompany(String email, String password) async
 {
   print("let's get some Companies");

   Database dbs= await this.database;
   var res=await dbs.rawQuery("SELECT * FROM Company WHERE Coemail='$email' AND Copassword='$password'");
   //print(res);
   return res;//.toList();
 }

}