cask "goxlr-utility" do
  arch arm: "m1", intel: "intel"

  version "1.2.2"
  sha256 arm:   "a7b637eac026c5f26c5e46b50f2599404d87463731a65ba9a71a9f5b4d88b4a3",
         intel: "25ef31777bf20e88d633b5bad641c7fa6983038612a13bdfeee240f31dc9b7a9"

  url "https://github.com/GoXLR-on-Linux/goxlr-utility/releases/download/v#{version}/goxlr-utility-macos-#{version}-#{arch}.pkg"
  name "GoXLR Configuration Utility"
  desc "Unofficial, open source tool for controling GoXLR mixers beyond just Windows"
  homepage "https://github.com/GoXLR-on-Linux/GoXLR-Utility"

  livecheck do
    url :url
    strategy :github_latest
  end

  pkg "goxlr-utility-macos-#{version}-#{arch}.pkg"

  uninstall pkgutil: %w[
    com.frostycoolslug.goxlr-utility-ui
    com.github.goxlr-on-linux.goxlr-utility
    com.github.goxlr-on-linux.goxlr-utility.goxlr-initialiser
  ]

  zap trash: [
    "#{Dir.home}/Library/Application Support/com.frostycoolslug.goxlr-utility-ui",
    "#{Dir.home}/Library/Application Support/org.GoXLR-on-Linux.GoXLR-Utility",
  ]
end
