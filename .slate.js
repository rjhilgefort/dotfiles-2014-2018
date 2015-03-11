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
	undoOps: [
		'active-snapshot',
		'chain',
		'grid',
		'layout',
		'move',
		'resize',
		'sequence',
		'shell',
		'push'
	]
});


// Layouts
// TODO:

// Bindings
slate.bindAll({

	hyper: {

		// Direct focus to App
		// 's' because it's easy to hit with hyper.
		// All the below keys are right handed (and should stay that way)
		shift: {
			// Primary, most common
			j: $.focus('iTerm2'),
			k: $.focus('Google Chrome'),
			l: [$.focus('Messages'),
				$.focus('HipChat')],
			';': $.focus('Dash'),
			// h: // TODO: Focus previous

			// Secondary, second most common
			u: $.focus('Spotify'),
			i: [$.focus('Airmail'),
				$.focus('Sunrise')],
			o: $.focus('Finder'),
			y: [$.focus('Clear'),
				$.focus('Notes')],
		},


		// Bars
		h: [$('barResize', 'left', 2),
			$('barResize', 'left', 1.5),
			$('barResize', 'left', 3)/*,
			$('center',    'left', 3, 3)*/],

		j: [$('barResize', 'bottom', 2),
			$('barResize', 'bottom', 2)/*,
			$('center',    'bottom', 3, 3)*/],

		k: [$('barResize', 'top', 2),
			$('barResize', 'top', 2)/*,
			$('center',    'top', 3, 3)*/],

		l: [$('barResize', 'right', 2),
			$('barResize', 'right', 1.5),
			$('barResize', 'right', 3)/*,
			$('center',    'right', 3, 3)*/],

		// Corners
		y: [$('corner', 'top-left'),
			$('corner', 'top-left', 1.5),
			$('corner', 'top-left', 3, 2),
			$('corner', 'top-left', 3, 3)],

		i: [$('corner', 'top-right'),
			$('corner', 'top-right', 1.5),
			$('corner', 'top-right', 3, 2),
			$('corner', 'top-right', 3, 3)],

		b: [$('corner', 'bottom-left'),
			$('corner', 'bottom-left', 1.5),
			$('corner', 'bottom-left', 3, 2),
			$('corner', 'bottom-left', 3, 3)],

		m: [$('corner', 'bottom-right'),
			$('corner', 'bottom-right', 1.5),
			$('corner', 'bottom-right', 3, 2),
			$('corner', 'bottom-right', 3, 3)],


		// Centers
		u: [$('center', 'top'),
			$('center', 'top', 3, 3)],
		n: [$('center', 'bottom'),
			$('center', 'bottom', 3, 3)],

		// Maximize
		'return': [$('barResize', 'top', 1),
					$('center', 'center', 1.25, 1.25)],


		// Throw to monitor
		'`': ['throw 0 resize', 'throw 1 resize', 'throw 2 resize'],
		'1': $('toss', '0', 'resize'),
		'2': $('toss', '1', 'resize'),


		// Utility functions
		f1: 'relaunch',
		z: 'undo',
		// tab: 'hint',

	},

	// Show Slate hints
	'esc:cmd': 'hint'

});

$.log('DONE LOADING CONFIG');
