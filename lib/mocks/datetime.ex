defmodule DateTime.Mock do
  def utc_now() do
    "2017-03-28T13:46:06.989172Z" |> DateTime.from_iso8601 |> elem(1)
  end

  def to_iso8601(map) do
    map |> DateTime.to_iso8601
  end
end
