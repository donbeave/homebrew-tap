class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.15/jackin-dev-0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "516a1a29d21e5ea03f07e2d8a8cab129acfa11daeb665158378261f44a4857ea"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.15/jackin-dev-0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "c099fbc960bb9b7d678ab3ace29c91a517396318536ccfcfffc2d69a427bfa97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.15/jackin-dev-0.1.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15986af34ae0369a3576dae76bf366a06b5ecc3460b506fc03d0da07910cefb0"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.15/jackin-dev-0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "60e39a055619f43848e5af8529af55b6a1461e3f614723e42fe0c03414af9b1d"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
