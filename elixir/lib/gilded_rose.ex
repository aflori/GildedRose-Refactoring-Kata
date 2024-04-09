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
      %Item{quality: quality, name: ^backstage, sell_in: sell} when quality < 49 and sell < 6  ->
        %{item | quality: quality + 3, sell_in: sell - 1}
      %Item{quality: quality, name: ^backstage, sell_in: sell} when quality < 49 and sell < 11 ->
        %{item | quality: quality + 2, sell_in: sell - 1}
      %Item{quality: quality, name: ^backstage}                when quality < 50               ->
        %Item{item | quality: quality + 1, sell_in: item.sell_in - 1}
      %Item{name: ^backstage}                                                                  ->
        %Item{item | sell_in: item.sell_in - 1}

      %Item{name: ^aged, quality: quality}                     when quality < 50               ->
        %Item{item | quality: quality + 1, sell_in: item.sell_in - 1}
      %Item{name: ^aged}                                                                       ->
        %{item | sell_in: item.sell_in - 1}

      %Item{name: ^sulfuras}                                                                   ->
        item

      %Item{quality: quality} when quality > 0                                                 ->
        %{item | quality: quality-1, sell_in: item.sell_in - 1}

      _                                                                                        ->
        %Item{item | sell_in: item.sell_in - 1}
    end

    cond do
      item.sell_in < 0 ->
        cond do
          item.name != aged ->
            case item do
              %Item{name: ^backstage} ->
                %{item | quality: item.quality - item.quality}
              %Item{quality: quality, name: name} when quality > 0 and name != sulfuras->
                    %{item | quality: item.quality - 1}
              _ ->
                item
            end
          true ->
            cond do
              item.quality < 50 ->
                %{item | quality: item.quality + 1}
              true -> item
            end
        end
      true -> item
    end
  end
end
