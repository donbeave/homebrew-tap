# source-sha: e435415a31c008af6c223bf6ece9695bf9532ad9
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.0-preview.722+e435415"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-aarch64-apple-darwin.tar.gz"
      sha256 "5aa8319e762c5c8dc341ce4a920f18a36aea8ca81e61a2735ef78f1f35226b8c"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-x86_64-apple-darwin.tar.gz"
      sha256 "b503ec912375640e26dcc111b2ee8dfa4b45c503e4a9b7b34f33381ea7b91e89"
    end
  end

  conflicts_with "jackin-project/tap/jackin", because: "preview and stable install the same binary"

  def install
    bin.install "jackin"
    bin.install "jackin-role"
  end

  test do
    system "#{bin}/jackin", "--version"
  end
end
