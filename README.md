# ex-wrapplog

A simple logger for Elixir that writes log information in JSON format on standard output.

## Usage:

Configure your `mix.exs` and add the dependency:

``` elixir
defp deps do
  [{:ex_wrapplog, github: "wrapp/ex-wrapplog"}]
end

def application do
  [applications: [:ex_wrapplog]]
end
```
Configure your `config.exs` to set the logging level (or to turn off logging).
``` elixir
config :ex_wrapplog, :level, :info

# Set the name of the service (It will be logged)
config :ex_wrapplog, service_name: "myservice"
```
To turn off logging set the configuration to `:off`.
``` elixir
config :ex_wrapplog, :level, :off
```

In your elixir app.

``` elixir
alias ExWrapplog, as: Log
Log.log(:debug | :info | :warn | :error, "This is a log message")
```

log additional parameters

``` elixir
Log.log(:error, "This is an error message", %{reason: "Any reason"})

Outputs:
{"timestamp":"2017-03-28T13:46:06.989172Z","service":"myservice","reason":"Any reason", "msg":"This is an error message","level":"error"}
:logged
```

Some shortcuts: 

``` elixir
Log.debug("This is a debug message")
Log.info("This is an information")
Log.warn("This is a warning")
Log.error("This is an error message")
```

