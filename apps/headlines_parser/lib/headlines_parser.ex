defmodule HeadlinesParser.Application do
  use Application

  def start(_type, _args) do
    IO.puts "Starting parser"

    {:ok, supervisor} = HeadlinesParser.Supervisor.start_link()

    [{_, file_parser, _, _} | _] = Supervisor.which_children(supervisor)

   #{:ok, parsed_data} = GenServer.call(file_parser, :load_file, 40000)
    
   #Enum.each(1..100, fn(num) ->
    # parsed_data
    # |> MarkovChain.Generator.generate_chain
    # |> Enum.join(" ")
    # |> IO.puts

    # IO.puts("\n\n")
   #end)

    {:ok, supervisor}
  end
end
