require Logger

defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    s = String.replace(sentence, ~r/[\p{P}\p{S}]/, "")
    se = String.replace(s, "  ", " ")
    sen = String.downcase(se)
    Enum.reduce String.split(sen, " "), %{}, fn(x, map) ->
      Map.put(map, x, (map[x] || 0) + 1)
      end
  end
end
