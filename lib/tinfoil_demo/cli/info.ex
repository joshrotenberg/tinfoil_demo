defmodule TinfoilDemo.CLI.Info do
  @moduledoc "Print build and runtime info."

  use Cheer.Command

  command "info" do
    about("Print build and runtime info")
  end

  @impl Cheer.Command
  def run(_args, _raw) do
    version =
      case :application.get_key(:tinfoil_demo, :vsn) do
        {:ok, vsn} -> to_string(vsn)
        _ -> "dev"
      end

    lines = [
      "tinfoil_demo #{version}",
      "elixir:   #{System.version()}",
      "otp:      #{System.otp_release()}",
      "os:       #{to_string(:os.type() |> elem(1))}",
      "arch:     #{List.to_string(:erlang.system_info(:system_architecture))}",
      "released: https://github.com/joshrotenberg/tinfoil_demo/releases/tag/v#{version}"
    ]

    Enum.each(lines, &IO.puts/1)
    :ok
  end
end
