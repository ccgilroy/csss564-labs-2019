#!/usr/bin/env bash
zip -r zip/01-setup.zip 01-setup/ -x "*/.*" "*.rds"
zip -r zip/02-simulating-distributions.zip 02-simulating-distributions/ -x "*/.*" "*.rds"
zip -r zip/03-priors.zip 03-priors/ -x "*/.*" "*.rds"
