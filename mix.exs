defmodule TinfoilDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :tinfoil_demo,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases(),
      tinfoil: [
        targets: [:darwin_arm64, :darwin_x86_64, :linux_x86_64, :linux_arm64],
        homebrew: [enabled: false],
        installer: [enabled: true]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:burrito, "~> 1.0"},
      {:tinfoil, path: "../tinfoil", runtime: false}
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
            linux_arm64: [os: :linux, cpu: :aarch64]
          ],
          main_module: TinfoilDemo.CLI
        ]
      ]
    ]
  end
end
