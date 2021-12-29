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

## Expanded
You should use Expanded only within a column, row or flex. Otherwise you get following exception.
```console
Another exception was thrown: Incorrect use of ParentDataWidget.
```

## To disable zoom out animation in text fields
Use FloatingLabelBehavior.never inside InputDecoration will help you hiding your label and instead of 
labelText you can use hintText so it becomes disappear when you type something.
```
TextFormField(
    decoration: InputDecoration(
        hintText: "Search",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: InputBorder.none,
        suffixIcon: Icon(
            Icons.search,
        ),
    ),
),
```

## only digits in input:
```
TextFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
```