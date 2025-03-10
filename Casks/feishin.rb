cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.12.3"
  sha256 arm:   "79f6337652d376bbde6cdf6b237872561485fd6af102ca3d671509672f19fb67",
         intel: "92c37ac856d9eac1fd1d697af6d17f32531f50c72858b26ff41c2e914bda39a0"

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
