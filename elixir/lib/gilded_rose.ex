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
      %Item{name: name, quality: quality} when name != aged and name != backstage and name != sulfuras and quality > 0->
        case item do
          %Item{quality: quality} when quality > 0 ->
            %{item | quality: quality-1 }
          _ ->
            item
        end
      %Item{name: name} when name != aged and name != backstage ->
        item
      _ ->
        case item do
          %Item{quality: quality, name: ^backstage, sell_in: sell} when quality < 49 and sell < 6 ->
            %{item | quality: quality + 3}
          %Item{quality: quality, name: ^backstage, sell_in: sell} when quality < 49 and sell < 11 ->
            %{item | quality: quality + 2}
          %Item{quality: quality} when quality < 50 ->
            %Item{item | quality: quality + 1}
          _ ->
            item
        end
    end
    item = cond do
      item.name != "Sulfuras, Hand of Ragnaros" ->
        %{item | sell_in: item.sell_in - 1}
      true -> item
    end
    cond do
      item.sell_in < 0 ->
        cond do
          item.name != "Aged Brie" ->
            cond do
              item.name != "Backstage passes to a TAFKAL80ETC concert" ->
                cond do
                  item.quality > 0 ->
                    cond do
                      item.name != "Sulfuras, Hand of Ragnaros" ->
                        %{item | quality: item.quality - 1}
                      true -> item
                    end
                  true -> item
                end
              true -> %{item | quality: item.quality - item.quality}
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
