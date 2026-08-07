import 'dart:async';

/// Minimal combineLatest for two streams — emits [combiner] applied to the
/// most recent value of each source stream, once both have emitted at least
/// once. Avoids pulling in rxdart for this one use.
Stream<R> combineLatest2<A, B, R>(
  Stream<A> streamA,
  Stream<B> streamB,
  R Function(A a, B b) combiner,
) {
  late StreamController<R> controller;
  StreamSubscription<A>? subA;
  StreamSubscription<B>? subB;
  A? latestA;
  B? latestB;
  var hasA = false;
  var hasB = false;

  void emitIfReady() {
    if (hasA && hasB) {
      controller.add(combiner(latestA as A, latestB as B));
    }
  }

  controller = StreamController<R>.broadcast(
    onListen: () {
      subA = streamA.listen(
        (value) {
          latestA = value;
          hasA = true;
          emitIfReady();
        },
        onError: controller.addError,
      );
      subB = streamB.listen(
        (value) {
          latestB = value;
          hasB = true;
          emitIfReady();
        },
        onError: controller.addError,
      );
    },
    onCancel: () async {
      await subA?.cancel();
      await subB?.cancel();
    },
  );

  return controller.stream;
}

/// Same idea as [combineLatest2], extended to four streams.
Stream<R> combineLatest4<A, B, C, D, R>(
  Stream<A> streamA,
  Stream<B> streamB,
  Stream<C> streamC,
  Stream<D> streamD,
  R Function(A a, B b, C c, D d) combiner,
) {
  late StreamController<R> controller;
  StreamSubscription<A>? subA;
  StreamSubscription<B>? subB;
  StreamSubscription<C>? subC;
  StreamSubscription<D>? subD;
  A? latestA;
  B? latestB;
  C? latestC;
  D? latestD;
  var hasA = false;
  var hasB = false;
  var hasC = false;
  var hasD = false;

  void emitIfReady() {
    if (hasA && hasB && hasC && hasD) {
      controller.add(combiner(latestA as A, latestB as B, latestC as C, latestD as D));
    }
  }

  controller = StreamController<R>.broadcast(
    onListen: () {
      subA = streamA.listen((value) {
        latestA = value;
        hasA = true;
        emitIfReady();
      }, onError: controller.addError);
      subB = streamB.listen((value) {
        latestB = value;
        hasB = true;
        emitIfReady();
      }, onError: controller.addError);
      subC = streamC.listen((value) {
        latestC = value;
        hasC = true;
        emitIfReady();
      }, onError: controller.addError);
      subD = streamD.listen((value) {
        latestD = value;
        hasD = true;
        emitIfReady();
      }, onError: controller.addError);
    },
    onCancel: () async {
      await subA?.cancel();
      await subB?.cancel();
      await subC?.cancel();
      await subD?.cancel();
    },
  );

  return controller.stream;
}
