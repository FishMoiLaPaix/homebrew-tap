# Formula Homebrew PersoIA CLI — générée par render-formula.sh à chaque release.
# NE PAS éditer à la main dans le tap : modifier ce template puis re-render.
#
# Installe le binaire pré-buildé de la release GitHub (pas de compilation).
# Placeholders remplacés au rendu : 0.6.5, e722ab5165afdf8b080c0345839352b93c1d4f1869031856877df26599ac0ab7, e598bb3d074da99ec579c6be859820f150695224fa6509bfc57558030fe96ac8.
class Persoia < Formula
  desc "Assistant code souverain — CLI PersoIA"
  homepage "https://www.persoia.com"
  version "0.6.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FishMoiLaPaix/persoia-cli/releases/download/v0.6.5/persoia-0.6.5-darwin-arm64"
      sha256 "e722ab5165afdf8b080c0345839352b93c1d4f1869031856877df26599ac0ab7"
    end
    on_intel do
      odie "PersoIA CLI n'est disponible que pour les Mac Apple Silicon (arm64)."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FishMoiLaPaix/persoia-cli/releases/download/v0.6.5/persoia-0.6.5-linux-x64"
      sha256 "e598bb3d074da99ec579c6be859820f150695224fa6509bfc57558030fe96ac8"
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
