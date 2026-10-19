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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.18/cmduse-0.7.18-aarch64-apple-darwin.tar.gz"
      sha256 "342fa1a01e0b1fedb25ed071584630c87f65eb23f221d93683ec9bae17a6ab76"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.18/cmduse-0.7.18-x86_64-apple-darwin.tar.gz"
      sha256 "6a32436dbf739328dc5d509e77fe14e65ab9d5d034d0d6d0402791c1b8db2946"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.18/cmduse-0.7.18-aarch64-unknown-linux-musl.tar.gz"
      sha256 "62a8ca22cc41f98cb09f7968d0ad7ff2dd3c3808679605297773613c7b3c9236"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.18/cmduse-0.7.18-x86_64-unknown-linux-musl.tar.gz"
      sha256 "611bef56322efb301801918c75c069919384b52b7fcabd419dd9f557336bb302"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "cmdusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
  end
end
