cask "obs-transition-table" do
  version "0.2.7"

  name "Transition Table"
  desc "The OBS Studio Transitiona Table plugin"
  homepage "https://obsproject.com/forum/resources/transition-table.1174"
  # Plugin *does* have releases tagged in GitHub, but the artifacts only exist on the OBS forums.
  url "https://obsproject.com/forum/resources/transition-table.1174/version/5172/download?file=98262"
  sha256 "bacd396c93429a977cf26f2a647fe2670d9485a9308bc7985f96b3ffafedd529"

  depends_on cask: "obs"

  livecheck do
    url :url
    strategy :github_latest
  end

  # OBS plugins need to go in the user's home dir and Homebrew's pkg stanza
  # can only put them in the root dir. This is admittedly hacky but feels
  # cleaner to me than the symlink approach in e.g. the obs-ndi cask.
  installer script: {
    executable: "/usr/sbin/installer",
    args: ["-pkg", "#{staged_path}/transition-table-#{version}-macos-universal.pkg", "-target", "CurrentUserHomeDirectory"]
  }

  uninstall script: {
    executable: "/usr/sbin/pkgutil",
    args: ["--forget", "com.exeldro.transition-table", "--volume", Dir.home]
  },
  delete: "#{Dir.home}/Library/Application Support/obs-studio/plugins/transition-table.plugin"
end
