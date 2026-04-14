defmodule TinfoilDemo.CLI do
  @moduledoc """
  Tinfoil demo CLI — minimal Burrito entry point used to exercise
  tinfoil's release pipeline end-to-end.
  """

  def main(argv) do
    case argv do
      ["--version"] ->
        IO.puts(version())

      ["--help"] ->
        IO.puts(help())

      [] ->
        IO.puts("tinfoil_demo #{version()}")
        IO.puts("run with --help for options")

      args ->
        IO.puts("tinfoil_demo #{version()}")
        IO.puts("args: #{Enum.join(args, " ")}")
    end
  end

  defp version do
    case :application.get_key(:tinfoil_demo, :vsn) do
      {:ok, vsn} -> to_string(vsn)
      _ -> "dev"
    end
  end

  defp help do
    """
    tinfoil_demo — smoke test CLI for the tinfoil release pipeline

    Usage:
      tinfoil_demo            print version banner
      tinfoil_demo --version  print version only
      tinfoil_demo --help     this message
      tinfoil_demo ARGS...    echo args back
    """
  end
end
