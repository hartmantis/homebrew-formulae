cask "goxlr-utility" do
  arch arm: "m1", intel: "intel"

  version "1.1.1"
  sha256 "e258f28ff1c45d4112dd90294ae3444c97135c185a000980955f2a0ac5b60a36"

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
