# Hive Druid Demo using SSB

Carter has put together scripts to generate the data and load it to Hive and Druid. 

# Steps 

## Cluster should be setup with Hive and Druid configured 

## Setup Hive LLAP and set the right value for the Hive Heap Mem. Make sure the following configs are set - 
```
HiveServer Interactive Heap Size = 2048 
Number of nodes used by LLAP = 1 
Maximum Total Concurrency = 1

TEZ
tez.runtime.io.sort.mb = 300 
```

## Setup Maven and install gcc
```
https://tecadmin.net/install-apache-maven-on-centos/#
yum install gcc
```

## Get git repo and build data geenrator code 
```
git clone https://github.com/sainib/hive-druid-ssb
cd ssb-gen
mvn clean package
```

## Run the command to generate the data 
```
bash 00datagen.sh 2 birens3.field.hortonworks.com:10500
```

## Run the load program to load the generated data to Hive and Druid. 
```
bash 00load.sh 2 birens3.field.hortonworks.com:10500 birens2.field.hortonworks.com druid '9oNio)ex1ndL'
```

## Run the query to make sure the data is loaded 
```
SET hive.druid.broker.address.default=birens2.field.hortonworks.com:8082;
select * from default.ssb_druid limit 10;
```
