defmodule GildedRoseTest do
  use ExUnit.Case, async: true

  @moduledoc """
  Le module sert à tester les différentes entrées fr module principale gilded_rose.
  Les données testés sont toutes de type %Item{} contenant 3 attributs:
    - :name     -> only ConstantName.aged, ConstantName.sulfuras, ConstantName.backstage are breakpoint (other name all have the same comportment)
    - :quality -> breakpoint value are 0, 50
    - :sell_in  -> breakpoint value are 0, 6, 11

  Comme cela implique 4×5×7 tests je vais les regrouper par valeurs de :sell_in
  note that other breakpoint value (found during refacto will have their own test)
  """

  test "sell in negative" do
    items = [
      %Item{name: ConstantName.aged, quality: -5, sell_in: -2},
      %Item{name: ConstantName.aged, quality: 0, sell_in: -2},
      %Item{name: ConstantName.aged, quality: 12, sell_in: -2},
      %Item{name: ConstantName.aged, quality: 50, sell_in: -2},
      %Item{name: ConstantName.aged, quality: 152, sell_in: -2},
      %Item{name: ConstantName.backstage, quality: -5, sell_in: -2},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: -2},
      %Item{name: ConstantName.backstage, quality: 12, sell_in: -2},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: -2},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: -2},
      %Item{name: "A", quality: -5, sell_in: -2},
      %Item{name: "B", quality: 0, sell_in: -2},
      %Item{name: "C", quality: 12, sell_in: -2},
      %Item{name: "D", quality: 50, sell_in: -2},
      %Item{name: "E", quality: 152, sell_in: -2},
    ]
    expected = [
      %Item{name: ConstantName.aged, quality: -3, sell_in: -3},
      %Item{name: ConstantName.aged, quality: 2, sell_in: -3},
      %Item{name: ConstantName.aged, quality: 14, sell_in: -3},
      %Item{name: ConstantName.aged, quality: 50, sell_in: -3},
      %Item{name: ConstantName.aged, quality: 152, sell_in: -3},
      %Item{name: ConstantName.backstage, sell_in: -3, quality: 0},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: -3},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: -3},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: -3},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: -3},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: -2},
      %Item{name: "A", quality: -5, sell_in: -3},
      %Item{name: "B", quality: 0, sell_in: -3},
      %Item{name: "C", quality: 10, sell_in: -3},
      %Item{name: "D", quality: 48, sell_in: -3},
      %Item{name: "E", quality: 150, sell_in: -3}
    ]
    assert GildedRose.update_quality(items) == expected
  end

  test "sell in null" do
    items = [
      %Item{name: ConstantName.aged, quality: -5, sell_in: 0},
      %Item{name: ConstantName.aged, quality: 0, sell_in: 0},
      %Item{name: ConstantName.aged, quality: 12, sell_in: 0},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 0},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 0},
      %Item{name: ConstantName.backstage, quality: -5, sell_in: 0},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: 0},
      %Item{name: ConstantName.backstage, quality: 12, sell_in: 0},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 0},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 0},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 0},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 0},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 0},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 0},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 0},
      %Item{name: "A", quality: -5, sell_in: 0},
      %Item{name: "B", quality: 0, sell_in: 0},
      %Item{name: "C", quality: 12, sell_in: 0},
      %Item{name: "D", quality: 50, sell_in: 0},
      %Item{name: "E", quality: 152, sell_in: 0},
    ]
    expected = [
      %Item{name: ConstantName.aged, quality: -3, sell_in: -1},
      %Item{name: ConstantName.aged, quality: 2, sell_in: -1},
      %Item{name: ConstantName.aged, quality: 14, sell_in: -1},
      %Item{name: ConstantName.aged, quality: 50, sell_in: -1},
      %Item{name: ConstantName.aged, quality: 152, sell_in: -1},
      %Item{name: ConstantName.backstage, sell_in: -1, quality: 0},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: -1},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: -1},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: -1},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: -1},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 0},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 0},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 0},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 0},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 0},
      %Item{name: "A", quality: -5, sell_in: -1},
      %Item{name: "B", quality: 0, sell_in: -1},
      %Item{name: "C", quality: 10, sell_in: -1},
      %Item{name: "D", quality: 48, sell_in: -1},
      %Item{name: "E", quality: 150, sell_in: -1}
    ]
    assert GildedRose.update_quality(items) == expected   
  end

  test "sell in 6" do
    items = [
      %Item{name: ConstantName.aged, quality: -5, sell_in: 6},
      %Item{name: ConstantName.aged, quality: 0, sell_in: 6},
      %Item{name: ConstantName.aged, quality: 12, sell_in: 6},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 6},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 6},
      %Item{name: ConstantName.backstage, quality: -5, sell_in: 6},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: 6},
      %Item{name: ConstantName.backstage, quality: 12, sell_in: 6},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 6},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 6},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 6},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 6},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 6},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 6},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 6},
      %Item{name: "A", quality: -5, sell_in: 6},
      %Item{name: "B", quality: 0, sell_in: 6},
      %Item{name: "C", quality: 12, sell_in: 6},
      %Item{name: "D", quality: 50, sell_in: 6},
      %Item{name: "E", quality: 152, sell_in: 6},
    ]
    expected = [
      %Item{name: ConstantName.aged, quality: -4, sell_in: 5},
      %Item{name: ConstantName.aged, quality: 1, sell_in: 5},
      %Item{name: ConstantName.aged, quality: 13, sell_in: 5},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 5},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 5},
      %Item{name: ConstantName.backstage, sell_in: 5, quality: -3},
      %Item{name: ConstantName.backstage, quality: 2, sell_in: 5},
      %Item{name: ConstantName.backstage, quality: 14, sell_in: 5},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 5},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 5},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 6},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 6},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 6},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 6},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 6},
      %Item{name: "A", quality: -5, sell_in: 5},
      %Item{name: "B", quality: 0, sell_in: 5},
      %Item{name: "C", quality: 11, sell_in: 5},
      %Item{name: "D", quality: 49, sell_in: 5},
      %Item{name: "E", quality: 151, sell_in: 5}
    ]
    assert GildedRose.update_quality(items) == expected  
  end

  test "sell in 11" do
    items = [
      %Item{name: ConstantName.aged, quality: -5, sell_in: 11},
      %Item{name: ConstantName.aged, quality: 0, sell_in: 11},
      %Item{name: ConstantName.aged, quality: 12, sell_in: 11},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 11},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 11},
      %Item{name: ConstantName.backstage, quality: -5, sell_in: 11},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: 11},
      %Item{name: ConstantName.backstage, quality: 12, sell_in: 11},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 11},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 11},
      %Item{name: "A", quality: -5, sell_in: 11},
      %Item{name: "B", quality: 0, sell_in: 11},
      %Item{name: "C", quality: 12, sell_in: 11},
      %Item{name: "D", quality: 50, sell_in: 11},
      %Item{name: "E", quality: 152, sell_in: 11},
    ]
    expected = [
      %Item{name: ConstantName.aged, quality: -4, sell_in: 10},
      %Item{name: ConstantName.aged, quality: 1, sell_in: 10},
      %Item{name: ConstantName.aged, quality: 13, sell_in: 10},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 10},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 10},
      %Item{name: ConstantName.backstage, sell_in: 10, quality: -4},
      %Item{name: ConstantName.backstage, quality: 1, sell_in: 10},
      %Item{name: ConstantName.backstage, quality: 13, sell_in: 10},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 10},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 10},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 11},
      %Item{name: "A", quality: -5, sell_in: 10},
      %Item{name: "B", quality: 0, sell_in: 10},
      %Item{name: "C", quality: 11, sell_in: 10},
      %Item{name: "D", quality: 49, sell_in: 10},
      %Item{name: "E", quality: 151, sell_in: 10}
    ]
    assert GildedRose.update_quality(items) == expected
  end

  test "small positive sell in" do
    items = [
      %Item{name: ConstantName.aged, quality: -5, sell_in: 2},
      %Item{name: ConstantName.aged, quality: 0, sell_in: 2},
      %Item{name: ConstantName.aged, quality: 12, sell_in: 2},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 2},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 2},
      %Item{name: ConstantName.backstage, quality: -5, sell_in: 2},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: 2},
      %Item{name: ConstantName.backstage, quality: 12, sell_in: 2},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 2},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 2},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 2},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 2},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 2},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 2},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 2},
      %Item{name: "A", quality: -5, sell_in: 2},
      %Item{name: "B", quality: 0, sell_in: 2},
      %Item{name: "C", quality: 12, sell_in: 2},
      %Item{name: "D", quality: 50, sell_in: 2},
      %Item{name: "E", quality: 152, sell_in: 2},
    ]
    expected = [
      %Item{name: ConstantName.aged, quality: -4, sell_in: 1},
      %Item{name: ConstantName.aged, quality: 1, sell_in: 1},
      %Item{name: ConstantName.aged, quality: 13, sell_in: 1},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 1},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 1},
      %Item{name: ConstantName.backstage, sell_in: 1, quality: -2},
      %Item{name: ConstantName.backstage, quality: 3, sell_in: 1},
      %Item{name: ConstantName.backstage, quality: 15, sell_in: 1},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 1},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 1},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: -2},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: -2},
      %Item{name: "A", quality: -5, sell_in: 1},
      %Item{name: "B", quality: 0, sell_in: 1},
      %Item{name: "C", quality: 11, sell_in: 1},
      %Item{name: "D", quality: 49, sell_in: 1},
      %Item{name: "E", quality: 151, sell_in: 1}
    ]
    assert GildedRose.update_quality(items) == expected
  end

  test "normal sell in" do
     items = [
      %Item{name: ConstantName.aged, quality: -5, sell_in: 8},
      %Item{name: ConstantName.aged, quality: 0, sell_in: 8},
      %Item{name: ConstantName.aged, quality: 12, sell_in: 8},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 8},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 8},
      %Item{name: ConstantName.backstage, quality: -5, sell_in: 8},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: 8},
      %Item{name: ConstantName.backstage, quality: 12, sell_in: 8},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 8},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 8},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 8},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 8},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 8},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 8},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 8},
      %Item{name: "A", quality: -5, sell_in: 8},
      %Item{name: "B", quality: 0, sell_in: 8},
      %Item{name: "C", quality: 12, sell_in: 8},
      %Item{name: "D", quality: 50, sell_in: 8},
      %Item{name: "E", quality: 152, sell_in: 8},
    ]
    expected = [
      %Item{name: ConstantName.aged, quality: -4, sell_in: 7},
      %Item{name: ConstantName.aged, quality: 1, sell_in: 7},
      %Item{name: ConstantName.aged, quality: 13, sell_in: 7},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 7},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 7},
      %Item{name: ConstantName.backstage, sell_in: 7, quality: -3},
      %Item{name: ConstantName.backstage, quality: 2, sell_in: 7},
      %Item{name: ConstantName.backstage, quality: 14, sell_in: 7},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 7},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 7},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 8},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 8},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 8},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 8},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 8},
      %Item{name: "A", quality: -5, sell_in: 7},
      %Item{name: "B", quality: 0, sell_in: 7},
      %Item{name: "C", quality: 11, sell_in: 7},
      %Item{name: "D", quality: 49, sell_in: 7},
      %Item{name: "E", quality: 151, sell_in: 7}
    ]
    assert GildedRose.update_quality(items) == expected
  end

  test "high sell in" do
    items = [
      %Item{name: ConstantName.aged, quality: -5, sell_in: 12},
      %Item{name: ConstantName.aged, quality: 0, sell_in: 12},
      %Item{name: ConstantName.aged, quality: 12, sell_in: 12},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 12},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 12},
      %Item{name: ConstantName.backstage, quality: -5, sell_in: 12},
      %Item{name: ConstantName.backstage, quality: 0, sell_in: 12},
      %Item{name: ConstantName.backstage, quality: 12, sell_in: 12},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 12},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 12},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 12},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 12},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 12},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 12},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 12},
      %Item{name: "A", quality: -5, sell_in: 12},
      %Item{name: "B", quality: 0, sell_in: 12},
      %Item{name: "C", quality: 12, sell_in: 12},
      %Item{name: "D", quality: 50, sell_in: 12},
      %Item{name: "E", quality: 152, sell_in: 12},
    ]
    expected = [
      %Item{name: ConstantName.aged, quality: -4, sell_in: 11},
      %Item{name: ConstantName.aged, quality: 1, sell_in: 11},
      %Item{name: ConstantName.aged, quality: 13, sell_in: 11},
      %Item{name: ConstantName.aged, quality: 50, sell_in: 11},
      %Item{name: ConstantName.aged, quality: 152, sell_in: 11},
      %Item{name: ConstantName.backstage, sell_in: 11, quality: -4},
      %Item{name: ConstantName.backstage, quality: 1, sell_in: 11},
      %Item{name: ConstantName.backstage, quality: 13, sell_in: 11},
      %Item{name: ConstantName.backstage, quality: 50, sell_in: 11},
      %Item{name: ConstantName.backstage, quality: 152, sell_in: 11},
      %Item{name: ConstantName.sulfuras, quality: -5, sell_in: 12},
      %Item{name: ConstantName.sulfuras, quality: 0, sell_in: 12},
      %Item{name: ConstantName.sulfuras, quality: 12, sell_in: 12},
      %Item{name: ConstantName.sulfuras, quality: 50, sell_in: 12},
      %Item{name: ConstantName.sulfuras, quality: 152, sell_in: 12},
      %Item{name: "A", quality: -5, sell_in: 11},
      %Item{name: "B", quality: 0, sell_in: 11},
      %Item{name: "C", quality: 11, sell_in: 11},
      %Item{name: "D", quality: 49, sell_in: 11},
      %Item{name: "E", quality: 151, sell_in: 11}
    ]
    assert GildedRose.update_quality(items) == expected   
  end
end
