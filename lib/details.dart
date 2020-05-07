import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winncar/model.dart';

import 'crudModel.dart';


class Details extends StatelessWidget {


  final Record details;

   Details({@required this.details});

  @override
  Widget build(BuildContext context) {
    final recordsProvider = Provider.of<CrudModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(details.name),
      ),
    );
  }
}