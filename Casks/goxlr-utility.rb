cask "goxlr-utility" do
  arch arm: "m1", intel: "intel"

  version "1.2.4"
  sha256 arm:   "2799d0861592e6bbd4fc21b4d6bf9c7c475c9306785c9ae61da5ee9f8da50468",
         intel: "392ed62e1a2df9862336b20420baf8c40b988538851b88a778fe1a0c2a858ec1"

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
