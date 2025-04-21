# -- prerequisites

# cosign
go install github.com/sigstore/cosign/v2/cmd/cosign@latest

# # -- additional tooling

# # Trivy
apt-get update
apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
apt-get update
apt-get install trivy

# shellcheck
apt-get install shellcheck

# pylint
apt-get install pylint

# # tfsec
go install github.com/aquasecurity/tfsec/cmd/tfsec@latest

# # sqlmap
git clone --depth 1 --branch 1.9 https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
# #TODO: alias for sqlmap

# # grype
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

# trufflehog
curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -v -b /usr/local/bin

# dockle
DOCKLE_VERSION=$(
 curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | \
 grep '"tag_name":' | \
 sed -E 's/.*"v([^"]+)".*/\1/' \
)
DOCKLE_ARCH="unknown"; case "$(uname -m)" in aarch64|arm64) DOCKLE_ARCH="ARM64" ;; x86_64) DOCKLE_ARCH="64bit" ;; esac;
curl -L -o /tmp/dockle.deb https://github.com/goodwithtech/dockle/releases/download/v${DOCKLE_VERSION}/dockle_${DOCKLE_VERSION}_Linux-${DOCKLE_ARCH}.deb
sudo dpkg -i /tmp/dockle.deb && rm /tmp/dockle.deb

curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh

# markdownlint
npm install -g markdownlint

# act
cd /usr/local
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# terraform-compliance
pip install terraform-compliance[faster_parsing]

# precommit
pip install pre-commit

# -- docker aliased --
# gitleaks
# talisman
# hadolint
# tflint
# zap
# dockle
# infracost
# trivy
# tfsec
# sqlmap - https://hub.docker.com/r/parrotsec/sqlmap
# grype - https://hub.docker.com/r/anchore/grype
# trufflehog - https://hub.docker.com/r/trufflesecurity/trufflehog

# -- additional setup
# Cleanup go
go clean
go clean -cache
go clean -testcache
go clean -modcache

#cleanup apt
apt-get clean
rm -rf /var/lib/apt/lists/*