cask "goxlr-utility" do
  arch arm: "m1", intel: "intel"

  version "1.2.0"
  sha256 arm:   "74367787ae8db3c2c4cf67eb922a4df0200159fdde237592cb090fdb17319167",
         intel: "660c23dcbaa077af57dbbd7aa70165b0a3110e0393a8a99ef917a7a93ab66651"

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
