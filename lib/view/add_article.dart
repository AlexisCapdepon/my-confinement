
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myconfinement/core/api_service.dart';
import 'package:myconfinement/core/model/Choice.dart';

class AddArticle extends StatefulWidget {

  @override
  _AddArticle createState() => _AddArticle();
}

class _AddArticle extends State<AddArticle> {
  File imageFile;

_openGallery(BuildContext context) async{
  var imageFileLocal = await ImagePicker.pickImage(source: ImageSource.gallery);
setState(() {
  imageFile = imageFileLocal;
});
Navigator.of(context).pop();
}
_openCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = image;
    });
    print(imageFile);
    Navigator.of(context).pop();

  }

  Future<void> _showChoicePicturDialog(BuildContext context) {
    return showDialog(
      context:context,
      builder: (BuildContext context) {
        return AlertDialog(content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Gallery'),
                onTap: (){
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(12)),

              GestureDetector(
                child: Text('Camera'),
                onTap: (){
                  _openCamera(context);
                },
              ),

            ]
          ),
        ),
      );
      }
      );
  }
  GlobalKey<FormState> formKey = GlobalKey(debugLabel: "formKEy");
  @override
  void initState() {
  super.initState();
  }
  

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerarticle = TextEditingController();
  TextEditingController controllerLieux= TextEditingController();
  
  String validator(val) {
    if (val.isEmpty) {
      return "empty area";
    }
    return null;
  }
  Widget _decidePicture () {
    if (imageFile == null){
     return Text('No Image');
    } else {
     return Image.file(imageFile,width:200,height:200);
    }
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
           _decidePicture(),
            TextFormField(
              controller: controllerName ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Article Name"
              ),
              validator: this.validator,
            ),
            TextFormField(
              controller: controllerarticle ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Artcile information"
              ),
              validator: this.validator,
            ),
            TextFormField(
              controller: controllerLieux ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Localisation"
              ),
              validator: this.validator,
            ),
            RaisedButton.icon(
              icon: Icon(Icons.share),
              label: Text('choice picture'),
              onPressed: (){
               _showChoicePicturDialog(context);
              },
              shape: StadiumBorder(),
            ),
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text('Add Articles'),
              onPressed: ()async {
                var model = Choice(
                  title: controllerName.text,
                  date: DateTime.now().toString(),
                  description: controllerarticle.text,
                  lieu: controllerLieux.text,
                  imglink: imageFile.path
               );
                await ApiService.getInstance().addArticle(model);
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