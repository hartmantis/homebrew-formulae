cask "goxlr-utility" do
  arch arm: "m1", intel: "intel"

  version "1.1.4"
  sha256 arm:   "bd18977dc8b856a9bd44e0356bc3eb17f9b0bed2fd314d4626b120df8af06646",
         intel: "49d82a4ac9c5c849851399e3274240cbd7de6feaaee583dac1bc9251d35c657f"

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
