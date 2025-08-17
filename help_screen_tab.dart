import 'package:flutter/material.dart';

class HelpScreenTab extends StatelessWidget {
  const HelpScreenTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Text(
          'Välkommen till Elder Launcher Hjälp.\n\n'
          'Appen är enkel att sätta upp och använda. När man vill ändra på apparna som visas klickar man på pennan i högra hörnet. Sedan är den helt gratis de andra seniorapparna har betalversioner eller annonser.\n\n'
          'För att förstora texten i mobilen finns appen Big Font (change font size), som kan förstora i hela mobilen. För tangentbordet finns appen GBoard, som gör att tangentbordet förstoras vid tryck på fyra fyrkanter på det..\n\n'
          'En larmknapp att ringa 112 saknas jämfört med  BIG Launcher, men installera appen SOS Alarm 112 och lägg till den som på bilden. När man klickar på den knappen öppnas en karta var man befinner sig och en knapp att ringa 112.\n\n'
          'För att avinstallera den om den är vald som standard måste man gå till den tidigare t.ex App Launcher och välja den.',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
