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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.25/cmduse-0.7.25-aarch64-apple-darwin.tar.gz"
      sha256 "0b3b89afc15e5b5310f9bea060a0af499f8cf06777c0929253a737bea1a43e1e"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.25/cmduse-0.7.25-x86_64-apple-darwin.tar.gz"
      sha256 "123fb072b81ab85561bd9d8d033c3ffeb765eb95769705ddf58caf091399708a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.25/cmduse-0.7.25-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3ae31c33e418c0674d978afb3987a67b122fb1340e641aea0120ac142822c40f"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.25/cmduse-0.7.25-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1e8541762a9f46418c6887cb66ff40fccb8e432363924388971e7bf74e97a393"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "cmdusedev", "ocusedev", "arkusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
  end
end
