class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  url "https://static.crates.io/crates/cmd-usage/cmd-usage-0.1.10.crate"
  sha256 "a0f0f9233904f03362fdc6b0a993b771e6d25eedac8271302c814edf18265b96"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse --help")
  end
end
