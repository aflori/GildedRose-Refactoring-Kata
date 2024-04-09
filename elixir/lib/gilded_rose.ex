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

    item = cond do
      item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" ->
        case item do
          %Item{name: name, quality: quality} when quality > 0 and name != sulfuras ->
            %{item | quality: quality-1 }
          _ ->
            item
        end
      true ->
        case item do
          %Item{quality: quality} when quality < 50 ->
            item = %{item | quality: quality + 1}
            case item do
              %Item{name: ^backstage, quality: quality_bis, sell_in: sell} when quality < 49 and sell < 6 ->
                %{item | quality: quality + 3}
              %Item{name: ^backstage, quality: quality_bis, sell_in: sell} when quality < 49 and sell < 11 ->
                %{item | quality: quality + 2}
              _ -> item
            end
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
