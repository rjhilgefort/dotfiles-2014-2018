#!/usr/bin/env node

var shell = require('shelljs'),
    program = require('commander'),
    _ = require('lodash'),
    colors = require('colors'),
    inquirer = require('inquirer');

var source, dest, projectFiles, special, blacklist;

program
    .version('0.0.1')
    .usage("[options]")
    .option("-e, --existing [move]", "Handle existing directories as overwrite/[move]/skip", 'move')
    .parse(process.argv);

// Handle options
if (!_.contains(['overwrite', 'move', 'skip'], program.existing)) {
    program.existing = 'move';
}


// Make sure submodules are installed
// shell.exec('git submodule update --init --recursive');


///////////////////////////////////////////////////////////////////////////////
// Link base16-vim schemes to .vim dir
///////////////////////////////////////////////////////////////////////////////

if (false) {
    source = __dirname + '/.src/base16-vim/colors/';
    dest = __dirname + '/.vim/colors/';

    _.forEach(shell.ls(source), function(scheme) {
        shell.ln('-sf', source + scheme, dest + scheme);
    });
}

///////////////////////////////////////////////////////////////////////////////
// .prezto prompt installs
///////////////////////////////////////////////////////////////////////////////

source = __dirname + '/.zprezto/modules/prompt/external/';
dest = __dirname + '/.zprezto/modules/prompt/functions/';

/*
// TODO: This would be ideal, but we'll just hardcode the installs for now
shell.ls(source).forEach(function(repo) {
    repo = source + repo;
});
*/

// pure
// shell.ln('-sf', source + 'pure/pure.zsh', dest + 'prompt_pure_setup');


///////////////////////////////////////////////////////////////////////////////
// Link items at root of dotfiles project
///////////////////////////////////////////////////////////////////////////////

shell.cd(__dirname);

projectFiles = [
    '.git', '.gitignore', '.gitmodules', 'TODO.md', 'README.md',
    'install.js', 'node_modules', 'package.json', 'npm-debug.log'
];
special = ['.karabiner', '.spacemacs'];
blacklist = _.union(projectFiles, special);

_.forEach(shell.ls('-A'), function(toLink) {
    var newHome = shell.env.HOME + "/" + toLink;
    var ln = function() {
        shell.ln('-sf', toLink, newHome);
    };
    var existingStatus = function(status) {
        shell.echo("Existing target found, '" + status + "' applied to: " + newHome);
    };

    // Skip iteration if in blacklist
    if (_.contains(blacklist, toLink)) return true;

    // Go ahead and link if nothing exists at `newHome`
    if (shell.test('-f', newHome) || shell.test('-L', newHome)) {
        ln();
        return true;
    }

    // Handle existing `newHome` directories
    switch (program.existing) {

        case 'overwrite':
            shell.rm('-rf', newHome);
            ln();
            break;

        case 'move':
            shell.mv('-f', newHome, newHome + "__");
            ln();
            break;

        case 'skip':
            break;

    }
    existingStatus(program.existing);
});


///////////////////////////////////////////////////////////////////////////////
// Handle special configuration items
///////////////////////////////////////////////////////////////////////////////

shell.cd(__dirname);

// Link Karabiner config xml
karabinerDir = shell.env.HOME + "/Library/Application\ Support/Karabiner";
if (shell.test('-d', karabinerDir)) {
    shell.ln('-sf', ".karabiner/private.xml", karabinerDir + "/private.xml");
}

// Link spacemacs
shell.ln('-sf', ".spacemacs/.spacemacs", shell.env.HOME + "/.spacemacs");
shell.ln('-sf', ".spacemacs/rjhilgefort", shell.env.HOME + "/.emacs.d/private/rjhilgefort");
shell.ln('-sf', ".spacemacs/rjhilgefort/.mc-lists.el", shell.env.HOME + "/.emacs.d/.mc-lists.el");

// Link adobe scripts if installed
photoshopDir = "/Applications/Adobe Photoshop CS6/Presets/Scripts";
if (shell.test('-d', photoshopDir)) {
    // TODO: loop over this directory and link all
    shell.ln('-sf', ".adobe_photoshop/BatchCropAndStriaghten.jsx", photoshopDir + "/BatchCropAndStriaghten.jsx");
}

///////////////////////////////////////////////////////////////////////////////
// Other commands that need to be run
///////////////////////////////////////////////////////////////////////////////

// Make sure we're using zsh
shell.exec('chsh -s /bin/zsh');
