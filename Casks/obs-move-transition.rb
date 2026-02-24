cask "obs-move-transition" do
  version "3.2.1"
  obs_site_version = "7055"
  obs_site_file = "118273"
  sha256 "4ef697c5068536a5d1caf250d1da66fd61e167385dc90b4b790c1baeb1952bbb"

  # Plugin *does* have releases tagged in GitHub, but the artifacts only exist on the OBS forums.
  url "https://obsproject.com/forum/resources/move.913/version/#{obs_site_version}/download?file=#{obs_site_file}"
  name "Move Transition"
  desc "OBS Studio Move Transition plugin"
  homepage "https://obsproject.com/forum/resources/move.913"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on cask: "obs"

  # OBS plugins need to go in the user's home dir and Homebrew's pkg stanza
  # can only put them in the root dir. This is admittedly hacky but feels
  # cleaner to me than the symlink approach in e.g. the obs-ndi cask.
  installer script: {
    executable: "/usr/sbin/installer",
    args:       ["-pkg", "#{staged_path}/move-transition-#{version}-macos-universal.pkg", "-target", "CurrentUserHomeDirectory"],
  }

  uninstall script: {
              executable: "/usr/sbin/pkgutil",
              args:       ["--forget", "com.exeldro.move-transition", "--volume", Dir.home],
            },
            delete: "#{Dir.home}/Library/Application Support/obs-studio/plugins/move-transition.plugin"
end
