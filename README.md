# flippable_box

FlippableBox is a double-sided Container, that holds two pieces of content and automatically re-sizes to match its content, whenever it's flipped over. 

<img src="https://screens.gskinner.com/shawn/2020-02-07_01-22-54.gif" alt="" />

## Usage

First import the package into your class: 

```import 'package:flippable_box/flippable_box.dart';```

Create a FlippableBox with 2 child Containers. Change the `isFlipped` property to trigger the internal flip animation.

```
GestureDetector(
    onTap: () => setState(() => _isFlipped = !_isFlipped),
    child: FlippableBox(
        front: Container(width: 200, height: 200, color: Colors.white),
        back: Container(width: 300, height: 300, color: Colors.white),
        isFlipped: _isFlipped,
    ),
)
```

NOTE: It is required that the children are Containers, and have their size or constraints set manually, as shown in the example above. This is so the Box knows what it's target size is when animating.

To control the flip animation, you can set `duration`, `curve` and `flipVt` which will cause the flip to be in the vertical axis rather than horizontal. 

You can also specify a `bg` which takes a BoxDecoration, and a `borderRadius` in case you'd like to clip the child contents. 
```
FlippableBox(
    front: child1,
    back: child2,
    isFlipped: _isFlipped,
    borderRadius: 32, //Uses a ClipRRect to clip contents of child containers
    bg: BoxDecoration(color: Colors.white) //Paints the box itself with a shared background
    duration: 0.5 //half second duration
    flipVt: true //Flip vertically instead of horizontal
    curve: Curves.easeOut 
)
```

## Example
See the example directory for a simple example.