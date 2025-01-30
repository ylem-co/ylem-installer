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

## 1. Install Docker 4

Ylem uses Docker to run its containers by default. If you don't yet have Docker 4 installed, [install](https://www.docker.com/products/docker-desktop/) it from their official website for your OS.

## 2. (Optional) Configure environment variables in the .env file

This repository contains `.env` file where you can configure your connection to Apache Kafka and other integrations. 

More information is in [our documentation](https://docs.ylem.co/open-source-edition/configuring-integrations-with-.env-variables).

## 3. Install Ylem from pre-build containers

``` bash
docker compose up
```

Or 

``` bash
docker compose up -d
```

Ylem is available at http://localhost:7331/

# Using your own Apache Kafka cluster

Ylem uses Apache Kafka to exchange messages for processing pipelines and tasks. By default Ylem already comes with the pre-configured Apache Kafka container, however, you might already have an Apache Kafka cluster in your infrastructure and might want to reuse it.

In this case, you need to take the following steps:

## 1. Create Apache Kafka topics

To be able to work correctly, Ylem requires the following Apache Kafka topics to be created:

* task_runs
* task_runs_load_balanced
* task_run_results
* query_task_run_results
* notification_task_run_results

## 2. Remove Apache Kafka container from docker-compose.yml

Open `docker-compose.yml` in the same folder with this README file and remove or comment out the [following lines](https://github.com/ylem-co/ylem-installer/blob/main/docker-compose.yml#L156-L187) to exclude it from the network.

Also don't forget to remove [these](https://github.com/ylem-co/ylem-installer/blob/main/docker-compose.yml#L57-L59) and [these](https://github.com/ylem-co/ylem-installer/blob/main/docker-compose.yml#L28-L30) dependency checks.

## 3. Add your Apache Kafka host to the .env parameters

Open `.env` and replace the following value with your Kafka host:

``` bash
YLEM_KAFKA_BOOTSTRAP_SERVERS=ylem_kafka_broker:39092
```

Now if you run `docker compose up` and everything is set up correctly Ylem should be able to work with your own Kafka cluster.

# Using SSH connection for MySQL or PostgreSQL integrations

If you want to use an SSH connection to your MySQL or PostgreSQL database, you need to place your privte RSA SSH key called `id_rsa` in the folder `keys` next to this README file and it will be mounted to the container automatically.
