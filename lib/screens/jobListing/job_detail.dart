import 'package:flutter/material.dart';
import './detailCell.dart';

class JobDetailPage extends StatelessWidget {
  final job;
  JobDetailPage(this.job);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Detail"),
      ),
      body: Center(
        child: 
         DetailCell(job)
      ),
    );
  }
}