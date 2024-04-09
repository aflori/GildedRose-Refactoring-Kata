defmodule GildedRoseTest do
  use ExUnit.Case, async: true

  @moduledoc """
  Le module sert à tester les différentes entrées fr module principale gilded_rose.
  Les données testés sont toutes de type %Item{} contenant 3 attributs:
    - :name     -> only ConstantName.aged, ConstantName.sulfuras, ConstantName.backstage are breakpoint (other name all have the same comportment)
    - :quality -> breakpoint value are 0, 50
    - :sell_in  -> breakpoint value are 0, 6, 11

  Comme cela implique 4×5×7 tests je vais les regrouper par valeurs de :sell_in
  """

  test "sell in negative" do
    
  end

  test "sell in null" do
    
  end

  test "sell in 6" do
    
  end

  test "sell in 11" do
    
  end

  test "small positive sell in" do
    
  end

  test "normal sell in" do
    
  end

  test "high sell in" do
    
  end
end
