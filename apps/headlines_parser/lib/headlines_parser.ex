defmodule HeadlinesParser.Application do
  use Application

  def start(_type, _args) do
    IO.puts "Starting parser"

    {:ok, supervisor} = HeadlinesParser.Supervisor.start_link()

    [{_, file_parser, _, _} | _] = Supervisor.which_children(supervisor)

    GenServer.call(file_parser, :load_file)

    {:ok, supervisor}
  end
end
