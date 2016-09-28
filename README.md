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
ERROR {"reason":"Any reason","msg":"This is an error message","level":"error"}
:logged
```

Some shortcuts: 

``` elixir
Log.debug("This is a debug message")
Log.info("This is an information")
Log.warn("This is a warning")
Log.error("This is an error message")
```

