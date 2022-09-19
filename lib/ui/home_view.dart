import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc/home_bloc.dart';
import 'package:new_app/data/get_image_client.dart';
import 'package:new_app/data/image_url_model.dart';

import 'reusable_widgets/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('new app'),
      ),
      body: Stack(
        children: [
          const Background(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ImageContainer(),
                //action buttons for play pause and rewind
                Actions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: state.apiCall
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            // for initial state we are only showing play button
            //when user will click on it ,
            //we will add ApiStarted event
            // (in which we can give
            //(
            // number_of_imgs(we have to show in one go),                      -> eg: 5
            // initial_img_url(if it is empty than we will show an asset img), -> eg: ''
            // apicall true or false(ie. is img are from api or cache)         -> eg: true
            // )
            if (state is InitialState) ...[
              FloatingActionButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: () => context.read<HomeBloc>().add(
                      const StartEvent(
                          duration: 50, imageUrl: '', apiCall: true))),
            ],
            //when state is in progress
            //there we will showing Pause and Rewind Buttons
            //but Rewind button will be hidden if Rewind button already pressed
            if (state is ProgressState) ...[
              FloatingActionButton(
                  child: Icon(Icons.pause),
                  onPressed: () =>
                      context.read<HomeBloc>().add(const PausedEvent())),
              Visibility(
                visible: state.apiCall,
                child: FloatingActionButton(
                  child: Icon(Icons.replay),
                  onPressed: () => context.read<HomeBloc>().add(RewindEvent()),
                ),
              ),
            ],
            //when state is pause
            //there we will showing Play and Rewind Buttons
            //but Rewind button will be hidden --> if Rewind button already pressed
            if (state is PauseState) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<HomeBloc>().add(ResumedEvent()),
              ),
              Visibility(
                visible: state.apiCall,
                child: FloatingActionButton(
                  child: Icon(Icons.replay),
                  onPressed: () => context.read<HomeBloc>().add(RewindEvent()),
                ),
              ),
            ],
            //if user see all the 50 images
            //in that case -> Unsplash api limit will be end
            //so we will show only 1 button(Rewind) for user to interact.
            if (state is LimitCompleteState) ...[
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<HomeBloc>().add(RewindEvent()),
              ),
            ]
          ],
        );
      },
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: state.imageUrl != '' &&
                    state.imageUrl != 'rewind' &&
                    state.imageUrl != 'limit'
                ? Image.network(
                    key: ValueKey('network_img'),
                    state.imageUrl != '' && state.imageUrl != 'rewind'
                        ? state.imageUrl
                        : 'https://images.unsplash.com/photo-1525281647150-cf8ecc3bfae0?crop=entropy\u0026cs=tinysrgb\u0026fm=jpg\u0026ixid=MnwzNjQ0MjJ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjMyMzczMjM\u0026ixlib=rb-1.2.1\u0026q=80',
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    key: ValueKey('asset_img'),
                    state.imageUrl == ''
                        ? 'assets/initial_img.jpeg'
                        : state.imageUrl == 'rewind'
                            ? 'assets/thank_you.png'
                            : 'assets/limit.jpeg',
                    fit: BoxFit.fill),
          ),
        );
      },
    );
  }
}
