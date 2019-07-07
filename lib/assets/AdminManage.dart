import 'package:flutter/material.dart';
import 'departments_dropdown.dart';
import '../utils/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hu_al/utils/db.dart';

class JobPosts extends StatefulWidget{
  final List<String> deps;
  String defdep;
  final List<Map> jobPosts;
  bool approvedBit;
  final Function approve;
  JobPosts(this.deps,this.defdep,this.jobPosts,this.approve,this.approvedBit);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JobPost(deps,defdep,jobPosts,approve,approvedBit);
  }
}

class JobPost extends State<JobPosts> {
  final List<String> deps;
  String defdep;
  String upval;
  bool approvedBit;
  bool bit=false;
  //List<Map> _jobs;
   List<Map> jobPosts;
    static List<Map> jobPosts2;
  final Function approve;
  JobPost(this.deps,this.defdep,this.jobPosts,this.approve,this.approvedBit);

//we are supposed to get this MAP from DB
void chooseSelected(newSelected)
{
   setState(() {
               defdep=newSelected;
              
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
void _isApproved()
   {
     if(bit  ==false )
     {
       setState(() {
        bit=true;
       });
     }

   }
   void approve_job( int jobBID) async
   {

    DbHelper k=DbHelper();
     int savedItemId = await k.approveJob(jobBID);
   }
 void  fetch_jobs()
  {
    Future<Database> dbfuture = DbHelper().initDB();
    dbfuture.then((database)
    {
     Future<List> fututelist= DbHelper().fetchALLJobs();
     fututelist.then((lists){
        setState(() {

          jobPosts=lists;
          
        });
     });
    }
    );
  }
Widget jobPostWidget() {
  //fetch_jobs();
  print('here are the contents of JOPPOSTS $jobPosts');
    if (jobPosts != null && jobPosts.length !=0) {
      return ListView.builder(
        itemBuilder:
            jobBuildItem, //iam not executing memeBuildItem , this is just a refernce
        itemCount: jobPosts.length,
      );
    } else {
     // fetch_jobs();
      return Center(
        child: Text('No new job posts'),
      );
    }
  }

  Widget jobBuildItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          AppBar(
            // backgroundColor: Colors.yellow,
            title: Text('Company Name'),
            
          ),
          Text(jobPosts[index]['jobTitle']),
          Text(jobPosts[index]['jobType']),
          Text(jobPosts[index]['jobDescription']
          
          ),
          ButtonBar(
            
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              //Departments(deps,defdep,chooseSelected), //DropDown List
              FlatButton(
                color:  bit  ? Colors.grey : Colors.black,// Colors.black,
                textColor: Colors.white,
                child: Text('Approve'),
                onPressed: () {
                //print(bit);
                _isApproved();
                approve_job(jobPosts[index]['jobID']);
                  },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   //DbHelper k=  DbHelper();
    //print(jobPosts.length);
    //print(jobPosts);
    //k.addJob();
    //k.fetchJobs();
    //addTestData():
    //addTestData();
    //print(upval);
    return jobPostWidget();
  }
}