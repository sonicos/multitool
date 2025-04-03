# -- prerequisites

# cosign
go install github.com/sigstore/cosign/v2/cmd/cosign@latest

# # -- additional tooling

# # Trivy
apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
apt-get update
apt-get install trivy

# shellcheck
apt-get install shellcheck

# pylint
apt-get install pylint

# checkov
pip3 install checkov

# # tfsec
go install github.com/aquasecurity/tfsec/cmd/tfsec@latest

# terraform-compliance
pip install terraform-compliance[faster_parsing]

# precommit
pip install pre-commit

# # sqlmap
git clone --depth 1 --branch 1.9 https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
# #TODO: alias for sqlmap

# # grype
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

# trufflehog
curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -v -b /usr/local/bin

# markdownlint
npm install -g markdownlint

pip3 install commentjson


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

# profile scripts
mkdir -p /opt/profile.d
cp aliases.sh /opt/profile.d
chmod -R a+r /opt/profile.d