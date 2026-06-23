# source-sha: b01e315ea93315daf22ab2fe45fadd428064ddb0
class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.2/jackin-dev-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "e2a8e5f3662a729f1c34980d89d3338f1f8f8b7a355805d3947e12964e001c07"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.2/jackin-dev-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "d9df2532331ffc59eb8a79c78a2bdf47ed236c1149f167d7e960817b617b6710"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.2/jackin-dev-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9426db9700ccd61e9b449d66aaafbbc8786f725d64ea293685aea9e8f9515272"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.2/jackin-dev-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d533d4571d8659aa5b81e8e36b28ecd8ba17a40c7226272d7aa04c2c5529a82f"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
