# tinfoil_demo

A tiny Elixir CLI packaged with [Burrito](https://github.com/burrito-elixir/burrito)
and released end-to-end by [tinfoil](https://github.com/joshrotenberg/tinfoil).
The command tree is built with [cheer](https://github.com/joshrotenberg/cheer),
so this repo doubles as a working example of the whole stack.

## Install

**Homebrew** (tap maintained automatically by tinfoil):

```sh
brew install joshrotenberg/brew/tinfoil_demo
```

**curl | sh** (downloads the right tarball for your OS/arch and
verifies its sha256):

```sh
curl -fsSL https://raw.githubusercontent.com/joshrotenberg/tinfoil_demo/main/scripts/install.sh | sh
```

Pin a version or pick the install location:

```sh
curl -fsSL https://raw.githubusercontent.com/joshrotenberg/tinfoil_demo/main/scripts/install.sh \
  | sh -s -- --version v0.5.0 --install-dir ~/.local/bin
```

**Manual.** Download a tarball or zip for your platform from
<https://github.com/joshrotenberg/tinfoil_demo/releases/latest>,
extract, and put the binary on your `PATH`. Verify with
`checksums-sha256.txt` from the same release.

## Usage

```sh
tinfoil_demo             # banner
tinfoil_demo info        # build + runtime info
tinfoil_demo hello NAME  # greet someone (add --loud to shout)
tinfoil_demo link        # print source urls
tinfoil_demo --help      # full help
```

## What this repo exercises

- **tinfoil** — generates the release workflow, runs the build matrix,
  uploads release assets, and pushes an updated Homebrew formula to
  [`joshrotenberg/homebrew-brew`](https://github.com/joshrotenberg/homebrew-brew).
- **Burrito** — cross-compiles a self-contained binary for darwin (arm64
  and x86_64), linux (arm64 and x86_64 musl), and windows (x86_64).
- **cheer** — declarative command tree with typed options, help, and
  subcommands.

Every release here is produced by running `mix tinfoil.generate`
against a stock `mix.exs` and tagging a version — no hand-edited YAML.
