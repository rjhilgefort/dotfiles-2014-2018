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


// Layouts
// TODO:

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
			'o': $.focus('Finder')
		},


		// Bars
		'h': [
			$('barResize', 'left', 2),
			$('barResize', 'left', 1.5),
			$('barResize', 'left', 3)/*,
			$('center',    'left', 3, 3)*/
		],

		/*
		 * For vertical monitory youtube:
		 * - With chrome bookmark bar:    j-2.787 k-1.385
		 * - Without chrome bookmark bar: j-2.8875 k-1.3875
		 */
		'j': [
			$('barResize', 'bottom', 2),
			// $('barResize', 'bottom', 1.5),
			// $('barResize', 'bottom', 3),
			$('barResize', 'bottom', 2.8875)
		],

		'k': [
			$('barResize', 'top', 2),
			// $('barResize', 'top', 1.5),
			// $('barResize', 'top', 3),
			$('barResize', 'top', 1.3875)
		],

		'l': [
			$('barResize', 'right', 2),
			$('barResize', 'right', 1.5),
			$('barResize', 'right', 3)/*,
			$('center',    'right', 3, 3)*/
		],

		// Corners
		'y': [
			$('corner', 'top-left'),
			$('corner', 'top-left', 1.5),
			$('corner', 'top-left', 3, 2),
			$('corner', 'top-left', 3, 3)
		],

		'i': [
			$('corner', 'top-right'),
			$('corner', 'top-right', 1.5),
			$('corner', 'top-right', 3, 2),
			$('corner', 'top-right', 3, 3)
		],

		'b': [
			$('corner', 'bottom-left'),
			$('corner', 'bottom-left', 1.5),
			$('corner', 'bottom-left', 3, 2),
			$('corner', 'bottom-left', 3, 3)
		],

		'm': [
			$('corner', 'bottom-right'),
			$('corner', 'bottom-right', 1.5),
			$('corner', 'bottom-right', 3, 2),
			$('corner', 'bottom-right', 3, 3)
		],


		// Centers
		'u': [
			$('center', 'top'),
			$('center', 'top', 3, 3)
		],

		'n': [
			$('center', 'bottom'),
			$('center', 'bottom', 3, 3)
		],

		// Maximize
		'return': [
			$('barResize', 'top', 1),
			$('center', 'center', 1.25, 1.25)
		],


		// Throw to monitor
		'`': [
			$('toss', '0', 'resize'),
			$('toss', '1', 'resize'),
			$('toss', '2', 'resize')
		],
		'1': $('toss', '0', 'resize'),
		'2': $('toss', '1', 'resize'),
		'3': $('toss', '2', 'resize'),


		// Utility functions
		'f2': 'relaunch',
		'z': 'undo',
		// 'tab': 'hint',

	},

	// Show Slate hints
	'esc:cmd': 'hint'

});

$.log('DONE LOADING CONFIG');
