import 'package:flutter/material.dart';
import 'main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName ='/filters';
final Function saveFilters;
final Map<String, bool> currentFilters;


 FiltersScreen( this.currentFilters,this.saveFilters) ;


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree= false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactosefree= false;

  @override
   initState() {
glutenFree= widget.currentFilters['gluten'];
lactosefree=widget.currentFilters['lactose'];
vegan=widget.currentFilters['vegan'];
vegetarian=widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget buildSwitchListTile(String title,
  String description,
  bool currentValue,
    Function updateValue,){
    return SwitchListTile(title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters') ,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),
            onPressed:() {
            final selectedFilters= {
              'gluten': glutenFree,
              'lactose': lactosefree,
              'vegan': vegan,
              'vegetarian': vegetarian,
            };
            widget.saveFilters(selectedFilters);}
            ,)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container (
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meal selection',
          style: Theme.of(context).textTheme.title,
        ),
        ),
      Expanded(
        child: ListView(
          children: <Widget>[
            buildSwitchListTile('Gluten free',
              'only include gluten-free meals',
              glutenFree,
          (newValue){
              setState(() {
                glutenFree=newValue;
              },
              );
          },
            ),

            buildSwitchListTile('Lactose free',
              'only include lactose-free meals',
              lactosefree,
                  (newValue){
                setState(() {
                  lactosefree=newValue;
                },
                );
              },
            ),
            buildSwitchListTile('Vegetarian Food',
              'only include vegetarian meals',
              vegetarian,
                  (newValue){
                setState(() {
                  vegetarian=newValue;
                },
                );
              },
            ),
            buildSwitchListTile('Vegan',
              'only include vegan meals',
              vegan,
                  (newValue){
                setState(() {
                  vegan=newValue;
                },
                );
              },
            ),
          ],
        ),
      )
      ],
    )

    );
  }
}
