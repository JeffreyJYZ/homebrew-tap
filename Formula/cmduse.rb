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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.20/cmduse-0.7.20-aarch64-apple-darwin.tar.gz"
      sha256 "7a7b3720cffca966b4c034635d05cc667106f7bf2a763b6359b5cc6c1a9cbe7a"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.20/cmduse-0.7.20-x86_64-apple-darwin.tar.gz"
      sha256 "1cd65486b9f6cd8bf5b48910da452202d0368ba6466f76fe5306201d8cb1024e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.20/cmduse-0.7.20-aarch64-unknown-linux-musl.tar.gz"
      sha256 "184ceea363c13ebacd9f720d08d189ac5735e2c4dd7e550e6c86694a3b25dfe7"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.20/cmduse-0.7.20-x86_64-unknown-linux-musl.tar.gz"
      sha256 "45e86ecfe54469280ef8a6bd532d1b43dc3f38e9bf13e66125dc8d4140207b83"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "cmdusedev", "arkusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
  end
end
