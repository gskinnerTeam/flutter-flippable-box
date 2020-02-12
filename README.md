# flippable_box

FlippableBox is a double-sided Container, that holds two pieces of content and automatically re-sizes to match its content, whenever it's flipped over. 

<img src='http://screens.gskinner.com/shawn/2020-02-07_01-22-54.gif' />

## Usage

First import the package into your class: 

```import 'package:flippable_box/flippable_box.dart';```

Create a FlippableBox with 2 child widgets. Change the `isFlipped` property to trigger the internal flip animation.

```
  GestureDetector(
    onTap: () => setState(() => _isFlipped = !_isFlipped),
    child: FlippableBox(
      bgDecoration: BoxDecoration(color: Colors.white),
      front: ChildWidget1(),
      back: ChildWidget2(),
      isFlipped: _isFlipped,
    ),
  )
```




