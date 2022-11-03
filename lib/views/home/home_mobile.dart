part of home_view;

class _HomeMobile extends StatefulWidget {
  const _HomeMobile();

  @override
  State<_HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<_HomeMobile>
    with SingleTickerProviderStateMixin, LogMixin {
  List<Shop> shopsModel = [];
  List<ShopWidget> shopWidget = [];
  List<ShopWidget> premiumWidgets = [];
  List<ShopWidget> tamilNaduWidgets = [];
  bool _isLoading = false;

  @override
  void initState() {
    getShopData();
    super.initState();
  }

  getShopData() async {
    setState(() {
      _isLoading = true;
    });
    List<ShopWidget> shopWidgets = [];
    List<Shop> shops = await locator<ShopService>().getShopData();
    for (var shop in shops) {
      shopWidgets.add(ShopWidget(shop: shop));
    }
    setState(() {
      shopWidget = shopWidgets;
      shopsModel = shops;
      _isLoading = false;
      tamilNaduWidgets = shopWidgets
          .where((shop) => shop.shop.p_category == 'Tamilnadu')
          .toList();
      premiumWidgets = shopWidgets
          .where((shop) => shop.shop.p_category == 'Premium')
          .toList();
    });
    warningLog(
        'tamil nadu widgets$tamilNaduWidgets, premium widgets $premiumWidgets');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
          backgroundColor: CupertinoColors.secondarySystemGroupedBackground,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: const Text(
              'Shop',
              style: TextStyle(color: Colors.blue),
            ),
            centerTitle: true,
            actions: const [
              Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              )
            ],
            bottom: const TabBar(
              indicatorColor: Colors.lime,
              indicatorWeight: 5.0,
              labelColor: Colors.black,
              labelPadding: EdgeInsets.only(top: 10.0),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'All',
                  icon: Icon(
                    Icons.local_grocery_store,
                    color: Colors.black,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
                Tab(
                  text: 'Premium',
                  icon: Icon(
                    Icons.king_bed,
                    color: Colors.black,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
                //child: Image.asset('images/android.png'),

                Tab(
                  text: 'Tamil Nadu',
                  icon: Icon(
                    Icons.airlines,
                    color: Colors.black,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
              ],
            ),
          ),
          body: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : TabBarView(
                  children: [
                    RefreshIndicator(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              crossAxisCount: 2,
                              children: shopWidget,
                            ),
                          ],
                        ),
                      ),
                      onRefresh: () => locator<ShopService>().getShopData(),
                    ),
                    RefreshIndicator(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              crossAxisCount: 2,
                              children: tamilNaduWidgets,
                            ),
                          ],
                        ),
                      ),
                      onRefresh: () => locator<ShopService>().getShopData(),
                    ),
                    RefreshIndicator(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              crossAxisCount: 2,
                              children: premiumWidgets,
                            ),
                          ],
                        ),
                      ),
                      onRefresh: () => locator<ShopService>().getShopData(),
                    ),
                  ],
                )),
    );
  }
}
