defmodule MyString do
  def is_only_ascii?([]), do: true
  def is_only_ascii?([h|t]) when h > 31 and h < 127, do: is_only_ascii?(t)
  def is_only_ascii?(_), do: false

  def anagram?(word1, word2) do
    if Enum.sort(word1) == Enum.sort(word2) do
      true
    else
      false
    end
  end
end

ExUnit.start

defmodule MyStringTest do
  use ExUnit.Case

  test "only ascii returns true" do
    assert MyString.is_only_ascii?('fjekdyyd andn') == true
  end

  test "only ascii returns false" do
    assert MyString.is_only_ascii?('©∆th andn') == false
  end

  test "anagram returns true" do
    assert MyString.anagram?('ian', 'nia') == true
  end

  test "anagram returns false" do
    assert MyString.anagram?('ian', 'fnia') == false
  end
end
