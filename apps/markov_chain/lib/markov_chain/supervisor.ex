defmodule MarkovChain.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    learner = worker(MarkocChain.Learner, [], [name: "MarkovChain.Learner"])

    children = [learner]

    IO.puts "Launching supervision for MarkocChain module"

    supervise(children, strategy: :one_for_one)
  end
end
