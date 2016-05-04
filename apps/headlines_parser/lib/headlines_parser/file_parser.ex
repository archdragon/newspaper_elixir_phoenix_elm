defmodule HeadlinesParser.FileParser do
  use GenServer

  def start_link(state \\ [], opts \\ []) do
    GenServer.start_link(__MODULE__, state, opts)
  end

  def handle_call(:load_file, _from, state) do
    file_name = "./files/tech/all.txt"

    read_file(file_name)
    #|> MarkovChain.Utils.merge_all

    {:reply, {:ok, parsed_file_data}, state}
  end

  defp read_file(file_name) do
    #{:ok, headlines} = File.read file_name
    #IO.puts headlines
    File.stream!(file_name)
    |> Stream.map(&(clear_line(&1)))
    #|> Enum.each(&(IO.puts(&1)))
    |> Enum.map(&(parse_line(&1)))
  end

  defp clear_line(line_text) do
    String.downcase(line_text)
    |> String.replace("\n", "")
  end

  defp parse_line(line_text) do
    String.split(line_text, " ")
    |> MarkovChain.Learner.submit_input
  end

  #def handle_call(:parse_line, _from, line_num) do
    #{:reply, h, t}
    #end
end
