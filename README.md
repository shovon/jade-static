# jade-static

Serve static Jade templates from an Express server.

## Usage

Import it via node's require function.

    jadeStatic = require 'jade-static'

Then, you would simply add it as a `use`d middleware when you configure your Express server.

    server = express.createServer()

    # You can watch just about any folder to serve the static Jade files.
    server.use jadeStatic "#{__dirname}/public/"

## Installing

It's an NPM package. You can just do the following.

    $ npm install jade-static

Or, you can install it globally as well.
    
    # Might require you to be root.
    $ npm install -g jade-static

## Why?

HTML is great and all, but I got pretty tired of its angle brackets. Jade seemed to give me a break from it all. Therefore, I wrote a middleware for node servers running on Express.
