import 'package:flutter/material.dart';
import 'assets/job_manager.dart';


// This class creates the explore page including (the Appbar at the top + The drawer on the right)
// It doesn't create the body by itself ... it calls the (JobManager) constructor to create the body for it
class ExplorePage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
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
        automaticallyImplyLeading: false,
        title: Text('Explore Jobs'),
      ),
      body: JobManager(),
    );
  }
}
