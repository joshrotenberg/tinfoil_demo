defmodule TinfoilDemo.CLI.Root do
  @moduledoc """
  Root command tree for `tinfoil_demo`. Built with
  [cheer](https://hex.pm/packages/cheer) to show off a realistic CLI
  shape — subcommands, typed options, help text — shipping through
  the tinfoil release pipeline.
  """

  use Cheer.Command

  command "tinfoil_demo" do
    about("Smoke-test CLI for the tinfoil release pipeline")

    long_about("""
    A tiny Elixir CLI packaged with Burrito and released end-to-end
    by tinfoil. Prints build info, greets users, or points you back
    at the tinfoil source.
    """)

    subcommand(TinfoilDemo.CLI.Info)
    subcommand(TinfoilDemo.CLI.Hello)
    subcommand(TinfoilDemo.CLI.Link)
  end

  @impl Cheer.Command
  def run(_args, _raw) do
    version =
      case :application.get_key(:tinfoil_demo, :vsn) do
        {:ok, vsn} -> to_string(vsn)
        _ -> "dev"
      end

    IO.puts("tinfoil_demo #{version}")
    IO.puts("A smoke-test CLI for https://github.com/joshrotenberg/tinfoil")
    IO.puts("")
    IO.puts("Try: tinfoil_demo --help")
    :ok
  end
end
