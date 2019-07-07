import 'package:flutter/material.dart';
import 'assets/AdminManage.dart';
import 'utils/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hu_al/utils/db.dart';


//this page will be named 'Admin_page' during Application integration

class AdminPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AdminPage();
  }
}
class _AdminPage extends State<AdminPage> {

    //we are supposed to get these from DB
    List<String> deps=['Communications','Mechanics','Electrical','Mechatronics'];
    String defDep='Communications';
    bool approvedBit=false;
    //List<Map> jobPosts=[{'jobTitle':'Security Analyst1','Jdesc':'you hack fools','Cname':'Kselim Sec Firm'},{'jobTitle':'Security Analyst2','Jdesc':'you hack fools','Cname':'Kselim Sec Firm'},{'jobTitle':'Security Analyst3','Jdesc':'you hack fools','Cname':'Kselim Sec Firm'}];
     List<Map> jobPosts;
   void _approve()
   {
     if(approvedBit == false)
       setState(() {
        approvedBit=true; 
       });

   }
   @override
  void initState() {
    print('JobManager Widget initState');
    if ( jobPosts == null) {
      fetch_jobs();
      //jobPosts2=jobPosts;
    }
    super.initState();
  }
   void  fetch_jobs()
  {
    Future<Database> dbfuture = DbHelper().initDB();
    dbfuture.then((database)
    {
     Future<List> fututelist= DbHelper().fetchJobs();
     fututelist.then((lists){
        setState(() {

          this.jobPosts=lists;
        });
     });
    }
    );
  }

  
  Widget build(BuildContext context) {
    //fetch_jobs();
    return MaterialApp(
      title: 'HU Alumini',
      home: Scaffold(
              endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  "Account",
                  textAlign: TextAlign.justify,
                  textScaleFactor: 2.0,
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text("Logout"),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Posted Jobs'),
        ),
        
        body:JobPosts(deps,defDep,jobPosts,_approve,approvedBit)//ExplorePage()//JobPosts(deps,defDep,jobPosts,_deleteApproved)//MyHomePage(),//ExplorePage(),//JobPosts(deps,defDep,jobPosts,_deleteApproved),
        //,addTestData(),
      ),
    );
  }
}
