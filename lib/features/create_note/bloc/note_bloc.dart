import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notepad_weather/features/create_note/service/create_note_service.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial(0, CreateNoteService.instance)) {
    on<NoteEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetHeightEvent>((event, emit) {
      // state.height = event.height;
      // GetHeightState(event.height, event.service);
      emit(GetHeightState(state.height + 1, event.service));
    });

    on<UpdateNoteEvent>((event, emit) {
      emit(UpdatedNoteState(state.height + 1, state.service));
    });
  }
}
