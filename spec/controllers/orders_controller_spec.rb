require 'rails_helper'

RSpec.describe OrdersController, type: :controller do


	 # This should return the minimal set of attributes required to create a valid
  # order. As you add validations to order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
   # skip("Add a hash of attributes valid for your model")
   {  location: "takeAway",
      status: "preparing",
    items_attributes: [
      {
         
        name: "coffee",
        quantity: 1,
        milk: "whole",
        size: "small"
      }
    ]
  }
}
  

  let(:invalid_attributes) {
    #skip("Add a hash of attributes invalid for your model")
    {  #location: "takeAway",
      status: "preparing",
    items_attributes: [
      {
         
        name: "coffee",
        quantity: 1,
        milk: "whole",
        size: "small"
      }
    ]
  }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ordersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all orders as @orders" do
      order = Order.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :show, params: {id: order.to_param}, session: valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

 

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, params: {order: valid_attributes}, session: valid_session
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, params: {order: valid_attributes}, session: valid_session
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      # it "redirects to the created order" do
      #   post :create, params: {order: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(order.last)
      # end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        post :create, params: {order: invalid_attributes}, session: valid_session
        expect(assigns(:order)).to be_a_new(Order)
      end

      # it "re-renders the 'new' template" do
      #   post :create, params: {order: invalid_attributes}, session: valid_session
      #   expect(response).to render_template("new")
      # end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
      #  skip("Add a hash of attributes valid for your model")
       {  location: "HomeDelivery",
      status: "preparing",
    items_attributes: [
      {
         
        name: "coffee",
        quantity: 1,
        milk: "whole",
        size: "small"
      }
    ]
  }
      }

      it "updates the requested order" do
        order = Order.create! valid_attributes
        put :update, params: {id: order.to_param, order: new_attributes}, session: valid_session
        order.reload
        get :show, params: {id: order.to_param}, session: valid_session
        expect(assigns(:order)).to eq(order)
      end

      it "assigns the requested order as @order" do
        order = Order.create! valid_attributes
        put :update, params: {id: order.to_param, order: valid_attributes}, session: valid_session
        expect(assigns(:order)).to eq(order)
      end

      # it "redirects to the order" do
      #   order = order.create! valid_attributes
      #   put :update, params: {id: order.to_param, order: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(order)
      # end
    end

    context "with invalid params" do
      it "assigns the order as @order" do
        order = Order.create! valid_attributes
        put :update, params: {id: order.to_param, order: invalid_attributes}, session: valid_session
        expect(assigns(:order)).to eq(order)
      end

      # it "re-renders the 'edit' template" do
      #   order = order.create! valid_attributes
      #   put :update, params: {id: order.to_param, order: invalid_attributes}, session: valid_session
      #   expect(response).to render_template("edit")
      # end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete :destroy, params: {id: order.to_param}, session: valid_session
      }.to change(Order, :count).by(-1)
    end

    # it "redirects to the orders list" do
    #   order = order.create! valid_attributes
    #   delete :destroy, params: {id: order.to_param}, session: valid_session
    #   expect(response).to redirect_to(orders_url)
    # end
  end

end
