defmodule ExWrapplog do

  @levels   [{:debug, 0}, {:info, 1}, {:warning, 2}, {:error, 3}, {:panic, 4}]
  @service  Application.get_env(:ex_wrapplog, :service_name, System.get_env("SERVICE_NAME"))
  @datetime Application.get_env(:ex_wrapplog, :datetime, DateTime)

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
  def warn(msg, params  \\ %{}), do: :warning  |> log(msg, params)

  @doc """
  Logs the message at error level to the standard output
  """
  def error(msg, params \\ %{}), do: :error |> log(msg, params)

  @doc """
  Logs the message at panic level to the standard output
  """
  def panic(msg, params \\ %{}), do: :panic |> log(msg, params)

  defp log_event(level, msg, %{} = params) do
    Map.put(params, :msg, msg)
    |> Map.put(:timestamp, @datetime.utc_now |> @datetime.to_iso8601)
    |> Map.put(:level, level)
    |> Map.put(:service, @service)
    |> Poison.encode!
    |> IO.puts
  end

  defp should_log?(level) do
    Application.get_env(:ex_wrapplog, :level)
    |> levels_to_log
    |> Enum.member?(level)
  end

  defp levels_to_log(:off), do: []
  defp levels_to_log(level) do
    log_level = Keyword.fetch(@levels, level)
    @levels
    |> Enum.filter(fn l -> elem(l, 1) >= elem(log_level, 1) end)
    |> Keyword.keys
  end
end
