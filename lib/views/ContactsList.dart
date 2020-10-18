import 'package:covidtracer/models/Contacts.dart';
import 'package:covidtracer/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Contacts> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Contacts>();
      updateListView();
    }

    return Scaffold(
      body: getNoteListView(),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
      
            title: Text('${this.noteList[position].bluetooth}',style: titleStyle,),
            subtitle: Text('${this.noteList[position].date}'),

            trailing: GestureDetector(
            	child: Icon(Icons.delete, color: Colors.grey,),
            	onTap: () {
            		_delete(context, noteList[position]);
            	},
            ),

            // onTap: () {
            // 	debugPrint("ListTile Tapped");
            // 	navigateToDetail(this.noteList[position],'Edit Note');
            // },
          ),
        );
      },
    );
  }

  void _delete(BuildContext context, Contacts note) async {

  	int result = await databaseHelper.deleteNote(note.id);
  	if (result != 0) {
  		_showSnackBar(context, 'User has been Deleted!');
  		updateListView();
  	}
  }

  void _showSnackBar(BuildContext context, String message) {

  	final snackBar = SnackBar(content: Text(message));
  	Scaffold.of(context).showSnackBar(snackBar);
  }
  

  // void navigateToDetail(Note note, String title) async {
  //   bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
  // 	  return NoteDetail(note, title);
  //   }));

  //   if (result == true) {
  //   	updateListView();
  //   }
  // }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Contacts>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
