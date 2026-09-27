class Cmduse < Formula
  desc "Live usage dashboards: Command Code, and OpenCode Go/Zen"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  url "https://static.crates.io/crates/cmd-usage/cmd-usage-0.7.4.crate"
  sha256 "0179bec563fec531edc65ccdc512f0e820912f6cacf64c675f140121ba76b37d"
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
