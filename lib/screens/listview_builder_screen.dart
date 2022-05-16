import 'package:fl_complements/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  // creamos los idices de las imagenes que recibo
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // un controlador
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        // pregunto que cuando este cerca del final agregue 5 fotos nuevas
        if ((scrollController.position.pixels + 500) >=
            scrollController.position.maxScrollExtent) {
          fetchData();
        }
      },
    );
  }

//??
  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});

// Pregunta si esta hasta el final para ver si te mueve el listado para avisar que hay mas imagenes
// Video 99
    if ((scrollController.position.pixels + 100) <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(microseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

// agrega 5 imagenes nuevas
  void add5() {
    final lastIds = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastIds + e));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastIds = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastIds + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
    // me da el tamaño del dispositivo
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: () => onRefresh(),
              child: ListView.builder(
                // te deja subir o baja el listview como en iphone
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (context, index) => FadeInImage(
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  // Imagen que sale mientras se carga la imagen desde la web
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(
                    // llamo el listado con los indices
                    'https://picsum.photos/500/300?image=${imagesIds[index]}',
                  ),
                ),
              ),
            ),
            if (isLoading)
              // posiciona el stack donde quiera
              Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const _LoadingIcon(),
              )
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
