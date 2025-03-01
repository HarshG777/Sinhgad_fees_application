import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _currentStep = 0;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  // Define colors
  final Color primaryColor = Color(0xFF0056B3); // Deep Blue (Main Theme)
  final Color backgroundColor = Color(0xFFF1F6F9); // Background color
  final Color completedStepColor = Colors.green; // Color for completed steps

  // Controllers for each step
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactNoController = TextEditingController();
  final TextEditingController _adharNoController = TextEditingController();
  final TextEditingController _castCategoryController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();


  // Future signUPP() async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );

  //     // Add user data to firestore
  //     // await addUserData();


  //     AlertDialog alert = AlertDialog(
  //       title: Text("Success"),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text("User created successfully"),
  //           Lottie.asset('assets/lottie/success.json', height: 100,repeat: false),
  //         ],
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: Text("OK"),
  //         ),
  //       ],
  //     );
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return alert;
  //       },
  //     );
      
  //   } on FirebaseAuthException catch (e) {
  //     print('Failed with error code: ${e.code}');
  //     print(e.message);
  //     AlertDialog alert = AlertDialog(
  //       title: Text("Error"),
  //       content: Text(e.message.toString()),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: Text("OK"),
  //         ),
  //       ],
  //     );
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return alert;
  //       },
  //     );
  //   }

  
  // }

  Future signUP() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    String uid = userCredential.user!.uid;
    print('User registered with UID: $uid');


    await addUserData(uid); // ✅ Store by UID

    showSuccessDialog();
    
  } on FirebaseAuthException catch (e) {
    Dialog errorDialog = Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Error'),
            Text(e.message ?? 'An error occurred'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (context) => errorDialog);
  }
}

// Future addUserData() async {
//   try {
//     print('Checking Firestore connection...');
//     await FirebaseFirestore.instance.collection('test').limit(1).get();
//     print('Connected to Firestore!');

//     print('Adding user data to Firestore...');
//     DocumentReference ref = await FirebaseFirestore.instance.collection('users').add({
//       'new': false,
//       'email': "New",
//       'name': "New",
//       'address': "New",
//       'contactNo': "new",
//       'adharNo': "new",
//       'castCategory': "new",
//       'payment': "new",
//       'timestamp': FieldValue.serverTimestamp(), // Useful for ordering
//     });

//     print('Data successfully added! Document ID: ${ref.id}');
//   } catch (e) {
//     print('Error adding data to Firestore: $e');
//   }
// }




Future addUserData(String uid) async {
  print('Adding user data to Firestore...');

  await FirebaseFirestore.instance.collection('users').doc(uid).set({
    'email': _emailController.text.trim(),
    'name': _nameController.text.trim(),
    'address': _addressController.text.trim(),
    'contactNo': _contactNoController.text.trim(),
    'adharNo': _adharNoController.text.trim(),
    'castCategory': _castCategoryController.text.trim(),
    'payment': _paymentController.text.trim(),
    'createdAt': FieldValue.serverTimestamp(),
  });

  print('User data added successfully.');
}

void showSuccessDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Success"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("User created successfully"),
            Lottie.asset('assets/lottie/success.json', height: 100, repeat: false),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );

  Future.delayed(Duration(seconds: 2), () {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  });
}


  // Future addUserData() async {
  //   print('Adding user data to firestore');
  //   //Add user data to firestore
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'new': false,
  //     'email': _emailController.text.trim(),
  //     'name': _nameController.text.trim(),
  //     'address': _addressController.text.trim(),
  //     'contactNo': _contactNoController.text.trim(),
  //     'adharNo': _adharNoController.text.trim(),
  //     'castCategory': _castCategoryController.text.trim(),
  //     'payment': _paymentController.text.trim(),
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for Admission'),
        backgroundColor: primaryColor, // AppBar color
        foregroundColor: Colors.white,
      ),
      backgroundColor: backgroundColor, // Background color for the entire page
      body: Stepper(
        currentStep: _currentStep,
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Container(
            margin: EdgeInsets.only(top: 16),
            child: Row(
              children: [
                if (_currentStep != 0)
                  ElevatedButton(
                    onPressed: details.onStepCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor, // Button color
                      foregroundColor: Colors.white
                    ),
                    child: Text('Back'),
                  ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // Button color
                    foregroundColor: Colors.white,
                  ),
                  child: Text(_currentStep == 5 ? 'Finish' : 'Next'),
                ),
              ],
            ),
          );
        },
        onStepContinue: () {
          if (_formKeys[_currentStep].currentState!.validate()) {
            if (_currentStep < 5) {
              setState(() {
                _currentStep += 1;
              });
            }else{
              Navigator.pop(context);
            }
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: [
          _buildStep(
            title: 'Step 1: Primary Email and Password',
            formKey: _formKeys[0],
            isActive: _currentStep >= 0,
            isCompleted: _currentStep > 0,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
          ),
          _buildStep(
            title: 'Step 2: Personal Details',
            formKey: _formKeys[1],
            isActive: _currentStep >= 1,
            isCompleted: _currentStep > 1,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactNoController,
                decoration: InputDecoration(labelText: 'Contact No.'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _adharNoController,
                decoration: InputDecoration(labelText: 'Adhar Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Adhar number';
                  }
                  return null;
                },
              ),
            ],
          ),
          _buildStep(
            title: 'Step 3: Cast Category',
            formKey: _formKeys[2],
            isActive: _currentStep >= 2,
            isCompleted: _currentStep > 2,
            children: [
              TextFormField(
                controller: _castCategoryController,
                decoration: InputDecoration(labelText: 'Cast Category'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your cast category';
                  }
                  return null;
                },
              ),
            ],
          ),
          _buildStep(
            title: 'Step 4: Payment for Admission',
            formKey: _formKeys[3],
            isActive: _currentStep >= 3,
            isCompleted: _currentStep > 3,
            children: [
              TextFormField(
                controller: _paymentController,
                decoration: InputDecoration(labelText: 'Payment Details'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter payment details';
                  }
                  return null;
                },
              ),
            ],
          ),
          _buildStep(
            title: 'Step 5: Check User Creation',
            formKey: _formKeys[4],
            isActive: _currentStep >= 4,
            isCompleted: _currentStep > 4,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text('email : ${_emailController.text} \npassword : ${_passwordController.text}'),
                      SizedBox(height: 10),
                      ElevatedButton(onPressed: signUP, child: Text("Submit")),
                    ],
                  )
                ],
              )
            ],
          ),
          _buildStep(
            title: 'Step 6: Download Admission Form',
            formKey: _formKeys[5],
            isActive: _currentStep >= 5,
            isCompleted: _currentStep > 5,
            children: [
              Text('Download your admission form here.'),
              ElevatedButton(
                onPressed: () {
                  // Add download logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Button color
                  foregroundColor: Colors.white,
                ),
                child: Text('Download Form'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build a step
  Step _buildStep({
    required String title,
    required GlobalKey<FormState> formKey,
    required bool isActive,
    required bool isCompleted,
    required List<Widget> children,
  }) {
    return Step(
      title: Text(title),
      content: Form(
        key: formKey,
        child: Column(
          children: children,
        ),
      ),
      isActive: isActive,
      state: isCompleted ? StepState.complete : StepState.indexed,
    );
  }
}