import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class DriverVerification extends StatefulWidget {
  const DriverVerification({Key? key}) : super(key: key);

  @override
  State<DriverVerification> createState() => _DriverVerificationState();
}

class _DriverVerificationState extends State<DriverVerification> {
  final phoneTextEditingController = TextEditingController();
  List<String> documents = [];

  void _uploadDocument(String documentPath) {
    setState(() {
      documents.add(documentPath);
    });
  }

  void _removeDocument(String document) {
    setState(() {
      documents.remove(document);
    });
  }

  Future<void> _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        _uploadDocument(filePath);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Verification'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mobile Number:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // const TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Enter your mobile number',
              //   ),
              // ),
              IntlPhoneField(
                showCountryFlag: false,
                dropdownIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (text) => setState(() {
                  phoneTextEditingController.text = text.completeNumber;
                }),
              ),
              const SizedBox(height: 16),
              const Text(
                'Region of Licensing:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 10,),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your region of licensing',
                ),
              ),
              const SizedBox(height: 24),
              //const SizedBox(height: 24),
              const Text(
                'Upload Documents',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(

                onPressed: _openFileExplorer,
                child: const Text('Add Document',style: TextStyle(fontFamily: "Mukta"),),
              ),
              const SizedBox(height: 24),
              const Text(
                'Uploaded Documents:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (documents.isEmpty)
                const Text('No documents uploaded yet.')
              else
                Column(
                  children: documents
                      .map(
                        (document) => ListTile(
                      title: Text(document),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _removeDocument(document);
                        },
                      ),
                    ),
                  )
                      .toList(),
                ),
              const SizedBox(height: 24),
              const Text(
                'Documents needed:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('1) Driver\'s license'),
              const Text('2) Car registration documents'),
              const Text('3) Car pollution certificate'),
              const SizedBox(height: 100,),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    onPressed: () {
                      // Handle button press
                    },
                    child: const Text('Register',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Mukta"),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
