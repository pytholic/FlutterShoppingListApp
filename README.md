# Overview
A cross-platform **Todo List App** created using `Dart` and `Flutter`.

# App Functionality
* Add item and amount
* Increase or decrease the amount using buttons
* Delete the item
* Firebase integration

# Dev Notes
## Increment Function with Buttons
Function definition:
```dart
void incrementAmount(BuildContext context, Item item) {
  final provider = Provider.of<ItemsProvider>(context, listen: false);
  item.amount++;
  provider.updateItem(item, item.name, item.amount);
}
```

In `ElevatedButton`, following line didn't work for above function.
```dart
onPressed: incrementAmount,
```

However, replacing it with the following line of code workked.
```dart
onPressed: () {
  incrementAmount(context, item);
  },
```
