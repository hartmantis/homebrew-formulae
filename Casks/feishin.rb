cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.8.0"
  sha256 arm:   "f4368db7ca88e0e231e2c52d87ed13c4e218380d5a0fa3f62d8557dc9165c600",
         intel: "dca0a75d8c2f8e7f8706dccce9f2d024587f06643f3c150ee613c885bc0bb066"

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
