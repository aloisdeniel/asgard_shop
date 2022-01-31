import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AppTapState {
  disabled,
  inactive,
  focused,
  hovered,
  pressed,
}

typedef AppTapWidgetBuilder = Widget Function(
  BuildContext context,
  AppTapState state,
);

class AppTapBuilder extends StatefulWidget {
  const AppTapBuilder({
    Key? key,
    required this.builder,
    this.onTap,
    this.canRequestFocus = true,
    this.excludeFromSemantics = false,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
  }) : super(key: key);

  final AppTapWidgetBuilder builder;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool canRequestFocus;
  final bool excludeFromSemantics;
  final MouseCursor? mouseCursor;

  @override
  State<AppTapBuilder> createState() => _AppTapBuilderState();
}

class _AppTapBuilderState extends State<AppTapBuilder> {
  bool _isFocused = false;
  bool _isHovered = false;
  bool _isPressed = false;
  bool _showFocus = true;

  AppTapState get state {
    if (widget.onTap == null) {
      return AppTapState.disabled;
    }
    if (_isPressed) {
      return AppTapState.pressed;
    }
    if (_isHovered) {
      return AppTapState.hovered;
    }
    if (_isFocused) {
      return AppTapState.focused;
    }
    return AppTapState.inactive;
  }

  late final Map<Type, Action<Intent>> _actionMap = <Type, Action<Intent>>{
    ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: _simulateTap),
    ButtonActivateIntent:
        CallbackAction<ButtonActivateIntent>(onInvoke: _simulateTap),
  };

  void _simulateTap([Intent? intent]) {
    widget.onTap?.call();
  }

  @override
  void initState() {
    super.initState();
    FocusManager.instance
        .addHighlightModeListener(_handleFocusHighlightModeChange);
  }

  @override
  void dispose() {
    FocusManager.instance
        .removeHighlightModeListener(_handleFocusHighlightModeChange);
    super.dispose();
  }

  void _handleFocusHighlightModeChange(FocusHighlightMode mode) {
    if (!mounted) {
      return;
    }
    setState(() {
      switch (FocusManager.instance.highlightMode) {
        case FocusHighlightMode.touch:
          _showFocus = false;
          break;
        case FocusHighlightMode.traditional:
          _showFocus = _shouldShowFocus;
          break;
      }
    });
  }

  bool get _shouldShowFocus {
    final mode = MediaQuery.maybeOf(context)?.navigationMode ??
        NavigationMode.traditional;
    switch (mode) {
      case NavigationMode.traditional:
        return enabled && _isFocused;
      case NavigationMode.directional:
        return _isFocused;
    }
  }

  void _handleFocusUpdate(bool hasFocus) {
    setState(() {
      _isFocused = hasFocus;
    });
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleTap() {
    widget.onTap?.call();
    setState(() {
      _isPressed = false;
    });
  }

  bool _isWidgetEnabled(AppTapBuilder widget) {
    return widget.onTap != null;
  }

  bool get enabled => _isWidgetEnabled(widget);

  void _handleMouseEnter(PointerEnterEvent event) {
    setState(() {
      _isHovered = true;
    });
  }

  void _handleMouseExit(PointerExitEvent event) {
    setState(() {
      _isHovered = false;
    });
  }

  bool get _canRequestFocus {
    final NavigationMode mode = MediaQuery.maybeOf(context)?.navigationMode ??
        NavigationMode.traditional;
    switch (mode) {
      case NavigationMode.traditional:
        return enabled && widget.canRequestFocus;
      case NavigationMode.directional:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    final effectiveMouseCursor = widget.mouseCursor ??
        () {
          switch (state) {
            case AppTapState.disabled:
              return SystemMouseCursors.forbidden;
            case AppTapState.pressed:
            case AppTapState.hovered:
              return SystemMouseCursors.click;
            default:
              return SystemMouseCursors.basic;
          }
        }();
    return Actions(
      actions: _actionMap,
      child: Focus(
        focusNode: widget.focusNode,
        canRequestFocus: _canRequestFocus,
        onFocusChange: _handleFocusUpdate,
        autofocus: widget.autofocus,
        child: MouseRegion(
          cursor: effectiveMouseCursor,
          onEnter: _handleMouseEnter,
          onExit: _handleMouseExit,
          child: Semantics(
            onTap: widget.excludeFromSemantics || widget.onTap == null
                ? null
                : _simulateTap,
            child: GestureDetector(
              onTapDown: enabled ? _handleTapDown : null,
              onTap: enabled ? _handleTap : null,
              onTapCancel: enabled ? _handleTapCancel : null,
              behavior: HitTestBehavior.opaque,
              excludeFromSemantics: true,
              child: widget.builder(context, state),
            ),
          ),
        ),
      ),
    );
  }
}
