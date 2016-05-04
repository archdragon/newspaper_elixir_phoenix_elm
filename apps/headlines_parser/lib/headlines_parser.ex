defmodule HeadlinesParser.Application do
  use Application

  def start(_type, _args) do
    IO.puts "Starting parser"

    {:ok, supervisor} = HeadlinesParser.Supervisor.start_link()

    [{_, file_parser, _, _} | _] = Supervisor.which_children(supervisor)

    {:ok, parsed_data} = GenServer.call(file_parser, :load_file, 40000)
    
    IO.puts "xxxxxxxxxxxxxxxxxxxxxx"
    IO.inspect parsed_data

    {:ok, supervisor}
  end
end
