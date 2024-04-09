defmodule GildedRose do
  # Example
  # update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 1}])
  # => [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 8, quality: 3}]

  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(item) do
    sulfuras = ConstantName.sulfuras
    backstage = ConstantName.backstage
    aged = ConstantName.aged

    item = case item do
      %Item{name: ^backstage, quality: quality, sell_in: sell} when quality < 49 and sell < 6  ->
        %{item | quality: quality + 3, sell_in: sell - 1}
      %Item{name: ^backstage, quality: quality, sell_in: sell} when quality < 49 and sell < 11 ->
        %{item | quality: quality + 2, sell_in: sell - 1}
      %Item{name: ^backstage, quality: quality}                when quality < 50               ->
        %Item{item | quality: quality + 1, sell_in: item.sell_in - 1}
      %Item{name: ^backstage}                                                                  ->
        %Item{item | sell_in: item.sell_in - 1}

      %Item{name: ^aged, quality: quality, sell_in: sell}      when quality < 50 and quality < 49 and sell < 1 ->
        %{item | quality: quality + 2, sell_in: item.sell_in - 1}
      %Item{name: ^aged, quality: quality}                     when quality < 50               ->
        %Item{item | quality: quality + 1, sell_in: item.sell_in - 1}
      %Item{name: ^aged}                                                                       ->

        item2 = %{item | sell_in: item.sell_in - 1}
        case item2 do
          %Item{name: ^aged, quality: quality2, sell_in: sell2} when item.quality < 50 and sell2 < 0 ->
            %{item2 | quality: item.quality + 1}
          %Item{name: ^aged} ->
            %Item{item | sell_in: item.sell_in - 1}
        end

      %Item{name: ^sulfuras}                                                                   ->
        item

      %Item{quality: quality} when quality > 0                                                 ->
        %{item | quality: quality-1, sell_in: item.sell_in - 1}

      _                                                                                        ->
        %Item{item | sell_in: item.sell_in - 1}
    end

    case item do

      #%Item{name: ^aged, quality: quality, sell_in: sell} when (quality-1) < 49 and sell < 0 ->
      #  %{item | quality: (quality-1) + 2}
      %Item{name: ^aged} ->
        item

      %Item{name: ^backstage, sell_in: sell} when sell < 0 ->
        %{item | quality: item.quality - item.quality}

      %Item{name: ^sulfuras, sell_in: sell} when sell < 0 ->
        item

      %Item{quality: quality, sell_in: sell} when quality > 0 and sell < 0 ->
        %{item | quality: item.quality - 1}
      _ ->
        item
    end
  end
end
