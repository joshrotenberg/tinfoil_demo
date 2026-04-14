defmodule TinfoilDemo.CLI do
  @moduledoc """
  Burrito entry point. Delegates to `TinfoilDemo.CLI.Root` via cheer.
  """

  def main(argv) do
    # Burrito's wrapper doesn't halt the BEAM when main/1 returns, so
    # the binary would otherwise sit there waiting on the runtime forever.
    # Tests call run/1 directly to avoid killing the test runner.
    run(argv)
    System.halt(0)
  end

  @doc false
  def run(argv) do
    Cheer.run(TinfoilDemo.CLI.Root, argv, prog: "tinfoil_demo")
  end
end
