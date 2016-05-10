defmodule HeadlinesParser.Application do
  use Application

  def start(_type, _args) do
    {:ok, supervisor} = HeadlinesParser.Supervisor.start_link()

    [{_, pid, _, _}] = Supervisor.which_children(supervisor)

    {:ok, parsed_data} = GenServer.call(pid, :load_file, 40000)

    # generate_sample_set(parsed_data)

    {:ok, supervisor}
  end

  defp generate_sample_set(parsed_data) do
    Enum.each(1..100, fn(num) ->
      parsed_data
      |> MarkovChain.Generator.generate_chain
      |> Enum.join(" ")
      |> IO.puts

      IO.puts("\n")
    end)
  end
end
