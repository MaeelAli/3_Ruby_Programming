def stock_picker(stock_prices)

  #initialize best buy and sell hashs             
  best_buy = {"date" => 0, "price" => stock_prices[0]}
  best_sell = {"date" => 0, "price" => 0}
 	
 	# for each day in stock prices array
  stock_prices.each_with_index do |buy_price, buy_day|

  	# only if the current buy price <= your best buying price then
    if buy_price <= best_buy["price"]

    	# for each day after current day, check that selling with this price would give better profit then best_profit, if so update best buy and sell date.
      stock_prices[(buy_day+1)..-1].each_with_index do |sell_price, sell_day|
        if (sell_price - buy_price) > (best_sell["price"] - best_buy["price"])
            best_sell["price"] = sell_price
            best_sell["date"] = sell_day + buy_day + 1
            best_buy["price"] = buy_price
      			best_buy["date"] = buy_day
        end
        # puts "buy: #{buy_price} - #{buy_day} | sell: #{sell_price} - #{sell_day + buy_day} | curr_profit: #{sell_price - buy_price} | best_profit: #{best_sell["price"] - best_buy["price"]} "
      end                                
    end        
  end

  timing = [best_buy["date"], best_sell["date"]]
  puts "For #{stock_prices}, the best time to buy and sell is: [#{timing[0]}, #{timing[1]}] to earn $#{best_sell["price"] - best_buy["price"]}"
end
 
stock_picker([17,3,6,9,15,8,6,1,10])  #[1,4]
stock_picker([1,2,3,4,5,6,7,8,9]) 		#[0,8]
stock_picker([20,19,17,10,5,1]) 			#[0,1]