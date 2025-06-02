cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.13.0"
  sha256 arm:   "0d0bc3934f4d0a0d2d18042403bae755a174e0f22a40ab8c1b130d1e64fc8634",
         intel: "0c0f4f12e0f52e64a1c1faae980517fb39719afa505610a6001abcf1265684af"

  url "https://github.com/jeffvli/feishin/releases/download/v#{version}/Feishin-#{version}-mac-#{arch}.dmg"
  name "Feishin"
  desc "Modern self-hosted music player"
  homepage "https://github.com/jeffvli/feishin"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Feishin.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/feishin",
    "#{Dir.home}/Library/Logs/feishin",
    "#{Dir.home}/Library/Preferences/org.jeffvli.feishin.plist",
    "#{Dir.home}/Library/Saved Application State/org.jeffvli.feishin.savedState",
  ]
end
