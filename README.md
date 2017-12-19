# aws-automation
Demonstrates aws-automation through terraform

# Setup guide

## Pre-requisites
This aws-automation demo uses terraform to spin resources. Hence download terraform first and configure its executable path into your shells $PATH variable.

## Setup your aws environment
Whether you are on aws or not setup your aws environment to specify your access and secret keys. download awscli first and then run aws-configure

## Clone this repo 
clone this repo to your working environment

## run the demo
1) Run this command

`teraform plan`

Ensure there are no errors

2) Then run
`terraform apply`

This will create the entire group of resources right from a VPC to router to internet gateway to your aws instance, install docker on it and then install the relevant container. 

