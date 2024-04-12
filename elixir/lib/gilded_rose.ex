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
    item
      |> update_backstage_quality
      |> remove_a_seller
  end

  def update_item(item=%Item{name: @aged}) do
    item
      |> update_aged_quality
      |> remove_a_seller
  end

  def update_item(item=%Item{name: @sulfuras}) do
    item
  end

  def update_item(item) do
    item 
      |> update_standard_quality
      |> remove_a_seller
  end

  defp remove_a_seller(item=%Item{}) do
    %Item{item | sell_in: item.sell_in-1 }
  end


  defp update_backstage_quality(item) do
    cond do
      item.sell_in < 1                           ->
        %Item{item | quality: 0}

      item.quality > 49                          ->
        item

      item.quality == 49 or item.sell_in >= 11   ->
        %Item{item | quality: item.quality + 1}

      item.sell_in < 6                           ->
        %Item{item | quality: item.quality + 3}

      true                                       ->
        %Item{item | quality: item.quality + 2}
    end
  end

  defp update_aged_quality(item) do
    cond do
      item.quality < 49 and item.sell_in < 1     ->
        %{item | quality: item.quality + 2}

      item.quality < 50                          ->
        %Item{item | quality: item.quality + 1}

      true                                       ->
        item
    end
  end

  defp update_standard_quality(item) do
    cond do
      item.quality > 1 and item.sell_in < 1      ->
        %Item{item | quality: item.quality - 2 }

      item.quality > 0                           ->
        %Item{item | quality: item.quality - 1 }

      true                                       ->
        item
    end
  end
end
