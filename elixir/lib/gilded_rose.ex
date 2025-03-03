defmodule GildedRose do
  # Example
  # update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 1}])
  # => [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 8, quality: 3}]


  @aged "Aged Brie"
  @backstage "Backstage passes to a TAFKAL80ETC concert"
  @sulfuras "Sulfuras, Hand of Ragnaros"

  @spec update_quality(list(%Item{})) :: list(%Item{})
  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  @spec update_item(%Item{}) :: %Item{}
  def update_item(item=%Item{name: name}) when name in [@aged, @backstage] do
    item
    |> update_quality_of_named_item
    |> remove_a_sell
  end
  def update_item(item=%Item{name: @sulfuras}) do
    item
  end
  def update_item(item) do
    item = case item do
      %Item{quality: quality} when quality <= 0 ->
        item
      %Item{}                                   ->
        %{item | quality: item.quality - 1}
    end
    item = remove_a_sell(item)
    update3(item)
  end

  @spec update_quality_of_named_item(%Item{}) :: %Item{}
  defp update_quality_of_named_item(item=%Item{name: @aged}) do
    cond do
      item.quality < 50 and item.quality < 49 and item.sell_in < 1->
        %Item{item | quality: item.quality + 2}
      item.quality < 50 ->
        %Item{item | quality: item.quality + 1}
      true ->
        item
    end
  end
  defp update_quality_of_named_item(item=%Item{name: @backstage}) do
    cond do
      item.sell_in < 1 ->
        %Item{item | quality: 0}
      item.quality < 49 and item.sell_in < 6 ->
        %Item{item | quality: item.quality + 3}
      item.quality < 49 and item.sell_in < 11 ->
        %Item{item | quality: item.quality + 2}
      item.quality <= 49 ->
        %Item{item | quality: item.quality + 1}
      true ->
        item
    end
  end
  @spec remove_a_sell(%Item{}) :: %Item{}
  defp remove_a_sell(item=%Item{}) do
    %Item{item | sell_in: item.sell_in - 1}
  end


  defp update3(item) do
    case item do
      %Item{sell_in: sell}                  when sell >= 0    ->
        item
      %Item{quality: quality}               when quality <= 0 ->
        item
      %Item{}                                                 ->
        %{item | quality: item.quality - 1}
    end
  end
end
