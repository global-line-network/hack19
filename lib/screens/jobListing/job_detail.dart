import 'package:flutter/material.dart';
import 'package:hack19/styles/style.dart';

import './detailCell.dart';

class JobDetailPage extends StatelessWidget {
  final job;
  JobDetailPage(this.job);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          job.name,
          style: appBarTitleStyle,
        ),
        backgroundColor: accentColor,
      ),
      body: Center(child: DetailCell(job)),
    );
  }
}
