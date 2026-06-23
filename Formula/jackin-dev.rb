# source-sha: c0ae269d48e542ca59a5414adffd91a466daf860
class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.3/jackin-dev-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "e7403fb4c2ed5617ea7983ae1b0233f7433a577c9c47a117c5373b267adc3486"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.3/jackin-dev-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "d42489ed798cde683754e70caa90a7af46441f3067ce4bab7c43b6c2464109a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.3/jackin-dev-0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a93bc74d4bbdfb95ec19f95bcb4321ff35a2049fcd312b83eee4d64e2d21bdd0"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.3/jackin-dev-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da8e775cf4bc83516bb91e9cb5b78dd1224a7b00e09fcd356d4fa498ba4ad370"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
