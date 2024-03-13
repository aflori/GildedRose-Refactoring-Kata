defmodule GildedRoseTest do
  use ExUnit.Case

  test "begin the journey of refactoring" do
    items = [%Item{name: "foo", sell_in: 0, quality: 0}]
    items = GildedRose.update_quality(items)
    %{name: firstItemName} = List.first(items)
    assert "foo" == firstItemName
  end

  test "empty list" do
    items = []
    items = GildedRose.update_quality(items)

    assert [] == items
  end

  test "foo bar test" do
    items = [%Item{name: "foo", sell_in: 8, quality: 1}, %Item{name: "bar", sell_in: 3, quality: 0}]
    items = GildedRose.update_quality(items)

    assert [%Item{name: "foo", quality: 0, sell_in: 7}, %Item{name: "bar", quality: 0, sell_in: 2}] == items
  end
end
