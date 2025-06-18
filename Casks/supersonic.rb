cask "supersonic" do
  arch arm: "arm64", intel: "x64"

  version "0.16.0"
  sha256 arm:   "d084d180a07c59ae7ad12ff76746a8255c4c907807899c1468e7d77d92243261",
         intel: "067d73505bed848296acafbada84944e4a487e421f23ca5745999babf22c5281"

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
