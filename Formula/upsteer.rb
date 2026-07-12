class Upsteer < Formula
  desc "Local runtime bridge for UpSteer"
  homepage "https://upsteer.ai"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://upsteer.ai/dist/upsteer/upsteer_darwin_arm64.tar.gz"
      sha256 "c73db63911c2a2857ffcf4cc9f21e7824cf279d65000eb3fc87269121abf210f"
    else
      url "https://upsteer.ai/dist/upsteer/upsteer_darwin_amd64.tar.gz"
      sha256 "2279b6aa82621608523dd766df17146868d251493d1da0255259e37eb6401006"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://upsteer.ai/dist/upsteer/upsteer_linux_arm64.tar.gz"
      sha256 "f16f52dfc45985ea7fcac7fe28a46364a7b885565ccf3101487022c2be122feb"
    else
      url "https://upsteer.ai/dist/upsteer/upsteer_linux_amd64.tar.gz"
      sha256 "55ed14748ad0759a0bc689cccb445e4f6e1cf4a3320e829c184cb839845498dc"
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
