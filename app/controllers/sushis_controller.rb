class SushiController < ApplicationController


  get '/' do
    erb :welcome
  end

  # INDEX ROUTE - SHOW ALL THE THINGS (SUSHI)
  # http verb get corresponds to the sinatra method get that we are invocing here
  # passing a block to indicate what we want to happen.

  # passing in an argument of our uri and a block. At the end of the block we are going to erb
  # or render a view. Thus any instance varable that was created can be availible in that view.
  get '/sushis' do
    # what happens?
    @sushis = Sushi.all
    # creating an instance varable and loading it up with all of the sushis
    # so the instance varable will be availible in a view when we erb or render to the index page
    # erb/redirect?
    # where do we go?
    erb :'/sushis/index'
  end


  # NEW ROUTE - RENDER THE FORM
  get '/sushis/new' do
    # what happens?
    # (nothing needs to happen)
    # erb/redirect?
    # where do we go?
    erb :'/sushis/new'
  end

  # SHOW ROUTE - SHOW ONE THING
  # this is a convintion for a show route
  # the id has to be something that is unique to every paticular instance of the model
  # dynamic route - a single part of multiple parts of it that is going to change
  # thus sinantra is going to take the dynamic part of the route and put it as a key in the params
  # hash. The value is the word or what ever that is typed by the user
  get '/sushis/:id' do
    #raise params.inspect
    # what happens?
    @sushi = Sushi.find(params[:id])
    # erb/redirect?
    # where do we go?
    erb :'/sushis/show'
  end


  #CREATE ACTION
  post '/sushis' do
    # what happens?
    # erb/redirect?
    # where do we go?
  end

end
