import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Tts extends StatefulWidget {
  const Tts({super.key});

  @override
  State<Tts> createState() => _TtsState();
}

class _TtsState extends State<Tts> {
  @override
  void initState() {
    super.initState();
    initTts();
  }

  void initTts() async {
    FlutterTts flutterTts = FlutterTts();

    flutterTts.getVoices.then(
      (value) {
        try {
          List<Map> voices = List<Map>.from(value);

          print(
            voices
                .where(
                  (element) => element["name"].toString().contains("gu-IN"),
                )
                .toList(),
          );
        } catch (e) {
          print(e);
        }
      },
    );
    // await flutterTts.setLanguage("gu-IN");
    // await flutterTts.setSpeechRate(0.5);
    // await flutterTts.setPitch(1.0);

    // await flutterTts.speak(
    //     "અમદાવાદના બિસ્માર રોડ-રસ્તા, પાર્કિંગ-ટ્રાફિક અને રખડતા ઢોરના મુદ્દે થયેલી કન્ટેમ્પ્ટ ઓફ કોર્ટની પિટિશન ઉપર આજે વધુ સુનાવણી હાથ ધરવામાં આવી છે. અરજદારે અમદાવાદ મ્યુનિસિપલ કમિશનરની જગ્યાએ ડેપ્યુટી કમિશનરે એફિડેવિટ ફાઇલ કરતા વાંધો લીધો હતો. હાઇકોર્ટે એડવોકેટ જનરલ પર કટાક્ષ કર્યો કે, પાછલા કેટલાક વર્ષોથી આ અરજી ચાલી રહી છે, હજી કેટલી ચલાવવાની છે. કોર્ટે જણાવ્યું હતું કે,​ એકબીજા સરકારી કર્મચારી અને અધિકારીઓની રોકાણની ગાડીઓ કે રિક્ષાઓ સાચવવા પાસવર્ડ વપરાય છે કે 'કાલા કુત્તા' એટલે સાહેબની ગાડી નહીં પકડવાની. ઓફિસરો કેટલા ફીટ પટ્ટા હવે બાંધે છે તે જોવાનું છે. આ અંગે વધુ સુનાવણી 28 ઓગસ્ટે હાથ ધરવામાં આવશે");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("data"),
          ],
        ),
      ),
    );
  }
}
