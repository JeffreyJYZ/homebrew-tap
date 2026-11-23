class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/cmdcode-tools"
  license "MIT"

  # Prebuilt release assets — no cargo, no Rust toolchain, no compile step.
  # Asset names are a contract shared with `cargo binstall` metadata (see
  # .github/workflows/release.yml in the source repo); Linux uses the musl
  # builds because they run on any distro regardless of glibc version.
  on_macos do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.7/cmduse-0.8.7-aarch64-apple-darwin.tar.gz"
      sha256 "cc4e1c11048b112d4439cffaaf1a90866d905bdec1e18ee404deebb60277ea29"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.7/cmduse-0.8.7-x86_64-apple-darwin.tar.gz"
      sha256 "05a59642358e989a775ffa09abea51719f5742a516eb3147db36c423d04e4057"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.7/cmduse-0.8.7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8cccc544fb3ae935031a7dbeaf5a194c7165b476bea169b1a2432340fe6c2aa9"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.7/cmduse-0.8.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "81944e9198da2f484c0bc61ad831c71769526a7850272f6c844815a581ea2b0e"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "oduse", "cmdusedev", "ocusedev", "arkusedev", "odusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
    assert_match "oduse", shell_output("#{bin}/oduse -V")
  end
end
