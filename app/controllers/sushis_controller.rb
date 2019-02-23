class SushiController < ApplicationController
  # NOTE - instance varables inside of a block is only availible inside that
  # block and is destroyed when a redirect occur(because we are going to a different
  # block). BUTTT an instance varable
  # is not deleted when at that block a template is being rendered

  get '/' do
    erb :welcome
  end

  # INDEX ROUTE - SHOW ALL THE THINGS (SUSHI) // read action
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


  # NEW ROUTE - RENDER THE FORM // create action
  get '/sushis/new' do
    # what happens?
    # (nothing needs to happen)
    # erb/redirect?
    # where do we go?
    erb :'/sushis/new'
  end

  #CREATE ACTION // create action - this is the action that recieves the form
  post '/sushis' do # job of this is to take information and create a
                    # new resource
    # what happens?
    # we need to use the incoming form info to
    # create a new sushi roll!
    @sushi = Sushi.create(params)
    #binding.pry
    # erb/redirect?
    # where do we go?
    redirect "/sushis/#{@sushi.id}"
    # we should send a new http request and send it to the action whos job is to
    # show this thing
  end

  # SHOW ROUTE - SHOW ONE THING // read action
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

  # what is the restful convention for building a route to render an edit form
  # we need an http verb get which corisponds with our sinatra method (get)
  # need to know what type of resource - /sushis/
  # need to have a paticular resource - :id
  # and I am editing it (the resource in question(:id))
  get '/sushis/:id/edit' do
    # what happens?
    @sushi = Sushi.find(params[:id])
    # erb/redirect?
    # where do we go?
    erb :'/sushis/edit'
  end

  patch '/sushis/:id' do
    # what happens?
    # we need to use the incoming form info to
    # edit an existing sushi roll!
    @sushi = Sushi.find(params[:id])
    @sushi.update(name: params[:name], price: params[:price], description: params[:description])
    #binding.pry
    # erb/redirect?
    # where do we go?
    redirect "/sushis/#{@sushi.id}"
    # we should send a new http request and send it to the action whos job is to
    # show this thing
  end

  delete '/sushis/:id' do
    @sushi = Sushi.find(params[:id])
    @sushi.destroy

    redirect '/sushis'
  end

end
