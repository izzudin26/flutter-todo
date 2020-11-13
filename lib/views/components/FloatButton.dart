import 'package:flutter/material.dart';
import 'package:todolist/Provider/TodoProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class FloatButton extends StatefulWidget {
  BuildContext providercontext;
  FloatButton({this.providercontext});
  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottom();
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xff374ABE), Color(0xff64B6FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }

  void showModalBottom() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) => modalbottom(context));
  }

  Widget modalbottom(BuildContext context) {
    final todoprovider = Provider.of<TodoProvider>(widget.providercontext);
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * .35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .2,
                height: 5,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                controller: TextEditingController(text: todoprovider.todoname),
                onChanged: (value) {
                  setState(() {
                    todoprovider.todoname = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: "Nama Pekerjaan",
                    fillColor: Color.fromRGBO(216, 215, 215, 180),
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                onTap: () {
                  showDatePicker(context);
                },
                controller: TextEditingController(text: todoprovider.duedate),
                decoration: InputDecoration(
                    labelText: "Batas Waktu",
                    fillColor: Color.fromRGBO(216, 215, 215, 180),
                    filled: true),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 30,
                width: double.infinity,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: FlatButton(
                        onPressed: () {
                          addTodo();
                        },
                        child: Text(
                          "Buat",
                          style: TextStyle(color: Colors.white),
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTodo() {
    Navigator.of(context).pop();
    final todoprovider =
        Provider.of<TodoProvider>(widget.providercontext, listen: false);
    if (todoprovider.todoname != null && todoprovider.duedate != null) {
      todoprovider.addTask();
      todoprovider.todoname = null;
      todoprovider.duedate = null;
      setState(() {});
      showSnackbar("Berhasil ditambahkan");
    } else {
      showSnackbar("Mohon Melengkapi data");
    }
  }

  void showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void showDatePicker(BuildContext context) {
    final todoprovider =
        Provider.of<TodoProvider>(widget.providercontext, listen: false);
    DatePicker.showDateTimePicker(context, locale: LocaleType.id,
        onConfirm: (value) {
      todoprovider.setDuedate(value.toString());
      setState(() {
        todoprovider.setDuedate(value.toString());
      });
    });
  }
}
