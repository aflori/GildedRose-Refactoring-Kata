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
        %Item{item | quality: 0} |> remove_a_seller
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

  defp remove_a_seller(item=%Item{}) do
    %Item{item | sell_in: item.sell_in-1 }
  end

  def update_item(item=%Item{name: @aged}) do
    cond do
      item.quality < 49 and item.sell_in < 1                    ->
        %{item | quality: item.quality + 2, sell_in: item.sell_in - 1}
      item.quality < 50                                         ->
        %Item{item | quality: item.quality + 1, sell_in: item.sell_in - 1}
      true                             ->
        %Item{item | sell_in: item.sell_in - 1}


    end
  end
  
  def update_item(item=%Item{name: @sulfuras}) do
    item
  end

  def update_item(item) do
   cond do
      item.quality > 1 and item.sell_in < 1                     ->
        %Item{item | quality: item.quality - 2, sell_in: item.sell_in - 1}
      item.quality > 0                                          ->
        %Item{item | quality: item.quality-1, sell_in: item.sell_in - 1}
      true                                                      ->
        %Item{item | sell_in: item.sell_in - 1}
    end
  end
end
