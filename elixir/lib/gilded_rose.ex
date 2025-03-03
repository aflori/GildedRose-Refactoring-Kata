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
  def update_item(item=%Item{name: @aged}) do

    item = cond do
      item.quality <= 49 ->
        %Item{item | quality: item.quality + 1}
      true ->
        item
    end

    item
    |> update2()
    |> update3()

  end
  def update_item(item) do
    item
    |> update1()
    |> update2()
    |> update3()
  end

  defp update1(item) do
    case item do
      %Item{name: @backstage, quality: quality} when quality == 49 ->
        %{item | quality: item.quality + 1}
      %Item{name: @backstage, sell_in: sell, quality: quality} when quality < 49 and sell < 6 ->
        %{item | quality: quality + 3}
      %Item{name: @backstage, sell_in: sell, quality: quality} when quality < 49 and sell < 11 ->
        %{item | quality: quality + 2}
      %Item{name: @backstage, quality: quality} when quality < 49->
        %{item | quality: quality + 1}
      %Item{name: @backstage} ->
        item
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
      %Item{name: @aged, quality: quality}  when quality < 50 ->
        %{item | quality: item.quality + 1}
      %Item{name: @aged}                                      ->
        item
      %Item{name: @backstage}                                 ->
        %{item | quality: 0}
      %Item{name: @sulfuras}                                  ->
        item
      %Item{quality: quality}               when quality <= 0 ->
        item
      %Item{}                                                 ->
        %{item | quality: item.quality - 1}
    end
  end
end
