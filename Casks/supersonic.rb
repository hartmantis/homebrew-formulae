cask "supersonic" do
  arch arm: "arm64", intel: "x64"

  version "0.15.2"
  sha256 arm:   "5b6385baeb310328099f0d2fda8cb74f38b8efdbe1624f9cffa45c3dc0f1b8e0",
         intel: "f2f7045fbf3d6d6c85172bfbcca7c11c42ca79ba0f0bcc419e5cb9b14f5079a5"

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
