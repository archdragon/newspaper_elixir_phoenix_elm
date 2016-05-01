defmodule ArchIo do
  def puts(text) do
    IO.puts(text)
  end

  def log(text, level \\ 0) do
    text = String.duplicate("  ", level)
      <> level_to_sign(level)
      <> text

    [level_to_color(level), text]
    |> IO.ANSI.format(true)
    |> IO.puts
  end

  defp level_to_color(level) do
    case level do
      0 -> :bright
      1 -> :white
      _ -> :white
    end
  end

  defp level_to_sign(level) do
    case level do
      0 -> "\n"
      _ -> "↳ "
    end
  end
end
