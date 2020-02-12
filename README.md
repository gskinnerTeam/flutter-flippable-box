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

NOTE: It is required that the children are Containers, and have their size or constraints set manually. This is so the Box knows what it's target size is when animating.

Optionally you can provide a BoxDecoration to be used for the background, and a borderRadius to be used for masking / clipping of the contents:
```
FlippableBox(
    front: child1,
    back: child2,
    borderRadius: 32,
    bg: BoxDecoration(color: Colors.white)
    isFlipped: _isFlipped,
)
```


