import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../job_details.dart';
import '../models/job.dart';

//This class builds a list of job cards and return it back to the (JobManager)
class JobCard extends StatelessWidget {
  List jobs;
  launchURL(String URL) async {
    var url = URL; //jobs[jindex]['URL'];
    if (await canLaunch(url)) {
      await launch(url);
      print('The URL is launched');
    } else {
      throw 'Could not launch $url, check your internet connection';
    }
  }

  JobCard(this.jobs) {
    //this.jobs=[{'jobID': 1, 'jobTitle': 'secanalyst', 'yearOfGraduation': 4, 'salary': 5, 'department': 'test', 'URL': 'https://wuzzuf.net/jobs/p/194485', 'jobDescription': 'test'}];
  }

  Widget _buildJobItem(BuildContext context, int index) {
    //print(jobs);
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[


          new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      jobs[index]['jobTitle'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: new Text(
                      "Jop Type: " + jobs[index]['jobType'],
                      style: TextStyle(
                        //fontWeight: FontWeight,
                        color: Colors.redAccent,
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: new Text(
                      "Jop Location: " + jobs[index]['jopLocation'],
                      style: TextStyle(
                        //fontWeight: FontWeight,
                        color: Colors.redAccent,
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: new Text(
                      "Jop Department: " + jobs[index]['jopDepartment'],
                      style: TextStyle(
                        //fontWeight: FontWeight,
                        color: Colors.redAccent,
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
                        new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: new Text(
                      "Years Of Experiance: " + jobs[index]['yearsOfExperiance'].toString(),
                      style: TextStyle(
                        //fontWeight: FontWeight,
                        color: Colors.redAccent,
                        fontSize: 19.0,
                      ),
                    ),
                    
                  ),
                  
                ),
              ],
            ),




          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Apply'),
                onPressed: () {
                  launchURL(jobs[index]['jobURL']);
                },
              ),
              RaisedButton(
                child: Text('Details'),
                onPressed: () {
                  Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              JobDetails(jobs[index], launchURL: launchURL)));
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildJobList(BuildContext context) {
    print(jobs);
    Widget myJobCards = Center(child: Text('No Jobs Available Yet'));
    if (jobs.length > 0) {
      myJobCards = ListView.builder(
          itemBuilder: _buildJobItem, itemCount: jobs.length, reverse: false);
    }

    return myJobCards;
  }

  @override
  Widget build(BuildContext context) {
    print('product widget builder');
    // TODO: implement build
    return _buildJobList(context);
  }
}

