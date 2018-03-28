require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order.rb')


# index
get "/pizza_orders" do
  @orders = PizzaOrder.all()
  erb(:index)
end

#new order
get "/pizza_orders/new" do
  erb(:new)
end


#show single pizza order. Remember this needs to go below pizza_orders/new, because the :id is the parameter and the code will think that new is an id.


#create pizza order
post "/pizza_orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#edit
get "/pizza_orders/:id/edit" do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:edit)
end

#update
post "/pizza_orders/:id" do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect to '/pizza_orders'
end

post "/pizza_orders/:id/delete" do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete()
  redirect to '/pizza_orders'
end

get "/pizza_orders/:id" do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:show)
end
