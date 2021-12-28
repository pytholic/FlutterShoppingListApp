## Two Floating Buttons
Use `Row` wrapper.
```dart
floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () => {},
            child: const Icon(Icons.add),
            heroTag: null,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () => {},
            child: const Icon(Icons.remove),
            heroTag: null,
          ),
        ],
      ),
```


## Stack
Use to place widgets on top of each other.

### Positioning items inside stack
Use Positioned(). Wrap items inside stack with Positioned and use combination of width, height, top, left, right and bottom.