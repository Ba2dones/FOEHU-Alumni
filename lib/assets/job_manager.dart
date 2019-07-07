import 'package:flutter/material.dart';
import '../utils/db.dart';
import './job_card.dart';
import '../models/job.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hu_al/utils/db.dart';



class JobManager extends StatefulWidget {
  final Job startingJob;
   //List jobs=[];
  JobManager({this.startingJob}) {
    print('JobManager Widget Constructor');
  }
 
  @override
  State<StatefulWidget> createState() {
    print('JobManager Widget CreateState');
    return _JobManagerState();
  }
}

//This class creates the body which includes (A coloumn + Expanded)
// the coloumn is only used to give a good looking margin around our list of cards
// the expanded is where we call (JobCard) constructor to build the list of cards

/* This is the class that will retrieve data from database and call a function to transform
the list of maps into a list of job items and then pass this list of jobItems to the jobCard class
*/
class _JobManagerState extends State<JobManager> {
 List<Map> _jobs;

void  fetch_jobs()
  {
    Future<Database> dbfuture = DbHelper().initDB();
    dbfuture.then((database)
    {
     Future<List> fututelist= DbHelper().fetchJobs();
     fututelist.then((lists){
        setState(() {

          this._jobs=lists;
        });
     });
    }
    );
  }

 /*
  @override
  void initState() {
    print('JobManager Widget initState');
    if (widget.startingJob != null) {
      _jobs.add(widget.startingJob);
    }
    super.initState();
  }*/
/*
  @override
  void didUpdateWidget(JobManager oldWidget) {
    print('JobManager Widget didUpdateWidget');
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }*/
 /*
  void _addJob(Job job) {
    setState(() {
      _jobs.add(job);
      print('JobManager _addJob setState');
    });
  }*/

  @override
  Widget build(BuildContext context){
    print('JobManager Widget builder');
    
    print(_jobs);
    if (_jobs == null) {
      _jobs = List<Map>();
      fetch_jobs();
    }

    //print("this is final list ${_jobs}");
    return Column(children: [
      Container(
          margin: EdgeInsets.all(10.0)),
      Expanded(child: JobCard(_jobs))
    ]);
  }
}
