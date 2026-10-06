# Formula Homebrew PersoIA CLI — générée par render-formula.sh à chaque release.
# NE PAS éditer à la main dans le tap : modifier ce template puis re-render.
#
# Installe le binaire pré-buildé de la release GitHub (pas de compilation).
# Placeholders remplacés au rendu : 0.6.6, 8a91408108d9717fde9a65d57db8021b93578dfeacf9210fc91cd36d1c02e67a, ea6b86a9ffb24156e66927ee9860b282d82a15793ce982f4d454bfe4fa6b0742.
class Persoia < Formula
  desc "Assistant code souverain — CLI PersoIA"
  homepage "https://www.persoia.com"
  version "0.6.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FishMoiLaPaix/persoia-cli/releases/download/v0.6.6/persoia-0.6.6-darwin-arm64"
      sha256 "8a91408108d9717fde9a65d57db8021b93578dfeacf9210fc91cd36d1c02e67a"
    end
    on_intel do
      odie "PersoIA CLI n'est disponible que pour les Mac Apple Silicon (arm64)."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FishMoiLaPaix/persoia-cli/releases/download/v0.6.6/persoia-0.6.6-linux-x64"
      sha256 "ea6b86a9ffb24156e66927ee9860b282d82a15793ce982f4d454bfe4fa6b0742"
    end
    on_arm do
      odie "PersoIA CLI n'est disponible que pour Linux x86_64."
    end
  end

  def install
    # La release fournit un binaire unique nommé persoia-<ver>-<plateforme>.
    bin.install Dir["persoia-*"].first => "persoia"
  end

  test do
    assert_match "persoia #{version}", shell_output("#{bin}/persoia version")
  end
end
