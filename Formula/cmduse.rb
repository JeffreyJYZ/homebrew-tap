class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  url "https://static.crates.io/crates/cmd-usage/cmd-usage-0.6.11.crate"
  sha256 "3de72c7e63b96fae6e18f9e008d549a0be8381beb5eb5837aa505a2ce4214e21"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse --help")
  end
end
