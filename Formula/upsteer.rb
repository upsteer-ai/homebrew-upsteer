class Upsteer < Formula
  desc "Local runtime bridge for UpSteer"
  homepage "https://upsteer.ai"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://upsteer.ai/dist/upsteer/upsteer_darwin_arm64.tar.gz"
      sha256 "4a2fd9ffdd581f4d1db04c79119dca010d755a9f874a9d45b91faea464dc7df7"
    else
      url "https://upsteer.ai/dist/upsteer/upsteer_darwin_amd64.tar.gz"
      sha256 "2f5034df5a3d770b07c3ccf91e03c1db76ffdd32b85fa23266d2e0e8d19fa012"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://upsteer.ai/dist/upsteer/upsteer_linux_arm64.tar.gz"
      sha256 "f556153d17e5b140ba11ad7a855f94094685773b1bac11d507255df1691e1568"
    else
      url "https://upsteer.ai/dist/upsteer/upsteer_linux_amd64.tar.gz"
      sha256 "92918f44f25b8c10b1f02c285877ab2df075119426b09b2a42bbfb24daa29525"
    end
  end

  def install
    bin.install "upsteer"
  end

  service do
    run [opt_bin/"upsteer", "service", "run"]
    keep_alive true
    log_path var/"log/upsteer.log"
    error_log_path var/"log/upsteer.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/upsteer version")
  end
end
