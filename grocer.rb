def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  for thing in collection do
    if thing[:item] == name
      return thing
    end
  end
  return nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  result = []
  for cart_item in cart do
    no_match = true
    for result_item in result do
      if cart_item[:item] == result_item[:item]
        no_match = false
        result_item[:count] += 1
        break
      end
    end
    if no_match
      cart_item[:count] = 1
      result.push(cart_item)
    end
  end
  result
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  for coupon_item in coupons do
    for cart_item in cart do
      if coupon_item[:item] == cart_item[:item]
        cart_item[:count] -= coupon_item[:num]
        cart.push({
          :item => coupon_item[:item] + " W/COUPON",
          :price => coupon_item[:cost] / coupon_item[:num],
          :clearance => cart_item[:clearance],
          :count => coupon_item[:num]
          })
      end
    end
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  for cart_item in cart do
    if cart_item[:clearance]
      cart_item[:price] = (cart_item[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  grand_total = 0
  
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  
  for cart_item in cart do
    grand_total += cart_item[:price] * cart_item[:count]
  end
  
  grand_total * (1 - 0.1 * (grand_total >))
end
