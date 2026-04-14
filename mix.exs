defmodule TinfoilDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :tinfoil_demo,
      version: "0.7.1",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases(),
      tinfoil: [
        targets: [
          :darwin_arm64,
          :darwin_x86_64,
          :linux_x86_64,
          :linux_arm64,
          :windows_x86_64
        ],
        single_runner_per_os: true,
        homebrew: [
          enabled: true,
          tap: "joshrotenberg/homebrew-brew",
          token_secret: "COMMITTER_TOKEN"
        ],
        installer: [enabled: true]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {TinfoilDemo.Application, []}
    ]
  end

  defp deps do
    [
      {:burrito, "~> 1.0"},
      {:cheer, "~> 0.1"},
      {:tinfoil, "~> 0.2", runtime: false}
    ]
  end

  defp releases do
    [
      tinfoil_demo: [
        steps: [:assemble, &Burrito.wrap/1],
        burrito: [
          targets: [
            darwin_arm64: [os: :darwin, cpu: :aarch64],
            darwin_x86_64: [os: :darwin, cpu: :x86_64],
            linux_x86_64: [os: :linux, cpu: :x86_64],
            linux_arm64: [os: :linux, cpu: :aarch64],
            windows_x86_64: [os: :windows, cpu: :x86_64]
          ],
          # main_module is metadata-only in Burrito; the real entry is
          # TinfoilDemo.Application.start/2.
          main_module: TinfoilDemo.CLI
        ]
      ]
    ]
  end
end
