#!/usr/bin/env bash
zip -r zip/01-setup.zip 01-setup/ -x "*/.*" "*.rds"
zip -r zip/02-simulating-distributions.zip 02-simulating-distributions/ -x "*/.*" "*.rds"
zip -r zip/03-priors.zip 03-priors/ -x "*/.*" "*.rds"
zip -r zip/04-mcmc.zip 04-mcmc/ -x "*/.*" "*.rds"
zip -r zip/05-regression.zip 05-regression/ -x "*/.*" "*.rds"
zip -r zip/06-multilevel.zip 06-multilevel/ -x "*/.*" "*.rds"
