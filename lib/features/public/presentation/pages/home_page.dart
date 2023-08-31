import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.amber,
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 130),
                      children: const [
                        CategoryCardListTileWidget(),
                        CategoryCardListTileWidget(),
                        CategoryCardListTileWidget(),
                        CategoryCardListTileWidget(),
                        CategoryCardListTileWidget(),
                        CategoryCardListTileWidget(),
                        CategoryCardListTileWidget(),
                        CategoryCardListTileWidget(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          'LISTAGEM DE PRODUTOS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 1.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.only(bottom: 130),
                          children: const [
                            ProductCardListTileWidget(),
                            ProductCardListTileWidget(),
                            ProductCardListTileWidget(),
                            ProductCardListTileWidget(),
                            ProductCardListTileWidget(),
                            ProductCardListTileWidget(),
                            ProductCardListTileWidget(),
                            ProductCardListTileWidget(),
                            ProductCardListTileWidget(),
                            ProductCardListTileWidget(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'CANCELAR PEDIDO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 1.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'CONFERIR PEDIDO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 1.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryCardListTileWidget extends StatelessWidget {
  const CategoryCardListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.only(bottom: 20),
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        image: const DecorationImage(
          image: AssetImage('assets/images/cat_refri.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'REFRIGERANTES',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 1.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardListTileWidget extends StatelessWidget {
  const ProductCardListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 4,
      child: Container(
        height: 160,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(14),
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage('assets/images/cat_refri.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 7,
            child: Text('Coca-Cola 600ml Zero       R\$ 12,99 ',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.add_box_outlined,
                  size: 50,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
