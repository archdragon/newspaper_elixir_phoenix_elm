defmodule DataStore do
  def save_sentence(sentence_data) do
    ArchIo.log "Storing sentence data"
    IO.puts "Sentence data:"
    IO.inspect sentence_data
  end
end
