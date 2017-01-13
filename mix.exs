defmodule ExWrapplog.Mixfile do
  use Mix.Project

  @source_url "https://github.com/wrapp/ex-wrapplog"
  @version "0.1.0"

  def project do
    [app: :ex_wrapplog,
     version: @version,
     elixir: "~> 1.4",
     description: "A simple JSON logger for elixir.",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options

  defp package() do
    [
      name: :ex_wrapplog,
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Zeeshan Abid"],
      links: %{
        "GitHub" => @source_url,
      }
    ]
  end

  defp deps do
    [{:poison, "~> 1.5.2"}]
  end
end
