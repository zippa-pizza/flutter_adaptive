import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleValueBloc<T> extends Cubit<T> {
  SimpleValueBloc(T value) : super(value);

  void change(T value) => emit(value);
}
