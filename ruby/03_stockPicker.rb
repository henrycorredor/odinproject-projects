# Return a pair of days representing the best day to buy and the best day to sell
# @param stock_prices [Array<integer>] Stock prices
# @return [Array<integer, integer>] Index of the best day to buy / Index of the est day to sell
def stock_picker(stock_prices)
  out = [0,0]
  biggest = stock_prices[0]
  smallest = stock_prices[0]

  stock_prices.each do |price|
    if price > biggest
      biggest = price
    end
    if price < smallest
      smallest = price
    end
  end

  out
end
#   stock_prices.reduce([stock_prices[0], stock_prices[0]]) do |sum, price|
#     actual_buy = sum[0]
#     actual_sell = sum[1]
#     if(prive <)
#   end
# end


# > stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12
