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
  end
end
