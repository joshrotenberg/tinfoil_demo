# tinfoil_demo

A tiny Elixir CLI packaged with [Burrito](https://github.com/burrito-elixir/burrito)
and released end-to-end by [tinfoil](https://github.com/joshrotenberg/tinfoil)
([docs](https://hexdocs.pm/tinfoil)). The command tree is built with
[cheer](https://github.com/joshrotenberg/cheer), so this repo doubles
as a working example of the whole stack.

## Install

**Homebrew** (macOS + Linux via Linuxbrew; tap maintained
automatically by tinfoil):

```sh
brew install joshrotenberg/brew/tinfoil_demo
```

**curl | sh** (Unix; downloads the right tarball for your OS/arch
and verifies its sha256):

```sh
curl -fsSL https://raw.githubusercontent.com/joshrotenberg/tinfoil_demo/main/scripts/install.sh | sh
```

Pin a version or pick the install location:

```sh
curl -fsSL https://raw.githubusercontent.com/joshrotenberg/tinfoil_demo/main/scripts/install.sh \
  | sh -s -- --version v0.5.0 --install-dir ~/.local/bin
```

**Scoop** (Windows; bucket maintained automatically by tinfoil):

```powershell
scoop bucket add joshrotenberg https://github.com/joshrotenberg/scoop-bucket
scoop install joshrotenberg/tinfoil_demo
```

**PowerShell** (Windows; `.zip` download + sha256 verify + install
to `%LOCALAPPDATA%\Programs\tinfoil_demo` by default):

```powershell
iex (irm https://raw.githubusercontent.com/joshrotenberg/tinfoil_demo/main/scripts/install.ps1)
```

Pin a version or install dir:

```powershell
irm https://raw.githubusercontent.com/joshrotenberg/tinfoil_demo/main/scripts/install.ps1 -OutFile install.ps1
.\install.ps1 -Version v0.5.0 -InstallDir "C:\tools"
```

**Manual.** Download a tarball or zip for your platform from
<https://github.com/joshrotenberg/tinfoil_demo/releases/latest>,
extract, and put the binary on your `PATH`. Verify against
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
  uploads release assets with SLSA build provenance attestations,
  bundles `LICENSE` and `README.md` into every archive, pushes an
  updated Homebrew formula to
  [`joshrotenberg/homebrew-brew`](https://github.com/joshrotenberg/homebrew-brew),
  and pushes a Scoop manifest to
  [`joshrotenberg/scoop-bucket`](https://github.com/joshrotenberg/scoop-bucket).
- **Burrito** — cross-compiles a self-contained binary for darwin
  (arm64 + x86_64), linux (arm64 + x86_64 musl), and windows (x86_64).
- **cheer** — declarative command tree with typed options, help, and
  subcommands.

Every release here is produced by running `mix tinfoil.generate`
against a stock `mix.exs` and tagging a version -- no hand-edited
YAML.

Want to release your own CLI the same way? The full story lives in
the tinfoil docs on [hexdocs.pm/tinfoil](https://hexdocs.pm/tinfoil),
including a walkthrough of wiring
[release-please](https://hexdocs.pm/tinfoil/release_please.html)
for automated version bumps (which is what this repo uses).

## Verify a release

Every archive in the GitHub Release is attested by GitHub Actions:

```sh
gh attestation verify tinfoil_demo-0.9.0-aarch64-apple-darwin.tar.gz \
  --repo joshrotenberg/tinfoil_demo
```

The attestation ties the binary to the exact commit + workflow run
that produced it.
