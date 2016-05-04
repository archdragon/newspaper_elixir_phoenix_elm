defmodule DataStore do
  use GenServer

  def start_link(_, _) do
    GenServer.start_link(__MODULE__, [], [])
  end

  def save_sentence(sentence_data) do
    ArchIo.log "Storing sentence data"
    IO.puts "Sentence data:"
    IO.inspect sentence_data
  end
end
