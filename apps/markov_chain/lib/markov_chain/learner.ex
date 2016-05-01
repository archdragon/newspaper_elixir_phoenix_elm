defmodule MarkovChain.Learner do
  use GenServer

  def start_link(_, _) do
    GenServer.start_link(__MODULE__, [], [])
  end

  def handle_call(:learn, _from, state) do
    {:reply, :ok, state}
  end

  def submit_input(word_list) do
    parse_word_list(word_list)
  end

  defp parse_word_list(word_list) do
    parse_word_list(%{}, word_list)
  end

  defp parse_word_list(chain_data, [head | tail]) do
    chain_data
    |> add_pair(head, List.first(tail))
    |> elem(1)
    |> parse_word_list(tail)
  end

  defp parse_word_list(chain_data, []) do
    ArchIo.log "End of the list reached", 1

    DataStore.save_sentence(chain_data)
  end

  defp add_pair(chain_data, source, target) do

    ArchIo.log "Adding pair '#{source}' -> '#{target}'"

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
