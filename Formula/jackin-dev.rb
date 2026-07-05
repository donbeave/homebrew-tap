class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.14/jackin-dev-0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "d68020895f420fb34ddbe3cf74a66aae244a85d4ff87424737d681b97c3bade3"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.14/jackin-dev-0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "1c96ba6547314722056eb700fee48d36e756d3bce659b401d8bec9bcc08fb589"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.14/jackin-dev-0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2ed722026fffb680c19b6a126b23ea4a31283743fdf628b08dd4430579c4284"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.14/jackin-dev-0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ffdaadcf5c8a3136d1bbaec7181ac952a803111b59da2d79dcc1afbe16cc33c"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
