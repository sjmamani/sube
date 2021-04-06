import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuButton {
  final Function onPressed;
  final IconData icon;

  MenuButton({@required this.onPressed, @required this.icon});
}

class Menu extends StatelessWidget {
  final bool mostrar;
  final backgroundColor;
  final activeColor;
  final inactiveColor;
  final List<MenuButton> items;
  Menu(
      {this.mostrar = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey,
      @required this.items});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
            return AnimatedOpacity(
              duration: Duration(milliseconds: 250),
              opacity: mostrar ? 1 : 0,
              child: _MenuButtonsBackground(child: _MenuItems(items)),
            );
          },
        ));
  }
}

class _MenuButtonsBackground extends StatelessWidget {
  final Widget child;
  const _MenuButtonsBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 360.0,
      height: 70.0,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<MenuButton> items;

  _MenuItems(this.items);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(items.length, (i) => _MenuItem(i, items[i])),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final int index;
  final MenuButton item;

  _MenuItem(this.index, this.item);
  @override
  Widget build(BuildContext context) {
    final menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
              index;
          item.onPressed();
        },
        child: Container(
            child: Icon(
          item.icon,
          size: 35,
          color: (menuModel._itemSeleccionado == index)
              ? menuModel._activeColor
              : menuModel._inactiveColor,
        )));
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;
  set backgroundColor(Color color) {
    this._backgroundColor = color;
  }

  Color get activeColor => this._activeColor;
  set activeColor(Color color) {
    this._activeColor = color;
  }

  Color get inactiveColor => this._inactiveColor;
  set inactiveColor(Color color) {
    this._inactiveColor = color;
  }
}
