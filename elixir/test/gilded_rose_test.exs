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

  test "classical name test" do
    # need test with 
    # - positive or negative quality,
    # - sell_in positive, null or negative
    # - quality when positive with negative quality, null or negative quali with negative selling
    items = [
      %Item{name: "A", sell_in:  8, quality:  8},
      %Item{name: "B", sell_in:  8, quality: -8},
      %Item{name: "C", sell_in: -8, quality: -8},
      %Item{name: "D", sell_in: -8, quality:  8},
      %Item{name: "E", sell_in:  8, quality:  0},
      %Item{name: "F", sell_in: -8, quality:  0},
      %Item{name: "G", sell_in:  0, quality: -8},
      %Item{name: "H", sell_in:  0, quality:  8},
      %Item{name: "D", sell_in:  0, quality:  0},
    ]
    items = GildedRose.update_quality(items)

    assert items == [
      %Item{name: "A", quality:  7, sell_in: 7 },
      %Item{name: "B", quality: -8, sell_in: 7 },
      %Item{name: "C", sell_in: -9, quality: -8},
      %Item{name: "D", sell_in: -9, quality: 6 },
      %Item{name: "E", sell_in:  7, quality:  0},
      %Item{name: "F", sell_in: -9, quality:  0},
      %Item{name: "G", quality: -8, sell_in: -1},
      %Item{name: "H", sell_in: -1, quality:  6},
      %Item{name: "D", sell_in: -1, quality:  0},
    ]
  end
end
