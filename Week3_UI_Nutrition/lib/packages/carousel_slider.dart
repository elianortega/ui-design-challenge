library carousel_slider;

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  /// [CarouselOptions] to create a [CarouselState] with
  ///
  /// This property must not be null
  final CarouselOptions options;

  /// The widgets to be shown in the carousel of default constructor
  final List<Widget> items;

  /// The widget item builder that will be used to build item on demand
  final IndexedWidgetBuilder itemBuilder;

  /// A [MapController], used to control the map.
  final CarouselControllerImpl _carouselController;

  final int itemCount;

  CarouselSlider({@required this.items, @required this.options, carouselController, Key key})
      : itemBuilder = null,
        itemCount = items != null ? items.length : 0,
        _carouselController = carouselController ?? CarouselController(),
        super(key: key);

  /// The on demand item builder constructor
  CarouselSlider.builder(
      {@required this.itemCount,
      @required this.itemBuilder,
      @required this.options,
      carouselController,
      Key key})
      : items = null,
        _carouselController = carouselController ?? CarouselController(),
        super(key: key);

  @override
  CarouselSliderState createState() => CarouselSliderState(_carouselController);
}

class CarouselSliderState extends State<CarouselSlider> with TickerProviderStateMixin {
  final CarouselControllerImpl carouselController;
  Timer timer;

  CarouselOptions get options => widget.options ?? CarouselOptions();

  CarouselState carouselState;

  /// mode is related to why the page is being changed
  CarouselPageChangedReason mode = CarouselPageChangedReason.controller;

  CarouselSliderState(this.carouselController);

  @override
  void didUpdateWidget(CarouselSlider oldWidget) {
    carouselState.options = options;
    carouselState.itemCount = widget.itemCount;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    carouselState = CarouselState(this.options, clearTimer, resumeTimer);

    carouselState.itemCount = widget.itemCount;
    carouselController.state = carouselState;
    carouselState.initialPage = widget.options.initialPage;
    carouselState.realPage = options.enableInfiniteScroll
        ? carouselState.realPage + carouselState.initialPage
        : carouselState.initialPage;
    timer = getTimer();

    PageController pageController = PageController(
      viewportFraction: options.viewportFraction,
      initialPage: carouselState.realPage,
    );

    carouselState.pageController = pageController;
  }

  Timer getTimer() {
    return widget.options.autoPlay
        ? Timer.periodic(widget.options.autoPlayInterval, (_) {
            CarouselPageChangedReason previousReason = mode;
            mode = CarouselPageChangedReason.timed;
            int nextPage = carouselState.pageController.page.round() + 1;
            int itemCount = widget.itemCount ?? widget.items.length;

            if (nextPage >= itemCount && widget.options.enableInfiniteScroll == false) {
              if (widget.options.pauseAutoPlayInFiniteScroll) {
                clearTimer();
                return;
              }
              nextPage = 0;
            }

            carouselState.pageController
                .animateToPage(nextPage,
                    duration: widget.options.autoPlayAnimationDuration,
                    curve: widget.options.autoPlayCurve)
                .then((_) => mode = previousReason);
          })
        : null;
  }

  void clearTimer() {
    if (widget.options.autoPlay) {
      timer?.cancel();
    }
  }

  void resumeTimer() {
    if (widget.options.autoPlay) {
      timer = getTimer();
    }
  }

  Widget getWrapper(Widget child) {
    Widget wrapper;
    if (widget.options.height != null) {
      wrapper = Container(height: widget.options.height, child: child);
    } else {
      wrapper = AspectRatio(aspectRatio: widget.options.aspectRatio, child: child);
    }

    return RawGestureDetector(
      gestures: {
        _MultipleGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<_MultipleGestureRecognizer>(
                () => _MultipleGestureRecognizer(), (_MultipleGestureRecognizer instance) {
          instance.onDown = (_) {
            onPanDown();
          };
          instance.onEnd = (_) {
            onPanUp();
          };
          instance.onCancel = () {
            onPanUp();
          };
        }),
      },
      child: NotificationListener(
        onNotification: (notification) {
          if (widget.options.onScrolled != null && notification is ScrollUpdateNotification) {
            widget.options.onScrolled(carouselState.pageController.page);
          }
          return false;
        },
        child: wrapper,
      ),
    );
  }

  void onPanDown() {
    if (widget.options.pauseAutoPlayOnTouch) {
      clearTimer();
    }

    mode = CarouselPageChangedReason.manual;
  }

  void onPanUp() {
    if (widget.options.pauseAutoPlayOnTouch) {
      resumeTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    clearTimer();
  }

  @override
  Widget build(BuildContext context) {
    return getWrapper(PageView.builder(
      physics: widget.options.scrollPhysics,
      scrollDirection: widget.options.scrollDirection,
      controller: carouselState.pageController,
      reverse: widget.options.reverse,
      itemCount: widget.options.enableInfiniteScroll ? null : widget.itemCount,
      key: widget.options.pageViewKey,
      onPageChanged: (int index) {
        int currentPage = getRealIndex(
            index + carouselState.initialPage, carouselState.realPage, widget.itemCount);
        if (widget.options.onPageChanged != null) {
          widget.options.onPageChanged(currentPage, mode);
        }
        mode = CarouselPageChangedReason.controller;
      },
      itemBuilder: (BuildContext context, int idx) {
        final int index =
            getRealIndex(idx + carouselState.initialPage, carouselState.realPage, widget.itemCount);

        return AnimatedBuilder(
          animation: carouselState.pageController,
          child: (widget.items != null)
              ? (widget.items.length > 0 ? widget.items[index] : Container())
              : widget.itemBuilder(context, index),
          builder: (BuildContext context, child) {
            double distortionValue = 1.0;
            // if `enlargeCenterPage` is true, we must calculate the carousel item's height
            // to display the visual effect
            if (widget.options.enlargeCenterPage != null &&
                widget.options.enlargeCenterPage == true) {
              double itemOffset;
              // pageController.page can only be accessed after the first build,
              // so in the first build we calculate the itemoffset manually
              if (carouselState.pageController.position.minScrollExtent == null ||
                  carouselState.pageController.position.maxScrollExtent == null) {
                BuildContext storageContext =
                    carouselState.pageController.position.context.storageContext;
                final double previousSavedPosition =
                    PageStorage.of(storageContext)?.readState(storageContext) as double;
                if (previousSavedPosition != null) {
                  itemOffset = previousSavedPosition - idx.toDouble();
                } else {
                  itemOffset = carouselState.realPage.toDouble() - idx.toDouble();
                }
              } else {
                itemOffset = carouselState.pageController.page - idx;
              }
              final distortionRatio = (1 - (itemOffset.abs() * 0.3)).clamp(0.0, 1.0);
              distortionValue = Curves.easeOut.transform(distortionRatio);
            }

            final double height = widget.options.height ??
                MediaQuery.of(context).size.width * (1 / widget.options.aspectRatio);

            if (widget.options.scrollDirection == Axis.horizontal) {
              return Center(
                child: Transform.scale(
                  scale: distortionValue,
                  // height: distortionValue * height,
                  child: Container(height: height, child: child),
                ),
              );
            } else {
              return Center(
                child: Transform.scale(
                  // width: distortionValue * MediaQuery.of(context).size.width,
                  scale: distortionValue,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: child,
                  ),
                ),
              );
            }
          },
        );
      },
    ));
  }
}

class _MultipleGestureRecognizer extends PanGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

/// Converts an index of a set size to the corresponding index of a collection of another size
/// as if they were circular.
///
/// Takes a [position] from collection Foo, a [base] from where Foo's index originated
/// and the [length] of a second collection Baa, for which the correlating index is sought.
///
/// For example; We have a Carousel of 10000(simulating infinity) but only 6 images.
/// We need to repeat the images to give the illusion of a never ending stream.
/// By calling _getRealIndex with position and base we get an offset.
/// This offset modulo our length, 6, will return a number between 0 and 5, which represent the image
/// to be placed in the given position.
int getRealIndex(int position, int base, int length) {
  final int offset = position - base;
  return remainder(offset, length);
}

/// Returns the remainder of the modulo operation [input] % [source], and adjust it for
/// negative values.
int remainder(int input, int source) {
  if (source == 0) return 0;
  final int result = input % source;
  return result < 0 ? source + result : result;
}

enum CarouselPageChangedReason { timed, manual, controller }

class CarouselOptions {
  /// Set carousel height and overrides any existing [aspectRatio].
  final double height;

  /// Aspect ratio is used if no height have been declared.
  ///
  /// Defaults to 16:9 aspect ratio.
  final double aspectRatio;

  /// The fraction of the viewport that each page should occupy.
  ///
  /// Defaults to 0.8, which means each page fills 80% of the carousel.
  final double viewportFraction;

  /// The initial page to show when first creating the [CarouselSlider].
  ///
  /// Defaults to 0.
  final int initialPage;

  ///Determines if carousel should loop infinitely or be limited to item length.
  ///
  ///Defaults to true, i.e. infinite loop.
  final bool enableInfiniteScroll;

  /// Reverse the order of items if set to true.
  ///
  /// Defaults to false.
  final bool reverse;

  /// Enables auto play, sliding one page at a time.
  ///
  /// Use [autoPlayInterval] to determent the frequency of slides.
  /// Defaults to false.
  final bool autoPlay;

  /// Sets Duration to determent the frequency of slides when
  ///
  /// [autoPlay] is set to true.
  /// Defaults to 4 seconds.
  final Duration autoPlayInterval;

  /// The animation duration between two transitioning pages while in auto playback.
  ///
  /// Defaults to 800 ms.
  final Duration autoPlayAnimationDuration;

  /// Determines the animation curve physics.
  ///
  /// Defaults to [Curves.fastOutSlowIn].
  final Curve autoPlayCurve;

  /// Determines if current page should be larger then the side images,
  /// creating a feeling of depth in the carousel.
  ///
  /// Defaults to false.
  final bool enlargeCenterPage;

  /// The axis along which the page view scrolls.
  ///
  /// Defaults to [Axis.horizontal].
  final Axis scrollDirection;

  /// Called whenever the page in the center of the viewport changes.
  final Function(int index, CarouselPageChangedReason reason) onPageChanged;

  /// Called whenever the carousel is scrolled
  final ValueChanged<double> onScrolled;

  /// How the carousel should respond to user input.
  ///
  /// For example, determines how the items continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics scrollPhysics;

  /// If `true`, the auto play function will be paused when user is interacting with
  /// the carousel, and will be resumed when user finish interacting.
  /// Default to `true`.
  final bool pauseAutoPlayOnTouch;

  /// If `true`, the auto play function will be paused when user is calling
  /// pageController's `nextPage` or `previousPage` or `animateToPage` method.
  /// And after the animation complete, the auto play will be resumed.
  /// Default to `true`.
  final bool pauseAutoPlayOnManualNavigate;

  /// If `enableInfiniteScroll` is `false`, and `autoPlay` is `true`, this option
  /// decide the carousel should go to the first item when it reach the last item or not.
  /// If set to `true`, the auto play will be paused when it reach the last item.
  /// If set to `false`, the auto play function will animate to the first item when it was
  /// in the last item.
  final bool pauseAutoPlayInFiniteScroll;

  /// Pass a `PageStoragekey` if you want to keep the pageview's position when it was recreated.
  final PageStorageKey pageViewKey;

  CarouselOptions({
    this.height,
    this.aspectRatio: 16 / 9,
    this.viewportFraction: 0.8,
    this.initialPage: 0,
    this.enableInfiniteScroll: true,
    this.reverse: false,
    this.autoPlay: false,
    this.autoPlayInterval: const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.autoPlayCurve: Curves.fastOutSlowIn,
    this.enlargeCenterPage = false,
    this.onPageChanged,
    this.onScrolled,
    this.scrollPhysics,
    this.scrollDirection: Axis.horizontal,
    this.pauseAutoPlayOnTouch: true,
    this.pauseAutoPlayOnManualNavigate: true,
    this.pauseAutoPlayInFiniteScroll: false,
    this.pageViewKey,
    carouselController,
  });
}

abstract class CarouselController {
  bool get ready;

  Future<Null> get onReady;

  void nextPage({Duration duration, Curve curve});

  void previousPage({Duration duration, Curve curve});

  void jumpToPage(int page);

  void animateToPage(int page, {Duration duration, Curve curve});

  factory CarouselController() => CarouselControllerImpl();
}

class CarouselControllerImpl implements CarouselController {
  final Completer<Null> _readyCompleter = Completer<Null>();

  CarouselState _state;

  set state(CarouselState state) {
    _state = state;
    if (!_readyCompleter.isCompleted) {
      _readyCompleter.complete();
    }
  }

  @override
  bool get ready => _state != null;

  @override
  Future<Null> get onReady => _readyCompleter.future;

  /// Animates the controlled [CarouselSlider] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> nextPage(
      {Duration duration = const Duration(milliseconds: 300), Curve curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state.onResetTimer();
    }
    await _state.pageController.nextPage(duration: duration, curve: curve);
    if (isNeedResetTimer) {
      _state.onResumeTimer();
    }
  }

  /// Animates the controlled [CarouselSlider] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> previousPage(
      {Duration duration = const Duration(milliseconds: 300), Curve curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state.onResetTimer();
    }
    await _state.pageController.previousPage(duration: duration, curve: curve);
    if (isNeedResetTimer) {
      _state.onResumeTimer();
    }
  }

  /// Changes which page is displayed in the controlled [CarouselSlider].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToPage(int page) {
    final index = getRealIndex(
        _state.pageController.page.toInt(), _state.realPage - _state.initialPage, _state.itemCount);

    final int pageToJump = _state.pageController.page.toInt() + page - index;
    return _state.pageController.jumpToPage(pageToJump);
  }

  /// Animates the controlled [CarouselSlider] from the current page to the given page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> animateToPage(int page,
      {Duration duration = const Duration(milliseconds: 300), Curve curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state.onResetTimer();
    }
    final index = getRealIndex(
        _state.pageController.page.toInt(), _state.realPage - _state.initialPage, _state.itemCount);
    await _state.pageController.animateToPage(_state.pageController.page.toInt() + page - index,
        duration: duration, curve: curve);
    if (isNeedResetTimer) {
      _state.onResumeTimer();
    }
  }
}

class CarouselState {
  /// The [CarouselOptions] to create this state
  CarouselOptions options;

  /// [pageController] is created using the properties passed to the constructor
  /// and can be used to control the [PageView] it is passed to.
  PageController pageController;

  /// The actual index of the [PageView].
  ///
  /// This value can be ignored unless you know the carousel will be scrolled
  /// backwards more then 10000 pages.
  /// Defaults to 10000 to simulate infinite backwards scrolling.
  int realPage = 10000;

  /// The initial index of the [PageView] on [CarouselSlider] init.
  ///
  int initialPage = 0;

  /// The widgets count that should be shown at carousel
  int itemCount;

  /// Will be called when using pageController to go to next page or
  /// previous page. It will clear the autoPlay timer.
  /// Internal use only
  Function onResetTimer;

  /// Will be called when using pageController to go to next page or
  /// previous page. It will restart the autoPlay timer.
  /// Internal use only
  Function onResumeTimer;

  CarouselState(this.options, this.onResetTimer, this.onResumeTimer);
}
