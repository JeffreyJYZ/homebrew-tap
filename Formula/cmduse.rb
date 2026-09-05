class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  url "https://static.crates.io/crates/cmd-usage/cmd-usage-0.1.12.crate"
  sha256 "45764d51ad4e83f2829c332e175686dd47e29ebf19217afd52e4393cab19eaf7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse --help")
  end
end
