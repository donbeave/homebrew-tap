class Jackin < Formula
  desc "CLI for orchestrating AI coding agents in Docker containers at scale"
  homepage "https://github.com/jackin-project/jackin"
  license "Apache-2.0"
  head "https://github.com/jackin-project/jackin.git", branch: "main"

  disable! date: "2026-05-09", because: "jackin has not reached a stable release yet; use the rolling preview channel"

  depends_on "rust" => :build
  depends_on "docker" => :optional

  conflicts_with "jackin-project/tap/jackin-preview", because: "stable and preview install the same binary"

  def install
    ENV["JACKIN_VERSION_OVERRIDE"] = version.to_s
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jackin --version")
  end
end
