import 'package:cureocity_flutter_test/core/constants/theme/app_colors.dart';
import 'package:cureocity_flutter_test/features/Home/data/model/response_model.dart';
import 'package:cureocity_flutter_test/features/Home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetCountryListEvent());
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  List<CountriesModel> countryList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Countries",
          style: Theme.of(context).textTheme.headlineLarge!,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(GetCountryListEvent());
        },
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is SuccessState) {
              if (countryList.isEmpty) {
                countryList = state.responseEntity.countries;
              }
            }
          },
          builder: (context, state) {
            print(state);
            if (state is LoadingState) {
              return Container(
                child: const Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white))),
              );
            } else if (state is SuccessState) {
              print(state.responseEntity.countries.length);
              return ListView.builder(
                itemCount: countryList.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      if (index == 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: searchController,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  countryList = state.responseEntity.countries
                                      .where((element) =>
                                          element.name.contains(value))
                                      .toList();
                                });
                              } else {
                                setState(() {
                                  countryList = state.responseEntity.countries;
                                });
                              }
                            },
                          ),
                        ),
                      ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        tileColor: AppColors.greylight,
                        title: Text(
                          countryList[index].name,
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.greylight,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              countryList[index].emoji,
                              style: Theme.of(context).textTheme.headlineLarge!,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          countryList[index].code,
                          style: Theme.of(context).textTheme.bodyMedium!,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is FailureState) {
              return Center(
                child: Text(
                  state.message,
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
