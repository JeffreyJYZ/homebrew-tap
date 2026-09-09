class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  url "https://static.crates.io/crates/cmd-usage/cmd-usage-0.5.4.crate"
  sha256 "4153057ba00d53b1685e7039d23fc458ab8fe539ad2d7ab49bc627d7f7cfc97f"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse --help")
  end
end
