/**
 * Keys:
 * - ctrl
 * - alt
 * - cmd
 */

// Source relsate.js from submodule
S.src('.src/reslate/reslate.js');

// Enable to see debug messages in Console.app
$.debug = true;

$.log('LOADING CONFIG');

slate.alias('hyper', 'cmd;alt;ctrl');

// Begin config
slate.configAll({
  defaultToCurrentScreen: true,
  nudgePercentOf: 'screenSize',
  resizePercentOf: 'screenSize',
  undoOps: ['active-snapshot', 'chain', 'grid', 'layout', 'move', 'resize', 'sequence', 'shell', 'push']
});

var tossChain = [
  $('toss', '0', 'resize'),
  $('toss', '1', 'resize'),
  $('toss', '2', 'resize')
];

// Sizes!
// $('barResize', 'left', 2),     // 50%
// $('barResize', 'left', 1.5),   // 66%
// $('barResize', 'left', 1.335), // 75%
// $('barResize', 'left', 4),     // 25%
// $('barResize', 'left', 3),     // 33%

const generateSide = (area) => [
  $('barResize', area, 2),
  $('barResize', area, 1.5),
  $('barResize', area, 1.335),
  $('barResize', area, 4),
  $('barResize', area, 3),
];

const generateCorner = (area) => [
  $('corner', area),
  $('corner', area, 1.5),
  $('corner', area, 3),
  $('corner', area, 4),
  // $('corner', area, 3, 3),
];

const generateCenter = (area) => [
  $('center', area),
  // $('center', area, 3, 3),
];

// Bindings
slate.bindAll({

  'hyper': {

    // Direct focus to App
    // 's' because it's easy to hit with hyper.
    // All the below keys are right handed (and should stay that way)
    'shift': {
      // Primary, most common
      'j': $.focus('Emacs'),
      'k': $.focus('Google Chrome'),
      'l': [$.focus('Slack'), $.focus('Goofy'), $.focus('HipChat'), $.focus('Messages')],
      ';': $.focus('Dash'),
      'h': $.focus('Hearthstone'),
      // TODO: Have 'h' focus previous

      // Secondary, second most common
      'y': [$.focus('Airmail'), $.focus('Sunrise Calendar')],
      'u': [$.focus('Wunderlist')],
      'i': [$.focus('Spotify'), $.focus('Sonos')],
      'o': $.focus('Finder'),
    },

    // Bars
    'h': generateSide('left'),
    // 'j': $('barResize', 'bottom', 2),
    // 'k': $('barResize', 'top', 2),
    'l': generateSide('right'),

    // Corners
    'y': generateCorner('top-left'),
    'i': generateCorner('top-right'),
    'b': generateCorner('bottom-left'),
    'm': generateCorner('bottom-right'),

    // Centers
    'u': generateCenter('top'),
    'n': generateCenter('bottom'),

    // Nudge
    'j': $('move', 2, 0),
    'k': $('move', 0, 2),

    // Maximize
    'return': [
      $('barResize', 'top', 1),
      $('center', 'center', 1.25, 1.25),
    ],

    // 'space': slate.operation('toggle', { app: ['Google Chrome'] }),
    'space': $.focus('Google Chrome'),

    // Throw to monitor
    '`': tossChain,
    'v': tossChain,
    '1': $('toss', '0', 'resize'),
    '2': $('toss', '1', 'resize'),
    '3': $('toss', '2', 'resize'),

    // Utility functions
    'r': 'relaunch',
    'z': 'undo',
    // 'tab': 'hint',

  },

  // Show Slate hints
  'esc:cmd': 'hint',

});

$.log('DONE LOADING CONFIG');
