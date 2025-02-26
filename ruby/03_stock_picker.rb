# Return a pair of days representing the best day to buy and the best day to sell
# @param stock_prices [Array<integer>] Stock prices
# @return [Array<integer, integer>] Index of the best day to buy / Index of the est day to sell
def stock_picker(stock_prices)
  out = [0, 0]
  buy_index = 0
  stock_prices.reduce(0) do |biggest_profit, buy_price|
    sell_index = buy_index + 1
    stock_prices.last((stock_prices.length - 1) - buy_index).each do |sell_price|
      profit = sell_price - buy_price
      if profit > biggest_profit
        biggest_profit = profit
        out = [buy_index, sell_index]
      end
      sell_index += 1
    end
    buy_index += 1
    biggest_profit
  end
  out
end

print stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# => [1,4]  # for a profit of $15 - $3 == $12
