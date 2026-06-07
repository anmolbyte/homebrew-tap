cask "markkit" do
  version "1.0"
  sha256 "1388575fb6509d6f9bce19d258cc6d1c520e4351603a7cb48cb7de7be56011f9"

  url "https://github.com/anmolbyte/MarkKit/releases/download/v#{version}/MarkKit.zip"
  name "MarkKit"
  desc "Ultra-lightweight, native macOS Markdown editor"
  homepage "https://github.com/anmolbyte/MarkKit"

  app "MarkKit.app"

  zap trash: [
    "~/Library/Preferences/com.anmol.MarkKit.plist",
    "~/Library/Saved Application State/com.anmol.MarkKit.savedState",
  ]
end
