class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.39"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.39/jackin-dev-0.1.39-aarch64-apple-darwin.tar.gz"
      sha256 "0c9ac8134be9287ee3d0725711a651c13bd8c4bc740a6a18ea9c9b6309ea62ec"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.39/jackin-dev-0.1.39-x86_64-apple-darwin.tar.gz"
      sha256 "61527d52501970258009bcc173ca73a86cebd7229cb25fca9903fdbde9dfb0f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.39/jackin-dev-0.1.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a4bfb8021848bf782065307e42623ffbe5d7e02fca4ee2677421f44ee330698"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.39/jackin-dev-0.1.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa7c7cf6aec9f65869759c12640a9de72a4f4aa6620236a0801253e930df84a1"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
