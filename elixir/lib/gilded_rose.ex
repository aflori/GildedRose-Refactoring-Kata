defmodule GildedRose do
  @aged "Aged Brie"
  @backstage "Backstage passes to a TAFKAL80ETC concert"
  @sulfuras "Sulfuras, Hand of Ragnaros"

  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(item) do
    item |> update_quality_by_name_and_selling |> update_selling_by_name |> update_quality_by_selling
  end

  defp update_quality_by_name_and_selling(item) do
    case {item.name, item.quality} do
      {@aged, quality} when quality>=50 ->       item
      {@backstage, quality} when quality>=50 ->  item
      {@sulfuras, _} ->                          item
      {@aged, quality} ->                        %{ item | quality: quality+1 }
      {@backstage, quality} when quality==49 ->  %{ item | quality: 50}
      {@backstage, _quality} ->                   update_backstage_name_quantity_by_selling(item)
      {_other_name, quality} when quality>0 ->   %{item | quality: quality-1}
      {_other_name, _quality} ->                 item
    end
  end
  defp update_backstage_name_quantity_by_selling(item) do
    cond do
      item.sell_in < 6 ->  %{item | quality: item.quality+3}
      item.sell_in < 11 -> %{item | quality: item.quality+2}
      true ->              %{item | quality: item.quality+1}
    end
  end
  defp update_selling_by_name(item) do
     case item.name do
         @sulfuras ->  item
         _name ->      %{item | sell_in: item.sell_in - 1}
    end
  end

  defp update_quality_by_selling(item) when item.sell_in >= 0 do
    item
  end
  defp update_quality_by_selling(item) do
    case {item.name, item.quality} do
      {@aged, quality} when quality < 50 ->       %{item | quality: quality+1}
      {@aged, _quality} ->                        item
      {@backstage, _quality} ->                   %{item | quality: 0}
      {@sulfuras, _quality} ->                    item
      {_other_name, quality} when quality > 0 ->  %{item | quality: quality - 1}
      {_other_name, _quality} ->                  item
    end
  end
end
