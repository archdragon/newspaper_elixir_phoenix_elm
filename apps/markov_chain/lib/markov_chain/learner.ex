defmodule MarkovChain.Learner do
  use GenServer

  def start_link(_, _) do
    GenServer.start_link(__MODULE__, [], [])
  end

  def handle_call(:learn, _from, state) do
    {:reply, :ok, state}
  end

  @doc ~S"""
    Accepts a list of words and transforms it into a Morkov Chain data

    ## Examples

        iex> MarkovChain.Learner.submit_input(["word1", "word2"])
        %{
          "word1" => %{source: "word1", targets: ["word2"]}
        }

        iex> MarkovChain.Learner.submit_input(["a", "b", "b"])
        %{
          "a" => %{source: "a", targets: ["b"]},
          "b" => %{source: "b", targets: ["b"]}
        }

        iex> MarkovChain.Learner.submit_input(["b", "a", "b", "b", "b", "c"])
        %{
          "a" => %{source: "a", targets: ["b"]},
          "b" => %{source: "b", targets: ["c", "b", "b", "a"]}
        }

        iex> MarkovChain.Learner.submit_input([])
        %{}

  """
  def submit_input(word_list) do
    parse_word_list(word_list)
  end

  # A little hack to quickly use 
  # sequences of two words
  defp to_double_words(word_list) do
  end

  defp parse_word_list(word_list) do
    parse_word_list(%{}, word_list)
  end

  defp parse_word_list(chain_data, [head | tail]) do
    chain_data
    #|> add_pair(head, Enum.at(tail, 0), Enum.at(tail, 1))
    |> add_pair(head, Enum.at(tail, 0))
    |> elem(1)
    |> parse_word_list(tail)
  end

  defp parse_word_list(chain_data, []) do
    chain_data
  end

  defp add_pair(chain_data, source1, source2, target) do
    source_string = source1 <> "|++|" <> souce2 
    add_pair(chain_data, source_string, target)
  end

  defp add_pair(chain_data, source, target) do
    # ArchIo.log "Adding pair '#{source}' -> '#{target}'"
    case target do
      nil ->
        {:finish, chain_data}

      _ ->
        row = %{
          source: source,
          targets: [ target ]
        }

        update_row = fn(old_row) ->
          Map.put(old_row, :targets, [ target ] ++ old_row.targets)
        end

        updated_chain_data = chain_data
        |> Map.update(source, row, update_row)

        {:continue, updated_chain_data}
    end
  end
end
