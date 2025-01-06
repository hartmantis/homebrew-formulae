cask "supersonic" do
  arch arm: "arm64", intel: "x64"

  version "0.13.2"
  sha256 arm:   "c0986b4f24a95a993742a036a058dab713b6134ad02660d18b966af0b3a7730c",
         intel: "5e19bad7c303a78d17da8d058fa8a2c026a452ecb20ce2b35ba328d4b73be7a8"

  url "https://github.com/dweymouth/supersonic/releases/download/v#{version}/Supersonic-#{version}-mac-#{arch}.zip"
  name "Supersonic"
  desc "Lightweight desktop client for Subsonic and Jellyfin music servers"
  homepage "https://github.com/dweymouth/supersonic"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Supersonic.app"

  zap trash: "#{Dir.home}/Library/Application Support/supersonic"
end
