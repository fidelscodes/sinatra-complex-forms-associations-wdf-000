class OwnersController < ApplicationController

  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index'
  end

  get '/owners/new' do
    erb :'/owners/new'
  end

  post '/owners' do
    # Create a new owner using mass assignment
    # ActiveRecord takes care of finding the appropriate pets from the pets_id array
    # using the id's in params[:owner][:pets_id] and making the right associations
    @owner = Owner.create(params[:owner])

    # If pet's name isn't an empty string, create a new Pet instance
    # and add it to the owner's pets collection
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end

    @owner.save
    redirect to "owners/#{@owner.id}"
  end

  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  post '/owners/:id' do

  end
end
