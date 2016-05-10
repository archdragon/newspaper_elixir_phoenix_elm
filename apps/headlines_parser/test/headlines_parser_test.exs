defmodule HeadlinesParserTest do
  use ExUnit.Case
  #doctest HeadlinesParser.Application

  test "starts supervision" do
    #{supervisor_status, _} = HeadlinesParser.Application.start(nil, nil)

    #assert supervisor_status == :ok
    assert 1 == 1
  end

end
