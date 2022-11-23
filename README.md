# WEEKLY ASSIGNMENT 07


## What is meant by stateless widget and stateful widget
Stateless widget : A stateless widget is incapable of changing its state while a Flutter application is running. As a result, a stateless widget cannot be updated while the application is running.

Stateful widget : A stateful widget is used when some part of the UI must change dynamically during runtime. Stateful widgets can redraw themselves multiple times while the app is running.

## Mention what widgets you use in this project and explain their functions

```Material App:``` A widget that wraps a number of other widgets for the purposes of a Material Design application. <br>
```AppBar:```  used to house a search field, buttons to navigate between pages, or simply the title of the page.<br>
```Container:``` A widget that combines the general properties, position, and size of a widget. <br>
```Column:``` Layout a list of child widgets vertically. <br>
```Center:``` Widgets that center child widget elements within <br>
```FloatingActionButton:``` A circular button that triggers the primary action in your app's UI.<br>
```Text:``` To show a text.<br>
```Icon:``` Contains a collection of icon design materials.<br>
```Scaffold:``` To implement the basic Material Design visual layout structure.<br>

## What is the function of setState()? Explain what variables can be affected by the function.
Calling setState informs the framework that the internal state of this object has changed in a way that may have an impact on the user interface in this subtree, causing the framework to schedule a build for this State object.
<br>
If you simply change the state without calling setState, the framework may fail to schedule a build, and the user interface for this subtree may not be updated to reflect the new state.

## Explain the difference between const and final.
Final : The final keyword is used to hardcode the values of the variable and it cannot be altered in future, neither any kind of operations performed on these variables can alter its value (state).
<br>
Const :In Dart, the Const keyword behaves exactly like the final keyword. The only distinction between final and const is that const makes the variable constant only at compile time. When you use const on an object, the object's entire deep state is strictly fixed at compile-time, and the object is considered frozen and completely immutable.


## IMPLEMENTATION
### ```Step 1```
Make a new app called counter_7
```shell
flutter create counter_7
```

### ```Step 2```
Make a visibility function to show the button if it's not 0.
```shell
void _visible() {
    setState(() {
      if (_counter == 0) {
        _show = false;
      }
      if (_counter >= 1) {
        _show = true;
      }
    });
  }
```

### ```Step 3```
Make and Increment function.
```shell
  void _incrementCounter() {
    setState(() {
      _counter++;
      counterCheck(_counter);
      _visible();
    });
  }
```

### ```Step 4```
Make and decrement function.
```shell
 void _decrement() {
    setState(() {
      if (_counter == 0) {
        _counter = _counter;
        _visible();
      } else {
        _counter--;
        counterCheck(_counter);
        _visible();
      }
    });
  }

```

### ```Step 5```
Make a check of the counter,if it's odd it will show a text "odd" colored blue and if it's even it will show a text "even" colored red .
```shell
  void counterCheck(int counter) {
    if (counter % 2 == 0) {
      type = const Text('EVEN', style: TextStyle(color: Colors.red));
    } else {
      type = const Text('ODD', style: TextStyle(color: Colors.blue));
    }
  }
```
### ```Step 6``` 
Widget for the floating action button and the text.
```shell
  ...
   mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            type,
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Visibility(
              visible: _show,
              child: FloatingActionButton(
                  onPressed: _decrement,
                  child: const Icon(Icons.remove)),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
              
          ...
```

# WEEKLY ASSIGNMENT 08

## Difference between Navigator.push and Navigator.pushReplacement

Navigator.push will push(same definition as the data structure) the route that was pushed. Meanwhile, Navigator.pushReplacement will replace the route navigator by pushing the new route and then discarding the previous route after the new route has finished loading.

## List all the widgets you used in this project and explain their functions
card:To form a card component like a container and loop for each data <br>
DropdownButtonr: A dropdown menu that contains input choices for users whose choices can be saved. <br>
TextFormField: Displays a field that can be filled by text and its contents are stored. <br>
ListTile: A component which can also be used as a widget<br>
TextButton: create a text based button. <br>
Padding,Column: It is used for positioning <br>

## Name the types of events that exist in Flutter (example: onPressed)
onPressed: Trigger events based on when a button is pressed. <br>
onSaved: trigger event based on when a form/field is executed .methods when a button/button is pressed.<br>
OnTap: trigger event based on when a form/field is executed .save method <br>
onHover:The code in this event will be executed when the pointer moves on a button (not clicked) <br>
onChanged: triggers an event based on a change in the value of a field. <br>

## Explain how the Navigator works in "switching" pages of a Flutter application.

Navigator is like a stack, When navitagor .push, the previous layer will be overwritten and still stored under the new layer, while .pushreplacement will replace the layer. When a .pop occurs, the top page will be removed and the app will show the new top page.

## IMPLEMENTING
1. Make a new drawer.dart file to route the modules inside the app
2. Put the function of build drawer inside main.dart
3. Make a new file called form.dart to make a form to be put in a list
4. Make a class for the budget form that contains the "attributes" of the form.
5. Make a validator to restrict certain inputs. 
7. Make a new file called budget.dart to show the content from form.dart with cards.

# WEEKLY ASSIGNMENT 09

## Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?
It should be possible, by converting the json data directly after being decoded from the url. But, it's rare to use this method, even from the Flutter documentation, it creates a models folder first. So in my opinion it is not better than making a model first because it is more difficult to read and inefficient.


## List the widgets that you used in this project and explain their functions.

- Drawer: To make a drawer in switching pages
- Container: contain widget widgets
- ListView: For grouping multiple items and can be scrolled in the view
- FutureBuilder: For creating widgets based on interaction with widgets and for fetching data

## Explain the mechanism of retrieving data from json so it can be shown in Flutter.
First, Add the http package with the flutter pub add http command and provide internet access to the project being created by adding a few lines of code to the file android/app/src/main/AndroidManifest.xml. Then,the json data is obtained by fetching the method in the fetchwatchlist.dart file. After that, the fetched data will be converted based on the code in my watchlist.dart on the model folder.

## IMPLEMENTATION
1. Make two new folders which are "model" and "page"
2. Move the budger.dart, drawer.dart, form.dart files into the folder page
3. Add a file on model containing the model from the converted json from watchlist.
4. Add fetchwatchlist.dart to fetch the data from the watchlist url.
5. Add My watchlist tile on the drawer.dart
6. Add mywatchlistpage.dart from the iteration on fetchwatchlist.dart
7. git add,commit,push.
