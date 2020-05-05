import 'package:flutter/material.dart';
import 'package:myconfinement/core/api_service.dart';
import 'package:myconfinement/core/model/category.dart';
import 'package:myconfinement/core/model/todo_item.dart';

class AddTodoView extends StatefulWidget {
  @override
  _AddTodoViewState createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  GlobalKey<FormState> formKey = GlobalKey(debugLabel: "formKEy");
  List<Category> _category = Category.getCategory();
  List<DropdownMenuItem<Category>> _dropdownMenuItems;
  Category _selectedCategory;
  @override
  void initState() {
  _dropdownMenuItems = buildDropDownMenuItems(_category);
  _selectedCategory = _dropdownMenuItems[0].value;
  super.initState();
  }
  List<DropdownMenuItem<Category>> buildDropDownMenuItems(List category){
    List<DropdownMenuItem<Category>> items = List();
    for(Category category in category) {
      items.add(DropdownMenuItem(value: category,child: Text(category.name),));
    }
    return items;

  }

   void onChangeDropdownItems(Category value) {
     setState(() {
       _selectedCategory = value;
     });
  }

  TextEditingController controllerName = TextEditingController();
  
  String validator(val) {
    if (val.isEmpty) {
      return "empty area";
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Form(
       autovalidate: true,
       key: formKey,
       child: Center(
        child:Padding(padding: const EdgeInsets.all(10.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            TextFormField(
              controller: controllerName ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Todo Name"
              ),
              validator: this.validator,
            ),
            DropdownButton(
              value: _selectedCategory,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItems,
            ),

            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text('Add Todo'),
              onPressed: ()async {
                var model = TodoItem(
                  todotitle: controllerName.text,
                  subtitle: _selectedCategory.name,
                );
                 
                await ApiService.getInstance().addTodo(model);
                Navigator.pop(context);
              },
              shape: StadiumBorder(),
            )
          ],
         ),
        ),
      ),
    ),
  );
}
}