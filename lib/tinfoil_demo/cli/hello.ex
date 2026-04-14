defmodule TinfoilDemo.CLI.Hello do
  @moduledoc "Greet someone by name."

  use Cheer.Command

  command "hello" do
    about("Greet someone by name")

    argument(:name, type: :string, required: true, help: "Who to greet")
    option(:loud, type: :boolean, short: :l, help: "SHOUT the greeting")
  end

  @impl Cheer.Command
  def run(%{name: name} = args, _raw) do
    greeting = "Hello, #{name}!"
    output = if args[:loud], do: String.upcase(greeting), else: greeting
    IO.puts(output)
    :ok
  end
end
