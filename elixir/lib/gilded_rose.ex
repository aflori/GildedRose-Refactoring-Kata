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
  def update_item(item=%Item{name: @aged}) do
    item
    |> update_aged_quality
    |> remove_a_sell
  end
  def update_item(item=%Item{name: @backstage}) do
    item = case item do
      %Item{sell_in: sell, quality: quality} when quality < 49 and sell < 6 and sell >= 1 ->
        %{item | quality: quality + 3}
      %Item{sell_in: sell, quality: quality} when quality < 49 and sell < 11 ->
        %{item | quality: quality + 2}
      %Item{quality: quality} when quality <= 49 ->
        %{item | quality: item.quality + 1}
      %Item{} ->
        item
    end

    cond do
      item.sell_in >= 1    ->
        %Item{item | sell_in: item.sell_in - 1}
      true                 ->
        %Item{item | quality: 0, sell_in: item.sell_in - 1}
    end
  end
  def update_item(item) do
    item
    |> update1()
    |> update2()
    |> update3()
  end

  @spec update_item(%Item{}) :: %Item{}
  defp update_aged_quality(item=%Item{name: @aged}) do
    cond do
      item.quality < 50 and item.quality < 49 and item.sell_in < 1->
        %Item{item | quality: item.quality + 2}
      item.quality < 50 ->
        %Item{item | quality: item.quality + 1}
      true ->
        item
    end
  end
  @spec update_item(%Item{}) :: %Item{}
  defp remove_a_sell(item=%Item{}) do
    %Item{item | sell_in: item.sell_in - 1}
  end


  defp update1(item) do
    case item do
      %Item{name: @sulfuras, quality: quality} when quality <= 0 ->
        item
      %Item{name: @sulfuras}                    ->
        item
      %Item{quality: quality} when quality <= 0 ->
        item
      %Item{}                                   ->
        %{item | quality: item.quality - 1}
    end
  end
  defp update2(item) do
    case item do
      %Item{name: @sulfuras} ->
        item
      _ ->
        %Item{item | sell_in: item.sell_in - 1}
    end
  end
  defp update3(item) do
    case item do
      %Item{sell_in: sell}                  when sell >= 0    ->
        item
      %Item{name: @sulfuras}                                  ->
        item
      %Item{quality: quality}               when quality <= 0 ->
        item
      %Item{}                                                 ->
        %{item | quality: item.quality - 1}
    end
  end
end
