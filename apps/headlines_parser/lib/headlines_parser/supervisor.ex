defmodule HeadlinesParser.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    IO.puts "Initializing supervisor"

    file_parser = worker(HeadlinesParser.FileParser, [], [name: HeadlinesParser.FileParser])

    children = [
      file_parser
    ]

    IO.puts "Launching supervision"

    supervise(children, strategy: :one_for_one)

    #GenServer.call(file_parser, {:load_file})

    #GenServer.call(file_parser_pid, :load_file)
  end
end
