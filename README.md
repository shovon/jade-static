# jade-static

Serve static Jade templates from an Express server.

## Installing

It's an NPM package. You can just do the following.

    npm install jade-static

## Usage

Import it via node's require function.

    var jadeStatic = require('jade-static');

Then, you would simply add it as a `use`d middleware when you configure your Express server.

    var server = express();

    // You can watch just about any folder to serve the static Jade files.
    server.use(jadeStatic("#{__dirname}/public/"));

## Why?

HTML is great and all, but I got pretty tired of its angle brackets. Jade seemed to give me a break from it all. Therefore, I wrote a middleware for node servers running on Express.

## What it does

* Compiles JADE files on the fly.
* Serves `/path/index.jade` when `/path` is requested.
* Serves `/path/index.jade` when `/path/index.html` is requested.

## What it doesn't do

* No caching of any kind

## License

MIT