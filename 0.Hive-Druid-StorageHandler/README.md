# Hive Druid Storage Handler

* Druid Index should alreay be existing 
 * Use wikiticker clickstream data for example. http://druid.io/docs/latest/tutorials/tutorial-batch.html
 * There is a json task decription file which points to another json data file. 
 * Run the task using following 
```
curl -X 'POST' -H 'Content-Type:application/json' -d @my-index-task.json OVERLORD_IP:8090/druid/indexer/v1/task
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


