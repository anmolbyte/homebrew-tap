class Audiodaemon < Formula
  desc "Ultra-lightweight macOS background daemon for automatic audio routing"
  homepage "https://github.com/anmolbyte/autoaudio"
  url "https://github.com/anmolbyte/autoaudio/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e8194926afeee22cb6ffdb9c928400ff2a5c12b52985094f719b9184dc14ce03"
  license "MIT"

  # Allows installing the latest commit directly from your GitHub repository
  head "https://github.com/anmolbyte/autoaudio.git", branch: "main"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  service do
    run opt_libexec/"audiodaemon"
    keep_alive true
    # Completely silent per requirements
    log_path "/dev/null"
    error_log_path "/dev/null"
  end

  test do
    assert_predicate libexec/"audiodaemon", :exist?
    assert_predicate bin/"autoaudio", :exist?
  end
end
