defmodule MarkovChain.Generator do

  @doc ~S"""
    Use gathered data to generate a list of words, that will ideally form a coherent sentence.

  """
  def generate_chain(data) do
    generate_chain(data, [])
  end

  defp generate_chain(data, words) do
    last_word = get_random_word(data, words)

    word_length = case List.last(words) do
      nil -> 0
      previous_word -> String.length(previous_word)
    end

    case words do
      word_list when length(word_list) > 3 ->
        case Enum.random([1, 500]) do
          # Avoind "a" "and" etc. as last words
          1 when word_length > 4 ->
            words
          _ ->
            generate_chain(data, words ++ [last_word])
        end
      _ ->
        generate_chain(data, words ++ [last_word])
    end
  end

  defp get_random_word(data, []) do
    data
    |> Map.keys
    |> Enum.take_random(1)
    |> List.last
  end

  defp get_random_word(data, words) do
    last_word = List.last(words)

    case Map.fetch(data, last_word) do
      {:ok, word_info} ->
        word_info
        |> Map.fetch(:targets)
        |> elem(1)
        |> Enum.take_random(1)
        |> List.last
      :error ->
        nil
    end
  end
end
