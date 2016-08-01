require 'spec_helper'
require 'factory_girl_rails'

Rails.application.routes.draw do
  resources :items
  resources :orders
  resources :messages
  resources :users
  resources :todos
  resources :rental_units
  get 'profiles/donors', :to => 'profiles#donor_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

#GET

describe OrdersController do
 it 'retrieves a specific order' do
    #order = FactoryGirl.create(:order)    
    get :show, id: 46
	json = JSON.parse(response.body)
    # test for the 200 status-code
    expect(response).to be_success

    # check that the message attributes are the same.
    expect(json.first['id']).to eq(46) 
    #Rails.logger.debug("debug::" + json['id'].first)
    # ensure that private attributes aren't serialized
   # expect(json['private_attr']).to eq(nil)
  end
end


#POST

RSpec.describe OrdersController do
 it 'post a specific order' do
    #order = FactoryGirl.create(:order)  
     
    post '/orders', :order => {:name => "My Widget"}
	
    # test for the 200 status-code
    json = JSON.parse(response.body)
    expect(response).to be_success

    # check that the message attributes are the same.
    expect(json.first['id']).to eq(46) 
    #Rails.logger.debug("debug::" + json['id'].first)
    # ensure that private attributes aren't serialized
   # expect(json['private_attr']).to eq(nil)
  end
end