cask "obs-shaderfilter" do
  version "2.3.2"
  sha256 "c921cd236e359cf9a6f902fb64904711fa03489b797f935ad5bb9694d12d85b1"

  url "https://github.com/exeldro/obs-shaderfilter/releases/download/#{version}/obs-shaderfilter-#{version}-macos-universal.pkg",
      verified: "github.com/exeldro/obs-shaderfilter/"
  name "OBS Shader Filter"
  desc "OBS Studio filter for applying an arbitrary shader to a source"
  homepage "https://obsproject.com/forum/resources/obs-shaderfilter.1736"

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
    args:       ["-pkg", "#{staged_path}/obs-shaderfilter-#{version}-macos-universal.pkg", "-target", "CurrentUserHomeDirectory"],
  }

  uninstall script: {
              executable: "/usr/sbin/pkgutil",
              args:       ["--forget", "com.exeldro.obs-shaderfilter", "--volume", Dir.home],
            },
            delete: "#{Dir.home}/Library/Application Support/obs-studio/plugins/obs-shaderfilter.plugin"
end
