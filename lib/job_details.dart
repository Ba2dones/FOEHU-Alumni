import 'package:flutter/material.dart';

class JobDetails extends StatelessWidget {
  final Map jobData;
  Function launchURL;

  JobDetails(this.jobData,{this.launchURL});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
            appBar: AppBar(
              title: Text(jobData['jobTitle']),
            ),
            body: ListView(
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
                        fontSize: 25.0,
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
                      jobData['jobTitle'],
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
                        fontSize: 25.0,
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
                      "Jop Type: " + jobData['jobType'],
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
                        fontSize: 15.0,
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
                      "Jop Location: " + jobData['jopLocation'],
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
                        fontSize: 15.0,
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
                      "Jop Department: " + jobData['jopDepartment'],
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
                        fontSize: 15.0,
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
                      "Years Of Experiance: " + jobData['yearsOfExperiance'].toString(),
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
                        fontSize: 15.0,
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
                      "Jop Description: " + jobData['jobDescription'],
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
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),


                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*
                    RaisedButton(
                      child: Text('Save'),
                      onPressed: () {},
                    ),
                    */
                    RaisedButton(
                        child: Text('Apply'),
                        onPressed: () { launchURL(jobData['jobURL']);
                          
                        }
                        )
                  ],
                )




              ],
            ))
        //)
        ;
  }
}
