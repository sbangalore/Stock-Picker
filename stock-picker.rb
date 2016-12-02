def stock_picker(stock_prices)
    #error handling for no prices
    if not stock_prices.any?
        return "no prices"
    end
    #initial test
    max, min = stock_prices.max, stock_prices.min
    max_index, min_index = stock_prices.index(max), stock_prices.index(min)
    if max_index > min_index
        return [min_index, max_index]
    #second test... gets slow
    else
        maxdif = 0
        max_index, min_index = 0, 0
        stock_prices.each_with_index do |buy_price, buy_index|
            stock_prices[buy_index..stock_prices.length].each_with_index do |sell_price, sell_index|
                if (sell_price - buy_price) > maxdif
                    maxdif = sell_price - buy_price
                    max_index = sell_index + buy_index
                    min_index = buy_index
                end
            end
        end
        return [min_index, max_index]
    end
end

#test 1
puts stock_picker([1,3,5,8,7,9,2]).to_s #expect 0,5

#test 2
puts stock_picker([3,5,8,7,9,2]).to_s #expect 0,4

#test 3
puts stock_picker([10,3,4,5,6,3]).to_s #expect 1,4

#tests
puts stock_picker([17,3,6,9,15,8,6,1,10]).to_s #expect 1,4 
puts stock_picker([25,2,10,9]).to_s #expect 1,2
puts stock_picker([10,12,5,3,20,1,9,20]).to_s #expect 5,7
puts stock_picker([10,9,8,7,6]).to_s #expect 0,0
puts stock_picker([18,17,17,16,15]).to_s #expect 0,0
puts stock_picker([1]).to_s
puts stock_picker([]).to_s