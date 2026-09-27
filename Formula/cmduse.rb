class Cmduse < Formula
  desc "Live usage dashboards: Command Code, and OpenCode Go/Zen"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  url "https://static.crates.io/crates/cmd-usage/cmd-usage-0.7.5.crate"
  sha256 "e35b995da7855df178a1ae2ec452674386ef2c7b5719d0df924b144839c1edec"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse --help")
    assert_match "ocuse", shell_output("#{bin}/ocuse --version")
  end
end
