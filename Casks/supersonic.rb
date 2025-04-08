cask "supersonic" do
  arch arm: "arm64", intel: "x64"

  version "0.15.1"
  sha256 arm:   "e216fec619a3f4642f2b81a193c7eb2cdf4c881e253e09a3e65f01613f276512",
         intel: "f88db8d9910160584e06b1be41fe189f88eb28d4776bea8c9a87bb8d241a3cc0"

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
