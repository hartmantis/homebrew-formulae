cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.9.0"
  sha256 arm:   "41f83769c666f543b739043f6a5ff4d4418863744d482cef7106df84c8e82cae",
         intel: "86aed7f9101b994890cbfd17256d80a84f6893003ac336d375b296c59ad95c5b"

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
