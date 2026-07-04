# SPDX-FileCopyrightText: 2026 Alexey Zhokhov
# SPDX-License-Identifier: Apache-2.0

class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.13/jackin-dev-0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "a074df0bcc33931ad0d62dbc60dcdb0e6a264e0cfb7ed33d871ef8ef630a698e"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.13/jackin-dev-0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "84effca2aa3250195581085e2fb1f0ae0679304fc10cca4fcff0f63b11e67f10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.13/jackin-dev-0.1.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf7fceb32bd081fd34ee531d365b28e98c88ab13406ac4272c282ba505957dcb"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.13/jackin-dev-0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8a00f2e0a9e9d0180ec2d19f1432d2972c39641c0afd695227a76c9c2066fc0"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
