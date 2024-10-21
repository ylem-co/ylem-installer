<p align="center">
  <img width="748" title="Ylem. The open-source data streaming platform" alt="Ylem. The open-source data streaming platform" src="https://github.com/user-attachments/assets/385e8209-a4fe-4846-8499-e156ce2d2403">
</p>

<div align="center">

  <a href="https://github.com/ylem-co/ylem?tab=Apache-2.0-1-ov-file">![Static Badge](https://img.shields.io/badge/license-Apache%202.0-black)</a>
  <a href="https://ylem.co" target="_blank">![Static Badge](https://img.shields.io/badge/website-ylem.co-black)</a>
  <a href="https://docs.ylem.co" target="_blank">![Static Badge](https://img.shields.io/badge/documentation-docs.ylem.co-black)</a>
  <a href="https://join.slack.com/t/ylem-co/shared_invite/zt-2nawzl6h0-qqJ0j7Vx_AEHfnB45xJg2Q" target="_blank">![Static Badge](https://img.shields.io/badge/community-join%20Slack-black)</a>
</div>

# Ylem installer
Ylem is an open-source data streaming platform that is a one-stop-shop solution for orchestrating data streams on top of Apache Kafka, Amazon SQS, Google Pub/Sub, RabbitMQ, various APIs, and data storages.

This repository contains installation files that allow you to set up Ylem from the pre-build containers.

# Installation

## 1. Install dependencies

To run Ylem, the following dependencies must be first installed and configured.

### Docker 4

If you don't yet have Docker 4 installed, [install](https://www.docker.com/products/docker-desktop/) it from their official website for your OS.

### Apache Kafka

Ylem uses Apache Kafka to process pipelines and tasks. [Install](https://kafka.apache.org/) it from their official website or skip this step if you already have it installed.

We also recommend that you install the Apache Kafka GUI software to manage its topics and subscriptions.

## 2. Create Kafka topics

To be able to work correctly, Ylem requires the following Apache Kafka topics to be created:

* task_runs
* task_runs_load_balanced
* task_run_results
* query_task_run_results
* notification_task_run_results

## 3. (Optional) Configure environment variables in the .env file

This repository contains `.env` file where you can configure your connection to Apache Kafka and other integrations. 

More information is in [our documentation](https://docs.ylem.co/open-source-edition/configuring-integrations-with-.env-variables).

## 4. Install Ylem from pre-build containers

``` bash
docker compose up
```

Or 

``` bash
docker compose up -d
```

Ylem is available at http://localhost:7331/

## Using SSH connection for MySQL or PostgreSQL integrations

If you want to use an SSH connection to your MySQL or PostgreSQL database, you need to place your public RSA SSH key called id_rsa.pub in the folder `keys` next to this README file and it will be mounted to the container automatically.
