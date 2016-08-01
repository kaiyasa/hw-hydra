

//var cliparse = require('minimist');
//var parser = require('./expr.js');
var parser = require('./hdl.js');

var text = process.argv.slice(2)[0];

try {
    console.log(parser.parse(text));
} catch (err) {
    console.dir(err);
}
//console.log(parser.parse(' 2 +	3 '));
