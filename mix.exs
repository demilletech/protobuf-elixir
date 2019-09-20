defmodule Protobuf.Mixfile do
  use Mix.Project

  @version "0.6.3"

  def project do
    [
      app: :protocol_buffers,
      version: @version,
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript(),
      description: description(),
      package: package(),
    ]
  end

  def application, do: [extra_applications: [:logger]]

  defp deps do
    [
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:eqc_ex, "~> 1.4", only: [:dev, :test]}
    ]
  end

  defp escript do
    [main_module: Protobuf.Protoc.CLI, name: "protoc-gen-elixir", app: nil]
  end

  defp description do
    "A pure Elixir implementation of Google Protobuf. A fork of tony612's package."
  end

  defp package do
    [
      maintainers: ["Julian DeMille", "demilleTech LLC"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/demilletech/protobuf-elixir"},
      files:
        ~w(mix.exs README.md lib/google lib/protobuf lib/protobuf.ex src config LICENSE priv/templates .formatter.exs),
    ]
  end
end
