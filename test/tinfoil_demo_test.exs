defmodule TinfoilDemoTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "root command prints a banner pointing at tinfoil" do
    out = capture_io(fn -> TinfoilDemo.CLI.main([]) end)
    assert out =~ "tinfoil_demo"
    assert out =~ "tinfoil"
  end

  test "hello subcommand greets" do
    out = capture_io(fn -> TinfoilDemo.CLI.main(["hello", "Josh"]) end)
    assert out =~ "Hello, Josh!"
  end

  test "hello --loud uppercases the greeting" do
    out = capture_io(fn -> TinfoilDemo.CLI.main(["hello", "Josh", "--loud"]) end)
    assert out =~ "HELLO, JOSH!"
  end

  test "info subcommand prints build info" do
    out = capture_io(fn -> TinfoilDemo.CLI.main(["info"]) end)
    assert out =~ "elixir:"
    assert out =~ "os:"
  end

  test "link subcommand prints the tinfoil source url" do
    out = capture_io(fn -> TinfoilDemo.CLI.main(["link"]) end)
    assert out =~ "github.com/joshrotenberg/tinfoil"
  end
end
