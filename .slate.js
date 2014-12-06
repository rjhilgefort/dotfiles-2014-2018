// source relsate.js from submodule
S.src('.src/reslate/reslate.js');

// enable to see debug messages in Console.app
$.debug = true;

// slate.alias('hyper', 'ctrl;alt;cmd');
slate.alias('hyper', 'cmd;shift');
slate.alias('augment', 'ctrl');

// begin config
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

// bindings
slate.bindAll({

    hyper: {

        // Augment hyper shortcuts for more options
        augment: {

            // Edges
            h: [$('barResize', 'left',   3),
                $('center',    'left',   3, 3)],
            j: [$('barResize', 'bottom', 2),
                $('center',    'bottom', 3, 3)],
            k: [$('barResize', 'top',    2),
                $('center',    'top',    3, 3)],
            l: [$('barResize', 'right',  3),
                $('center',    'right',  3, 3)],

            // Corners
            y: [$('corner', 'top-left',     3, 2),
                $('corner', 'top-left',     3, 3)],
            i: [$('corner', 'top-right',    3, 2),
                $('corner', 'top-right',    3, 3)],
            b: [$('corner', 'bottom-left',  3, 2),
                $('corner', 'bottom-left',  3, 3)],
            m: [$('corner', 'bottom-right', 3, 2),
                $('corner', 'bottom-right', 3, 3)],

            // Centers
            u: [$('center', 'top'),
                $('center', 'top', 3, 3)],
            n: [$('center', 'bottom'),
                $('center', 'bottom', 3, 3)],
            'return': $('center', 'center', 1.25, 1.25)

        },


        // Bars
        h: [$('barResize', 'left',  2),
            $('barResize', 'left',  1.5)],
        j: $('barResize', 'bottom', 2),
        k: $('barResize', 'top',    2),
        l: [$('barResize', 'right', 2),
            $('barResize', 'right', 1.5)],
            'return': $('barResize', 'top', 1),

        // Corners
        y: [$('corner', 'top-left'),
            $('corner', 'top-left', 1.5)],
        i: [$('corner', 'top-right'),
            $('corner', 'top-right', 1.5)],
        b: [$('corner', 'bottom-left'),
            $('corner', 'bottom-left', 1.5)],
        m: [$('corner', 'bottom-right'),
            $('corner', 'bottom-right', 1.5)],

        // Centers
        u: $('center', 'top'),
        n: $('center', 'bottom'),

        // Throw to monitor
        '`': ['throw 0 resize', 'throw 1 resize'],
        '1': $('toss', '0', 'resize'),
        '2': $('toss', '1', 'resize'),
        '3': $('toss', '2', 'resize'),

        // Direct focus
        w: $.focus('Google Chrome'),
        c: $.focus('Messages'),
        d: $.focus('Dash'),
        t: $.focus('iTerm2'),
        f: $.focus('Finder'),
        a: $.focus('Airmail'),
        s: $.focus('Spotify'),
        r: $.focus('Reminders'),

        // Utility functions
        f1: 'relaunch',
        z: 'undo',
        tab: 'hint'

    },

    // Show Slate hints
    'esc:cmd': 'hint'

});
