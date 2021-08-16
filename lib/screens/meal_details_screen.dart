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
        // Wichtig, damit die ganze Page Scrollbar wird
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  // Image schön anpassen
                  child:
                      Image.network(selectedMeal.imageUrl, fit: BoxFit.cover)),
              // Theme Title Style nutzen (Definiert in der Main)
              Text(
                'Zutaten',
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                height: 200,
                width: 400,
                child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).primaryColorDark,
                    // Padding um den Text selbst
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                ),
              ),
              Text(
                'Schritte',
                style: Theme.of(context).textTheme.headline6,
              ),
              // CONTAINER MIT DEFINIERTER HÖHE UND BREITE MÜSSEN HIER ANGEGEBEN WERDEN
              // DA LIST VIEW SICH AN DIESE ANPASST [OHNE GIBTS FEHLER]
              Container(
                height: 200,
                width: 400,
                child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).primaryColorDark,
                    // Padding um den Text selbst
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.steps[index])),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
