defmodule GildedRose do
  # Example
  # update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 1}])
  # => [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 8, quality: 3}]
  @aged ConstantName.aged()
  @backstage ConstantName.backstage()
  @sulfuras ConstantName.sulfuras()

  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(item=%Item{name: @backstage}) do
    cond do
      item.quality < 49 and item.sell_in < 1                    ->
        %Item{item | quality: 0, sell_in: item.sell_in - 1}
      item.quality < 49 and item.sell_in < 6                    ->
        %Item{item | quality: item.quality + 3, sell_in: item.sell_in - 1}
      item.quality < 49 and item.sell_in < 11                   ->
        %Item{item | quality: item.quality + 2, sell_in: item.sell_in - 1}
      item.quality < 50 and item.sell_in < 1                    ->
        %Item{item | quality: 0, sell_in: item.sell_in - 1}
      item.quality < 50                                         ->
        %Item{item | quality: item.quality + 1, sell_in: item.sell_in - 1}
      item.sell_in < 1                                          ->
        %Item{item | quality: 0, sell_in: item.sell_in-1}
      true                                                      ->
        %Item{item | sell_in: item.sell_in - 1}

   end
    
  end
  def update_item(item) do
    case item do
      %Item{name: @aged, quality: quality, sell_in: sell}      when quality < 49 and sell < 1   ->
        %{item | quality: quality + 2, sell_in: item.sell_in - 1}
      %Item{name: @aged, quality: quality}                     when quality < 50                ->
        %Item{item | quality: quality + 1, sell_in: item.sell_in - 1}
      %Item{name: @aged}                                                                        ->
        %Item{item | sell_in: item.sell_in - 1}

      %Item{name: @sulfuras}                                                                    ->
        item

      %Item{quality: quality, sell_in: sell}                   when quality > 1 and sell < 1    ->
        %Item{item | quality: quality - 2, sell_in: sell-1}
      %Item{quality: quality, sell_in: sell}                   when quality > 0                 ->
        %Item{item | quality: quality-1, sell_in: sell - 1}
      _                                                                                         ->
        %Item{item | sell_in: item.sell_in - 1}
    end
  end
end
