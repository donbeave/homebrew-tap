class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.17/jackin-dev-0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "8342a3d84ab39cb4102cd3bbce5431169e69d0e576b467fff222e0c6a95b8bac"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.17/jackin-dev-0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "614b55b1eaf15f3d7980409a2e8d72af6de01f61f7d6ff2f089a17f839e3acb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.17/jackin-dev-0.1.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d7955287624ae5932f92dc74fb2fd6aa1614c68d2941e7737294547780ca549"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.17/jackin-dev-0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c15e85d44b43a761854b45ee3e2c430a2ca552ffa5eb58ebd7a385371a9c90c"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
