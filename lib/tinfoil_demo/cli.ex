defmodule TinfoilDemo.CLI do
  @moduledoc """
  Burrito-friendly entry point. `TinfoilDemo.Application.start/2`
  calls `run/1` with the parsed argv, and halts the BEAM after we
  return.

  In a normal `mix run` Mix calls `run/1` directly without going
  through the application callback, so the same code path covers
  both modes. There is no `main/1` -- Burrito doesn't actually call
  any `main_module` (that config key is metadata only); the OTP
  application boot path is the real entry.
  """

  def run(argv) do
    Cheer.run(TinfoilDemo.CLI.Root, argv, prog: "tinfoil_demo")
  end
end
