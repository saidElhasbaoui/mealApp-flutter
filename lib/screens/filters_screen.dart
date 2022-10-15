import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Function saveFilters;
  final Map<String , bool> currentFilters;

  const FiltersScreen(this.saveFilters,this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegan = false;
  bool vegetarian = false;

  @override
  initState(){
    glutenFree = widget.currentFilters['gluten'];
    lactoseFree = widget.currentFilters['lactose'];
    vegan = widget.currentFilters['vegan'];
    vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
                final selectedFilters = {
                  'gluten' : glutenFree,
                  'lactose' : lactoseFree,
                  'vegan'  : vegan,
                  'vegetarian' : vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust our meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  glutenFree,
                  (newValue){
                   setState(() {
                     glutenFree= newValue;
                   });
                  }
              ),
              buildSwitchListTile(
                  'Lactose-free',
                  'Only include Lactose-free meals',
                  lactoseFree,
                      (newValue){
                    setState(() {
                      lactoseFree= newValue;
                    });
                  }
              ),
              buildSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  vegetarian,
                      (newValue){
                    setState(() {
                      vegetarian= newValue;
                    });
                  }
              ),
              buildSwitchListTile(
                  'Vagan',
                  'Only include Vagan meals',
                  vegan,
                      (newValue){
                    setState(() {
                      vegan= newValue;
                    });
                  }
              )
            ],
          ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
