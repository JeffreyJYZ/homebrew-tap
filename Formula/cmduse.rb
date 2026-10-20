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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.27/cmduse-0.7.27-aarch64-apple-darwin.tar.gz"
      sha256 "9c6e3b7ab3e75f0dda5a2c9ee05dee5dbcf7c312acf0ac28a89fb5f49e37fa13"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.27/cmduse-0.7.27-x86_64-apple-darwin.tar.gz"
      sha256 "25b5a743aefb02093497c88b50a5a4ad850ce9e53416000bbb1cfae6bb7e3b80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.27/cmduse-0.7.27-aarch64-unknown-linux-musl.tar.gz"
      sha256 "828f5935507db9f08cee4a0df80f64bbb57983c01be30b5ed6626ce30e664587"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.27/cmduse-0.7.27-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bfdc0695bcf34f675dc12bc5bf47aba249726537e3c88590f699e2bf9377d63a"
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
