class Audiodaemon < Formula
  desc "Ultra-lightweight macOS background daemon for automatic audio routing"
  homepage "https://github.com/anmolbyte/autoaudio"
  # Placeholder URL for public release tarball. Update this when publishing.
  url "https://github.com/anmolbyte/autoaudio/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  # Allows testing via local tap by specifying `--HEAD` if autoaudio is initialized as a git repo.
  head "file:///Users/anmol/Documents/autoaudio", using: :git

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
