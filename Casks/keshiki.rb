cask "keshiki" do
  arch arm: "aarch64",
       intel: "x64"

  version "0.1.0"
  sha256 arm:   "504c750cdbcd42f894a386a56b395c2172d0a3df7e96271aa30b54f930643279",
         intel: "7cf97b51636fcf0f6c9fd4ddca19a9652e0ca486cce3507778175ddb5f1c427a"

  url "https://github.com/OfficialCRUGG/keshiki/releases/download/v#{version}/keshiki_#{version}_#{arch}.dmg"
  name "Keshiki"
  desc "A simple yet powerful wallpaper manager for macOS (and Windows soon)."
  homepage "https://github.com/OfficialCRUGG/keshiki"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "keshiki.app"

  postflight do
    system_command "xattr",
                   args: ["-d", "com.apple.quarantine", "#{staged_path}/keshiki.app"]
  end
end

