import 'package:flutter/material.dart';

import '../data/data.dart';

class MealDetailsScreen extends StatelessWidget {
  // Routes
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final selectedMeal =
        MEALS.firstWhere((meal) => meal.id == routeArguments['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 300,
                width: double.infinity,
                // Image schön anpassen
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover)),
            // Theme Title Style nutzen (Definiert in der Main)
            Container(
              // Bisschen Spacing zwischen dem Bild und dem Text
              // symmertric(vertical: x) nur oben und unten!
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Zutaten',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Hier kann nicht einfach eine ListView() angewendet werden
            // ListView nimmt "unendlich" höhe und darüber nimmt auch Column unendlich höhe
            // ==> Deswegen muss ein Container dazwischengeschalten werden
            // Media Query kann angewendet werden, um hier die höhen dynamisch anzupassen!
            // Jedoch frisst das viel Zeit !
            Container(
              // Da die ListView unten bei zu vielen Elementen scrollbar wird
              // ==> decorations einfügen um dies deutlich zu zeigen
              // Borders in alle Richtungen
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              // Margin und Padding um die "Textbox"
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 400,
              child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) => Card(
                        color: Theme.of(context).primaryColorDark,
                        // Padding um den Text selbst
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.ingredients[index])),
                      )),
            ),
            // BONUSAUFGABE
            // CODE DUPLICATION => GEHT AUCH ÜBER DAS AUSLAGERN IN EINE METHODE
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Schritte',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Hier kann nicht einfach eine ListView() angewendet werden
            // ListView nimmt "unendlich" höhe und darüber nimmt auch Column unendlich höhe
            // ==> Deswegen muss ein Container dazwischengeschalten werden
            // Media Query kann angewendet werden, um hier die höhen dynamisch anzupassen!
            // Jedoch frisst das viel Zeit !
            Container(
              // Da die ListView unten bei zu vielen Elementen scrollbar wird
              // ==> decorations einfügen um dies deutlich zu zeigen
              // Borders in alle Richtungen
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              // Margin und Padding um die "Textbox"
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 400,
              child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) => Card(
                        color: Theme.of(context).primaryColorDark,
                        // Padding um den Text selbst
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.steps[index])),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
