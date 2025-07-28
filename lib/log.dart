import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform the login operation      // You can replace the print statements with your own logic      print('Logging in with email: $_email');
      print('Logging in with password: $_password');

    }
  }


  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _email = value!;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _password = value!;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccountPage(),
                      ),
                    );
                  },
                  child: Text('Create Account'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: Text('Forgot Password'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    '© 2023 eyob. All Rights Reserved.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateAccountPage extends StatefulWidget {
  @override  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _image;

  final picker = ImagePicker();
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _fname='';
  String _lname='';
  String _address='';
  String _accountType = '';
  String _gender = '';
  String _phone='';
  File ? imagepath;
  String? imagename;
  String? imagedata;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _fnamecontroller=TextEditingController();
  final TextEditingController _lnamecontroller=TextEditingController();
  final TextEditingController _addresscontroller=TextEditingController();
  final TextEditingController _emailcontroller=TextEditingController();

  ImagePicker imagePicker=new ImagePicker();
  Future<void> getImage() async{
    var getimage= await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagepath=File(getimage!.path);
      imagename=getimage.path.split('/').last;
      imagedata=base64Encode(imagepath!.readAsBytesSync());
      print(imagepath);
      print(imagename);
      print(imagedata);

    });

  }
  Future<void> getImageFromCamera() async{
    var getimage= await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imagepath=File(getimage!.path);
      imagename=getimage.path.split('/').last;
      imagedata=base64Encode(imagepath!.readAsBytesSync());
      print(imagepath);
      print(imagename);
      print(imagedata);
    });

  }

  Ason, [9/3/2023 9:12 PM]
/* Future getImageFromCamera() async {  final pickedFile = await picker.pickImage(source: ImageSource.camera);  setState(() {    if (pickedFile != null) {      _image = File(pickedFile.path);    } else {      print('No image selected.');    }  });}Future getImageFromGallery() async {  final pickedFile = await picker.pickImage(source: ImageSource.gallery);  setState(() {    if (pickedFile != null) {      _image = File(pickedFile.path);    } else {      print('No image selected.');    }  });}void _createAccount() {  if (_formKey.currentState!.validate()) {    if (_passwordController.text != _confirmPasswordController.text) {      // Display error dialog for password mismatch      showDialog(        context: context,        builder: (BuildContext context) {          return AlertDialog(            title: Text('Error'),            content: Text('Password and confirm password do not match.'),            actions: [              TextButton(                child: Text('OK'),                onPressed: () {                  Navigator.of(context).pop();                },              ),            ],          );        },      );    } else if (_image == null) {      // Display error dialog for missing photograph      showDialog(        context: context,        builder: (BuildContext context) {          return AlertDialog(            title: Text('Error'),            content: Text('Please upload a photograph.'),            actions: [              TextButton(                child: Text('OK'),                onPressed: () {                  Navigator.of(context).pop();                },              ),            ],          );        },      );    } else {      // Perform the account creation operation      // ...      // Display the "Register Successfully" message      showDialog(        context: context,        builder: (BuildContext context) {          return AlertDialog(            title: Text('Success 👌'),            content: Text('Account created successfully!👌'),            actions: [              TextButton(                child: Text('OK'),                onPressed: () {                  Navigator.of(context).pop();                  // Navigate to the login page                  Navigator.push(                    context,                    MaterialPageRoute(builder: (context) => LoginPage()),                  );                },              ),            ],          );        },      );    }  }}*/

  Ason, [9/3/2023 9:12 PM]
  Future<void> insertrecord()async {

    if(_fname!=""_lname==""_email!=""_password!=""_accountType!=""||_address!=""){
      try{
        String uri="http://192.168.56.1/rename/register.php";
        var res=await http.post(Uri.parse(uri),body: {
          "fname":_fnamecontroller.text,
          "lname":_lnamecontroller.text,
          "email":_emailcontroller.text,
          "address":_addresscontroller.text,
          "account":_accountType,
          "password":_passwordController.text,
          "name":imagename,
          "data":imagedata,
          "gender":_gender,
          "phone":_phone,

        });
        var response=jsonDecode(res.body);
        if(response["success"]=="true"){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Success 👌'),
                content: Text('Account created successfully!👌'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigate to the login page                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              );
            },
          );
        }

        else{
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('please fill all the fields'),
                content: Text('Account not created'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigate to the login page                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateAccountPage()),
                      );
                    },
                  ),
                ],
              );
            },
          );
        }
      }
      catch(e){
        print(e);
      }
    }
    else{
      print("please fill all the filleds");
    }



  }

  Ason, [9/3/2023 9:12 PM]
  @overrideWidget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                if (imagepath!= null) ClipOval(
                  child: Image.file(
                    imagepath!,
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ) else Text("Image not choosen yet"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: getImageFromCamera,
                      child: Text('Capture Photo'),
                    ),
                    ElevatedButton(
                      onPressed: getImage,
                      child: Text('Choose from Gallery'),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _fnamecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(labelText: 'First Name',border: OutlineInputBorder()),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _fname = value!;
                  },
                ),
                SizedBox(width: 5),
                TextFormField(
                  controller: _lnamecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(labelText: 'Last Name',border: OutlineInputBorder(),hoverColor: Colors.black),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _lname = value!;
                  },
                ),

                Ason, [9/3/2023 9:12 PM]
                SizedBox(width: 5),
                TextFormField(
                  controller: _addresscontroller,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(labelText: 'Address',border: OutlineInputBorder()),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _address = value!;
                  },
                ),
                SizedBox(width: 5),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'phone number',border: OutlineInputBorder()),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _phone = value!;
                  },
                ),
                SizedBox(width: 5),
                TextFormField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email',border: OutlineInputBorder()),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _email = value!;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password',border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(width: 5),

                Ason, [9/3/2023 9:12 PM]
                TextFormField(
                  obscureText: true,
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password',border: OutlineInputBorder()),

                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Password and confirm password do not match.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPassword = value!;
                  },
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Account Type:'),
                    Radio(
                      value: 'employee',
                      groupValue: _accountType,
                      onChanged: (String? value) {
                        setState(() {
                          _accountType = value!;
                        });
                      },
                    ),
                    Text('Employee'),
                    Radio(
                      value: 'employer',
                      groupValue: _accountType,
                      onChanged: (String? value) {
                        setState(() {
                          _accountType = value!;
                        });
                      },

                    ),
                    Text('Employer'),
                  ],
                ),
                Row(
                  children: [
                    Text('Gender:'),
                    Radio(
                      value: 'male',
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() {
                          _gender = value!;
                        });
                      },

                    ),
                    Text('Male'),
                    Radio(

                      value: 'female',
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),
                ElevatedButton(
                  onPressed:(){ insertrecord();},
                  child: Text('Create Account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}