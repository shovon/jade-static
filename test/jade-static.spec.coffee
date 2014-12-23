express = require 'express'
supertest = require 'supertest'
jadeStatic = require '../src/jade-static'

describe 'jade-static', ->
  request = null

  before ->
    app = express()
    app.use '/mount', jadeStatic "#{__dirname}/public"
    request = supertest app

  it 'serves index.jade from folder', (done) ->
    request
      .get '/mount'
      .expect 200
      .expect '<div class="hello">World!</div>', done

  it 'serves index.jade', (done) ->
    request
      .get '/mount/index.jade'
      .expect 200
      .expect '<div class="hello">World!</div>', done

  it 'serves index.html', (done) ->
    request
      .get '/mount/index.html'
      .expect 200
      .expect '<div class="hello">World!</div>', done

  it 'handles 404s', (done) ->
    request
      .get '/mount/missing-file.jade'
      .expect 404, done
