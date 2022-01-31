import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

const dogImage = NetworkImage('https://dog.png');

Future<void> ensureImagesPreloaded(WidgetTester tester) async {
  // Workaround to force load images so that it appears in golden renders
  await tester.pumpWidget(const SizedBox());
  await tester.runAsync(() {
    final context = tester.element(find.byType(SizedBox));
    return precacheImage(dogImage, context);
  });
}

/// Runs [body] in separate [Zone] with [MockHttpClient].
R mockNetworkImagesFor<R>(R Function() body) {
  return HttpOverrides.runZoned(
    body,
    createHttpClient: (_) => createMockImageHttpClient(),
  );
}

class MockHttpClient extends Mock implements HttpClient {
  @override
  Future<HttpClientRequest> getUrl(Uri? url) {
    // ignore: invalid_use_of_visible_for_testing_member
    return super.noSuchMethod(Invocation.method(#getUrl, [url]),
        returnValue: Future.value(MockHttpClientRequest()));
  }
}

class MockHttpClientRequest extends Mock implements HttpClientRequest {
  @override
  // ignore: invalid_use_of_visible_for_testing_member
  HttpHeaders get headers => super.noSuchMethod(Invocation.getter(#headers),
      returnValue: MockHttpHeaders());

  @override
  Future<HttpClientResponse> close() =>
      // ignore: invalid_use_of_visible_for_testing_member
      super.noSuchMethod(Invocation.method(#close, []),
          returnValue: Future.value(MockHttpClientResponse()));
}

class MockHttpClientResponse extends Mock implements HttpClientResponse {
  @override
  HttpClientResponseCompressionState get compressionState =>
      // ignore: invalid_use_of_visible_for_testing_member
      super.noSuchMethod(Invocation.getter(#compressionState),
          returnValue: HttpClientResponseCompressionState.notCompressed);

  @override
  int get contentLength =>
      // ignore: invalid_use_of_visible_for_testing_member
      super.noSuchMethod(Invocation.getter(#contentLength), returnValue: 0);

  @override
  int get statusCode =>
      // ignore: invalid_use_of_visible_for_testing_member
      super.noSuchMethod(Invocation.getter(#statusCode), returnValue: 0);

  @override
  StreamSubscription<List<int>> listen(void Function(List<int>)? onData,
          {Function? onError, void Function()? onDone, bool? cancelOnError}) =>
      // ignore: invalid_use_of_visible_for_testing_member
      super.noSuchMethod(
          Invocation.method(#listen, [
            onData,
          ], {
            const Symbol("onError"): onError,
            const Symbol("onDone"): onDone,
            const Symbol("cancelOnError"): cancelOnError,
          }),
          returnValue: MockStreamSubscription<List<int>>());
}

class MockHttpHeaders extends Mock implements HttpHeaders {}

class MockStreamSubscription<T> extends Mock implements StreamSubscription<T> {}

/// Returns a [MockHttpClient] that responds with demo image to all requests.
MockHttpClient createMockImageHttpClient() {
  final MockHttpClient client = MockHttpClient();
  final MockHttpClientRequest request = MockHttpClientRequest();
  final MockHttpClientResponse response = MockHttpClientResponse();
  final MockHttpHeaders headers = MockHttpHeaders();

  when(client.getUrl(any))
      .thenAnswer((_) => Future<HttpClientRequest>.value(request));
  when(request.headers).thenReturn(headers);
  when(request.close())
      .thenAnswer((_) => Future<HttpClientResponse>.value(response));
  when(response.compressionState)
      .thenReturn(HttpClientResponseCompressionState.notCompressed);
  when(response.contentLength).thenReturn(_image.length);
  when(response.statusCode).thenReturn(HttpStatus.ok);
  when(response.listen(
    any,
    onError: anyNamed("onError"),
    onDone: anyNamed("onDone"),
    cancelOnError: anyNamed("cancelOnError"),
  )).thenAnswer((Invocation invocation) {
    final void Function(List<int>) onData = invocation.positionalArguments[0];
    final onDone = invocation.namedArguments[#onDone];
    final onError = invocation.namedArguments[#onError];
    final bool? cancelOnError = invocation.namedArguments[#cancelOnError];

    return Stream<List<int>>.fromIterable(<List<int>>[_image]).listen(
      onData,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
  });

  return client;
}

// A cute dog
final _image = base64Decode(
  "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",
);
