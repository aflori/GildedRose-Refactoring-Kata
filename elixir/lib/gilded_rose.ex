defmodule GildedRose do
  # Example
  # update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 1}])
  # => [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 8, quality: 3}]


  @sulfuras "Sulfuras, Hand of Ragnaros"
  @backstage "Backstage passes to a TAFKAL80ETC concert"
  @aged "Aged Brie"

  @spec update_quality(list(%Item{})) :: list(%Item{})
  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  @spec update_item(%Item{}) :: %Item{}
  def update_item(item) do
    item = cond do
      item.name != ConstantName.aged() && item.name != ConstantName.backstage() ->
        if item.quality > 0 do
          if item.name != ConstantName.sulfuras() do
            %{item | quality: item.quality - 1}
          else
            item
          end
        else
          item
        end
      true ->
        cond do
          item.quality < 50 ->
            item = %{item | quality: item.quality + 1}
            cond do
              item.name == ConstantName.backstage() ->
                item = cond do
                  item.sell_in < 11 ->
                    cond do
                      item.quality < 50 ->
                        %{item | quality: item.quality + 1}
                      true -> item
                    end
                  true -> item
                end
                cond do
                  item.sell_in < 6 ->
                    cond do
                      item.quality < 50 ->
                        %{item | quality: item.quality + 1}
                      true -> item
                    end
                  true -> item
                end
              true -> item
            end
          true -> item
        end
    end
    item = cond do
      item.name != ConstantName.sulfuras() ->
        %{item | sell_in: item.sell_in - 1}
      true -> item
    end
    cond do
      item.sell_in < 0 ->
        case item do
          %Item{name: @aged} ->
            case item do
              %Item{quality: quality} when quality < 50 ->
                %{item | quality: item.quality + 1}
              %Item{} ->
                item
            end
          _ ->
            case item do
              %Item{name: @backstage}                   ->
                %{item | quality: 0}
              %Item{quality: quality} when quality <= 0 ->
                item
              %Item{name: @sulfuras}                    ->
                item
              %Item{quality: quality}                   ->
                %{item | quality: quality - 1}
            end
        end
      true -> item
    end
  end
end
