import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Answer Verification',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Answer Verification'),
        ),
        body: AnswerVerification(),
      ),
    );
  }
}

class AnswerVerification extends StatefulWidget {
  @override
  _AnswerVerificationState createState() => _AnswerVerificationState();
}

class _AnswerVerificationState extends State<AnswerVerification> {
  final TextEditingController _controller = TextEditingController();
  String _message = '';
  final String _correctAnswer = 'flutter';

  void _verifyAnswer() {
    setState(() {
      if (_controller.text.toLowerCase() == _correctAnswer.toLowerCase()) {
        _message = 'Correct!';
      } else {
        _message = 'Incorrect, try again.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What is the name of this framework?',
            style: TextStyle(fontSize: 18.0),
          ),
          //Imagecontainer
          SizedBox(
            width: 300,
            height: 300,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
                elevation: 7,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Image.asset('assets/images/C.jpg',
                    fit: BoxFit.cover,
                    width: 300.0,
                    height: 400.0,
                    alignment: Alignment.center),
                  ),
                ),
            ),
          ),
          //Answer container
          SizedBox(height: 20.0),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your Answer',
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _verifyAnswer,
            child: Text('Submit'),
          ),
          SizedBox(height: 20.0),
          Text(
            _message,
            style: TextStyle(fontSize: 18.0, color: Colors.red),
          ),
        ],
      ),
    );
  }
}