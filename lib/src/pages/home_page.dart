import 'package:flutter/material.dart';

import 'package:formvalidation/config/palette.dart';
import 'package:formvalidation/widgets/create_post_container.dart';
import 'package:formvalidation/widgets/rooms.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:formvalidation/widgets/circle_button.dart';

class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      body: CustomScrollView(
        //Parte de arriba
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'Reco',
              style: const TextStyle(
                color: Palette.colorBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print('Buscar'),
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () => print('Messenger'),
              ),
            ],
          ),
          //Container para publicar
          SliverToBoxAdapter(
            child: CreatePostContainer(),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(),
            ),
          ),
        ],
      ),
      //body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) => _crearItem(context, productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto) {
    return ListTile(
      title: Text('${producto.titulo} - ${producto.valor}'),
      subtitle: Text(producto.id),
      onTap: () => Navigator.pushNamed(context, 'producto'),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.indigo.shade900,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }
}
