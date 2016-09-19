# ex-wrapplog

A simple logger that writes log information in JSON format on standard output.

## Usage:

Configure your `mix.exs` as:

``` elixir
defp deps do
  [{:ex_wrapplog, github: "wrapp/ex-wrapplog"}]
end

def application do
  [applications: [:ex_wrapplog]]
end
```
Configure your `config.exs`
``` elixir
config :ex_wrapplog, :level, :info
```

and then

``` elixir
ExWrapplog.log(:debug | :info | :warn | :error, "This is a log message")
```

log additional parameters

``` elixir
ExWrapplog.log(:error, "This is an error message", %{reason: "Any reason"})
ERROR {"reason":"Any reason","msg":"This is an error message","level":"error"}
:logged
```

Some shortcuts: 

``` elixir
ExWrapplog.debug("This is a debug message")
ExWrapplog.info("This is an information")
ExWrapplog.warn("This is a warning")
ExWrapplog.error("This is an error message")
```

