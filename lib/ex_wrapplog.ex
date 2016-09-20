defmodule ExWrapplog do

  @levels [{:debug, 0}, {:info, 1}, {:warn, 2}, {:error, 3}]

  @doc """
  Generates a JSON log and writes to the standard output.
  """
  def log(level, msg, %{} = params \\ %{}) do
    if should_log?(level) do
      log_event(level, msg, params)
      :logged
    else
      :not_logged
    end
  end

  @doc """
  Logs the message at debug level to the standard output
  """
  def debug(msg, params \\ %{}), do: :debug |> log(msg, params)

  @doc """
  Logs the message at info level to the standard output
  """
  def info(msg, params  \\ %{}), do: :info  |> log(msg, params)

  @doc """
  Logs the message at warn level to the standard output
  """
  def warn(msg, params  \\ %{}), do: :warn  |> log(msg, params)

  @doc """
  Logs the message at error level to the standard output
  """
  def error(msg, params \\ %{}), do: :error |> log(msg, params)

  defp log_event(level, msg, %{} = params) do
    level |> to_string |> String.upcase |> IO.write
    IO.write " "

    Map.put(params, :msg, msg)
    |> Map.put(:level, level)
    |> Poison.encode!
    |> IO.puts
  end

  defp should_log?(level) do
    Application.get_env(:ex_wrapplog, :level)
    |> levels_to_log
    |> Enum.member?(level)
  end

  defp levels_to_log(level) do
    log_level = Keyword.fetch(@levels, level)
    @levels
    |> Enum.filter(fn l -> elem(l, 1) >= elem(log_level, 1) end)
    |> Keyword.keys
  end
end
