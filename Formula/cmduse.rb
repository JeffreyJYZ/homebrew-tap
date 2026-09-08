class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  url "https://static.crates.io/crates/cmd-usage/cmd-usage-0.1.18.crate"
  sha256 "ed1b9b00b74ad5c2c7b3a18eb245bf90bc598a62659f2afa236feb6ff8c2c36c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse --help")
  end
end
