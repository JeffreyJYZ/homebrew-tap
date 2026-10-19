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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.17/cmduse-0.7.17-aarch64-apple-darwin.tar.gz"
      sha256 "c51f91f7f439bf192ad78b5b4e4cd4d8d21b25f17faf1b94f80ed70b072ea51c"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.17/cmduse-0.7.17-x86_64-apple-darwin.tar.gz"
      sha256 "fa6220ac5048f8c8a14b93891625c05eb2b5f224e46685f9a7cee3dfd11a68f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.17/cmduse-0.7.17-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fd06f3c369c8875beab1443c0158b9efb734ccf6caba054118d9f7959ed3275e"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.17/cmduse-0.7.17-x86_64-unknown-linux-musl.tar.gz"
      sha256 "25e113b78853950ccac4a9be90732bd3aaafc9be9e2866580127354c7d48b1bd"
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
