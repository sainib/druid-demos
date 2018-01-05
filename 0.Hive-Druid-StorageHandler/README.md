# Hive Druid Storage Handler

* Druid Index should alreay be existing 
 * Use wikiticker clickstream data for example. http://druid.io/docs/latest/tutorials/tutorial-batch.html
 * There is a json task decription file which points to the json data file. The JSON data file MUST be on HDFS.. The path of in the index task file should point to the HDFS path. 

 * Setup Hive LLAP and set the right value for the Hive Heap Mem. Make sure the following configs are set - 
```
HiveServer Interactive Heap Size = 2048 
Number of nodes used by LLAP = 1 
Maximum Total Concurrency = 1

TEZ
tez.runtime.io.sort.mb = 300 
```

 * Run the following commands to create the druid index task file 
```
cd /usr/hdp/2.6.3.0-235/druid/quickstart/
cp wikiticker-* ~
cd
vi wikiticker-index.json 
```

 * Change the line number 7 in the file wikiticker-index.json
```
      3   "spec" : {
      4     "ioConfig" : {
      5       "type" : "hadoop",
      6       "inputSpec" : {
      7         "type" : "static",
      8         "paths" : "/tmp/wikiticker-2015-09-12-sampled.json"
      9       }
     10     },
     11     "dataSchema" : {
     12       "dataSource" : "wikiticker",
     13       "granularitySpec" : {
     14         "type" : "uniform",
     15         "segmentGranularity" : "day",
     16         "queryGranularity" : "none",

```

 * Run the following command 
```
gunzip wikiticker-2015-09-12-sampled.json.gz 
hdfs dfs -put wikiticker-2015-09-12-sampled.json /tmp/wikiticker-2015-09-12-sampled.json
curl -X 'POST' -H 'Content-Type:application/json' -d @wikiticker-index.json localhost:8090/druid/indexer/v1/task
```

 * Status of task can be seem on the Overlord UI. From Ambari Quick Links. 

* Once the data is loaded, login to Hive LLAP. <<--- Very Important: Druid integration only works with Hive LLLAP. 

* Add the Hive Druid Storage Handlerjar file to HDFS. 
```
hdfs dfs -put /usr/hdp/2.6.1.0-129/hive2/lib/hive-druid-handler.jar /tmp/
hdfs dfs -chmod 777 /tmp/hive-druid-handler.jar
```
* Add the jar file to hive 
```
beeline> add jar hdfs:///tmp/hive-druid-handler.jar
```
* SET the property to point to Druid Broker
```
SET hive.druid.broker.address.default=DRUID_BROKER_SERVER:8082;
```
* Run the query to create the table
```
CREATE EXTERNAL TABLE druid_table_1
STORED BY 'org.apache.hadoop.hive.druid.DruidStorageHandler'
TBLPROPERTIES ("druid.datasource" = "wikiticker");
```
