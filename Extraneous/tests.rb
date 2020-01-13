def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  result = []
  for cart_item in cart do
    no_match = true
    for result_item in result do
      if cart_item[:item] == result_item[:item] && cart_item[:price] == result_item[:price]
        no_match = false
        result_item[:count] += 1
      end
    end
    if no_match
      cart_item[:count] = 1
      result.push(cart_item)
    end
    
  end
  result
end

cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE", :price => 3.00, :clearance => false}
]

consolidate_cart(cart)