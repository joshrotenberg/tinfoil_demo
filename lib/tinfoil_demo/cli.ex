defmodule TinfoilDemo.CLI do
  @moduledoc """
  Burrito entry point. Delegates to `TinfoilDemo.CLI.Root` via cheer.
  """

  def main(argv) do
    Cheer.run(TinfoilDemo.CLI.Root, argv, prog: "tinfoil_demo")
  end
end
