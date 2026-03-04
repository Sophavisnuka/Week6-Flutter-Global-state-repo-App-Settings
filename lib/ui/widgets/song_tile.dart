import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_mvvm/model/songs/song.dart';
import 'package:week6_mvvm/ui/states/player_state.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    PlayerState state = context.watch<PlayerState>();
    return ListTile(
      onTap: onTap,
      title: Row(
        children: [
          Text(song.title),
          SizedBox(width: 5,),
          Text(isPlaying ? "Playing": "", style: TextStyle(fontSize: 15 , color: Colors.red),)
        ],
      ),
      trailing: isPlaying ? ElevatedButton(
        onPressed: () {
          state.stop();
        }, 
        child:Icon(
          Icons.stop_circle, size: 20, color: Colors.red,
        )
      ): Text("")
    );
  }
}
