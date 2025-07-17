cask "supersonic" do
  arch arm: "arm64", intel: "x64"

  version "0.17.0"
  sha256 arm:   "daf54c4707289c7d57caa0e15aec0c0a40de6202388e655057a6f5530cc98b7f",
         intel: "7a143328b74037afd530adcefd2908796564473427340ae9fdd5c4858c77c574"

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
