cask "supersonic" do
  arch arm: "arm64", intel: "x64"

  version "0.15.0"
  sha256 arm:   "fe0f7ea2e532dacd8c40a792a1cb76c601a005a397fab74c16435d60e2746748",
         intel: "f9379b543ebd69be4bb98c0ef8540dfc0055156176ed0086edf9abf02aead6c4"

  url "https://github.com/dweymouth/supersonic/releases/download/v#{version}/Supersonic-#{version}-mac-#{arch}.zip"
  name "Supersonic"
  desc "Lightweight desktop client for Subsonic and Jellyfin music servers"
  homepage "https://github.com/dweymouth/supersonic"

  livecheck do
    url :url
    strategy :github_latest
  end

  deprecate! date:    "2025-04-06",
             because: "Supersonic now has its own official tap and should be installed from " \
                      "supersonic-app/supersonic instead"

  app "Supersonic.app"

  zap trash: "#{Dir.home}/Library/Application Support/supersonic"
end
