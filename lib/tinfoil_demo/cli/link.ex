defmodule TinfoilDemo.CLI.Link do
  @moduledoc "Print links back to the tinfoil project."

  use Cheer.Command

  command "link" do
    about("Print links back to the tinfoil project")
  end

  @impl Cheer.Command
  def run(_args, _raw) do
    IO.puts("This binary was packaged and released with tinfoil.")
    IO.puts("")
    IO.puts("  source:   https://github.com/joshrotenberg/tinfoil")
    IO.puts("  hexdocs:  https://hexdocs.pm/tinfoil")
    IO.puts("  this CLI: https://github.com/joshrotenberg/tinfoil_demo")
    :ok
  end
end
