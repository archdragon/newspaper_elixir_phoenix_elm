defmodule HeadlinesParser.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: :parser_supervisor)
  end

  def init([]) do
    IO.puts "Initializing supervisor"

    file_parser = worker(HeadlinesParser.FileParser, [[name: {:global, :file_parser}]])

    children = [
      file_parser
    ]

    supervision_data = supervise(children, strategy: :one_for_one)


    #IO.inspect(Supervrsor.which_children(link.elem(1)))

    supervision_data
  end
end
