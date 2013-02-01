path = require 'path'
fs = require 'fs'
jade = require 'jade'

module.exports = (options) ->
    if not options?
        throw new Error("A path must be specified.")

    if typeof options is 'string'
        options = {src: options}

    # The actual middleware itself.
    return (req, res, next) ->

        # The inputed url relative to the path.
        d = path.join options.src, req.url

        # Determines what d is.
        fs.lstat d, (err, stats) ->

            # is it a directory?
            if not err? and stats.isDirectory()

                # If so, check if there is exists a file called index.jade.
                fs.lstat "#{d}/index.jade", (err, stats) ->

                    # If it exists, then we got ourselves a jade file.
                    if not err? and stats.isFile()

                        # Read the jade file.
                        fs.readFile "#{d}/index.jade", 'utf8', (err, data) ->

                            # Anything screws up, then move on.
                            if err?
                                next()
                                return
                            
                            res.send jade.compile(data, {})({}), { 'Content-Type': 'text/html' }, 200

                            return 
                    else
                        next()
                        return

            else if not err? and stats.isFile() and path.extname(d) is '.jade'
                fs.readFile d, 'utf8', (err, data) ->
                    if err?
                        next()
                        return

                    res.send jade.compile(data, {})({}), { 'Content-Type': 'text/html' }, 200

                    return 

            else
                next()
                return
