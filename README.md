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