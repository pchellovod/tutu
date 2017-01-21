module TrainsHelper
  def current_order_wagons(train)
    train.order_carriages ? train.carriages.head : train.carriages.tail
  end
end
