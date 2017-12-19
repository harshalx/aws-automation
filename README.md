# aws-automation
Demonstrates aws-automation through terraform

# Setup guide

## Pre-requisites
This aws-automation demo uses terraform to spin resources. Hence download terraform first and configure its executable path into your shells $PATH variable.

## Setup your aws environment
Whether you are on aws or not setup your aws environment to specify your access and secret keys. download awscli first and then run aws-configure

## Clone this repo 
clone this repo to your working environment

## Run the demo
Run this command

`teraform plan`

Ensure there are no errors

Then run

`terraform apply`

This will create the following

1. vpc
2. router
3. internet gateway
4. subnet
5. ec2 instance [with docker installed]

