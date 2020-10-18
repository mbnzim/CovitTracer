import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  Dialog dialog = new Dialog();
  @override
  Widget build(BuildContext context) {
    final titles = [
      '1. What is COVID-19?',
      '2. How is it transmitted?',
      '3. What are the symptoms of COVID-19?',
      '4. When does COVID-19 symptoms start to show?',
      '5. How can you prevent infection?',
      '6. I have flu like symptoms, should i get tested?',
      '7. What happen if I test positive?',
      '8. Who is most at risk?',
      '9. How is it treated?',
      '10. What is self isolation?',
      '11. Which number to call for help?'
    ];

    final descriptions = [
      'Human Coronaviruses are common throughout the world. There are many different coronaviruses identified in animals but only a small number of these can cause disease in humans.',
      'The spread of the disease is thought to happen mainly via respiratory droplets produced when an infected person coughs or sneezes, similar to how influenza'
      'and other respiratory pathogens spread. Thus far, the majority of cases have occurred in people with close physical contact to cases and healthcare workers caring for patients with COVID-19.',
      'The most common symptoms are:\n1. Cough\n2. Fever\n3. Sore throat\n4. Shortness of breath\n5. Tiredness',
      'On average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days',
      '1.Wash your hands often with soap and water for at least 20 seconds or use an alcohol-based hand sanitiser. \n2.Avoid touching your eyes, nose, and mouth with unwashed hands.\n '
      '3.Avoid close contact with people who are sick.\n4.Stay at home when you are sick and try and keep a distance from others at home.\n'
      '5.Cover your cough or sneeze with a flexed elbow or a tissue, then throw the tissue in the bin.\n6.Clean and disinfect frequently touched objects and surfaces.',
      'The symptoms of COVID-19 include cough, sore throat, shortness of breath or fever. However, these are also symptoms of the flu. The National'
      'Institute of Communicable Diseases (NICD) recommends that you should only get tested if you display symptoms plus:\n'
      '1.Been in contact with a confirmed COVID-19 person.\n'
      '2.Travelled to a high risk country.\n'
      '3.Worked in or been to a healthcare facility treating people with Covid-19.\n'
      '4.Have a severe case of pneumonia with an unknown cause.',
      'Anyone who tests positive will immediately be notified and put into quarantine at home or at a facility designated to manage the outbreak. You will then remain in quarantine until repeat testing shows you no longer have the virus.',
      'Currently, travellers to areas where there is ongoing sustained transmission of COVID-19 including Mainland China (all provinces), Hong Kong, Japan, Republic'
      ' of Korea, Singapore, Vietnam, Taiwan, Italy and the Islamic Republic of Iran are at greatest risk of infection.'
      'Furthermore, the elderly, individuals with co-morbidities and healthcare workers have been found to be at a higher risk of death.',
      'Treatment is supportive (providing oxygen for patients with shortness of breath or treating a fever, for example). To date, there is no specific antiviral treatment'
      ' available. Antibiotics do not treat viral infections. However, antibiotics may be required if a bacterial secondary infection develops.',
      'Self-isolation is a way to keep yourself from possibly infecting others if you think you might be infected. It involves limiting contact with public places, relatives, friends, colleagues, and public transport.',
      'Emergency Hotline:\n 0800 029 999\n\n'
      'Whatsapp Supupport Line:\n 0600 123 456'
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(titles[index]),
                onTap: () => dialog.information(context, titles[index], descriptions[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

//ListView dialog
class Dialog {
  information(BuildContext context, String title, String description) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(description)],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
