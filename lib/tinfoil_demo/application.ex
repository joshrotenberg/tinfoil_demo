defmodule TinfoilDemo.Application do
  @moduledoc """
  Burrito doesn't auto-call any `main/1` for us — it just boots the
  release and lets the OTP application supervisor take over. So this
  callback is the actual entry point: read argv via Burrito's helper,
  hand it to the CLI, then halt.

  In a normal `mix run` this module is unused (Mix invokes `CLI.run/1`
  directly).
  """

  use Application

  @impl true
  def start(_type, _args) do
    # Only dispatch the CLI when we're actually a Burrito-wrapped
    # binary. In `mix test` / `iex -S mix`, this callback also fires,
    # but System.argv would be `["test"]` etc. and we'd hijack the
    # tooling.
    if Burrito.Util.running_standalone?() do
      spawn(fn ->
        argv = Burrito.Util.Args.argv()
        TinfoilDemo.CLI.run(argv)
        System.halt(0)
      end)
    end

    Supervisor.start_link([], strategy: :one_for_one, name: TinfoilDemo.Supervisor)
  end
end
