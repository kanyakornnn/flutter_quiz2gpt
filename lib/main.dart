import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('สถานที่ท่องเที่ยว'),
        ),
        body: QuizScreen(),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // ข้อคำถามและเฉลย
  List<Map<String, dynamic>> questions = [
    {
      'questionText': 'สถานที่ท่องเที่ยว ภูกระดึง อยู่ภาคใด?',
      'answers': ['ภาคเหนือ', 'ภาคกลาง', 'ภาคใต้', 'ภาคอีสาน'],
      'correctAnswer': 'ภาคอีสาน',
    },
    {
      'questionText': 'ดินแดนแห่งทุ่งดอกกระเจียวงาม อยู่จังหวัดอะไร?',
      'answers': ['จังหวัดชัยภูมิ', 'จังหวัดอุดรธานี', 'จังหวัดอุบลราชธานี', 'จังหวัดบุรีรัมย์'],
      'correctAnswer': 'จังหวัดชัยภูมิ',
    },
    {
      'questionText': 'ภูชี้ฟ้าตั้งอยู่จังหวัดใด?',
      'answers': ['จังหวัดแม่ฮ่องสอน', 'จังหวัดตาก', 'จังหวัดเชียงราย', 'จังหวีดเชียงใหม่'],
      'correctAnswer': 'จังหวัดเชียงราย',
    },
    {
      'questionText': 'วัดภูมินทร์อยู่จังหวัดใด?',
      'answers': ['จังหวัดน่าน', 'จังหวัดแม่ฮ่องสอน', 'จังหวัดเชียงใหม่', 'จังหวัดเชียงราย'],
      'correctAnswer': 'จังหวัดน่าน',
    },
    {
      'questionText': 'ม่อนแจ่มอยู่จังหวัดอะไร?',
      'answers': ['ภูเก็ต', 'เชียงราย', 'เชียงใหม่', 'สมุทรปราการ'],
      'correctAnswer': 'เชียงใหม่',
    },
    {
      'questionText': 'สถานที่ใดตั้งอยู่ในภาคกลาง?',
      'answers': ['วัดพระแก้ว', 'พระธาตุพนม', 'อุทยานประวัติศาสตร์พิมาย', 'อุทยานแห่งชาติดอยอินทนนท์'],
      'correctAnswer': 'วัดพระแก้ว',
    },
    {
      'questionText': 'ภาพ กระซิบรักบันลือโลก อยู่ในจังหวัดใดในภาคเหนือ?',
      'answers': ['จังหวัดน่าน', 'จังหวัดลำปาง', 'จังหวัดแม่ฮ่องสอน', 'จังหวัดแพร่'],
      'correctAnswer': 'จังหวัดน่าน',
    },
    {
      'questionText': 'ดอยอินทนนท์ตั้งอยู่ภาคใด?',
      'answers': ['ภาคกลาง', 'ภาคอีสาน', 'ภาคเหนือ', 'ภาคใต้'],
      'correctAnswer': 'ภาคเหนือ',
    },
    {
      'questionText': 'อุทยานแห่งชาติเขาใหญ่ครอบคลุมกี่จังหวัด กี่อำเภอ',
      'answers': ['4จังหวัด 11อำเภอ', '4จังหวัด 2อำเภอ', '4จังหวัด 8อำเภอ', '4จังหวัด 7อำเภอ'],
      'correctAnswer': '4จังหวัด 11อำเภอ',
    },
    {
      'questionText': 'อุทยานแห่งชาติเขาใหญ่มีน้ำตกหรือไม่',
      'answers': ['มีแน่นอน', 'ไม่มี', 'คิดว่ามีไม่แน่ใจ', 'คิดว่าไม่มี'],
      'correctAnswer': 'มีแน่นอน',
    },
  ];

  int questionIndex = 0;
  int score = 0;

  void answerQuestion(String selectedAnswer) {
    String correctAnswer = questions[questionIndex]['correctAnswer'];
    if (selectedAnswer == correctAnswer) {
      setState(() {
        score++;
      });
    }
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return questionIndex < questions.length
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                questions[questionIndex]['questionText'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
                return ElevatedButton(
                  onPressed: () => answerQuestion(answer),
                  child: Text(answer),
                );
              }).toList(),
            ],
          )
        : Center(
            child: Text(
              'คุณได้คะแนน $score จาก ${questions.length}',
              style: TextStyle(fontSize: 24),
            ),
          );
  }
}