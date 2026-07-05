class Upsteer < Formula
  desc "Local runtime bridge for UpSteer"
  homepage "https://upsteer.ai"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://upsteer.ai/dist/upsteer/upsteer_darwin_arm64.tar.gz"
      sha256 "13a644dc5189cd1bebb5b1848c925f89404b5ba556a592702c08a3ecb2283df8"
    else
      url "https://upsteer.ai/dist/upsteer/upsteer_darwin_amd64.tar.gz"
      sha256 "a97ffb779a23227fe93f14f2a323e4a2e2761a7eb61cb18587dcefb7cc10d760"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://upsteer.ai/dist/upsteer/upsteer_linux_arm64.tar.gz"
      sha256 "932f9d089b5d3209767a1d9fd1d6c3ed9fbe6fc4a95f725c240f9929ed55914c"
    else
      url "https://upsteer.ai/dist/upsteer/upsteer_linux_amd64.tar.gz"
      sha256 "7a359f1ceb2df8931d17f915774ca69a09d5e90927ca854685e5004046e0a0e4"
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
