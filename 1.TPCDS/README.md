# Goal 

Use TPC-DS dataset to demonstrate the Hive LLAP and Druid (via Hive Storage Handler) capability and performance. 

# Approach 

Load the TPC DS data in CSV (Pipe delimited) format to Hive. Create replica of each table with JSON Serde and load data from CSV tables into JSON tables. 
Extract the 


# Setup Environment 

## Install Git 
sudo yum -y install git

## Install Maven 
cd /usr/local
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
sudo tar xzf apache-maven-3.5.2-bin.tar.gz
sudo ln -s apache-maven-3.5.2  maven
sudo vi /etc/profile.d/maven.sh
```
export M2_HOME=/usr/local/maven
export PATH=${M2_HOME}/bin:${PATH}
```
sudo vi ~/.bash_profile
```
source /etc/profile.d/maven.sh
```
. ./.bash_profile

mvn -version 
rm -f /usr/local/apache-maven-3.5.2-bin.tar.gz


## Get TPC-DS data generator 
cd
git clone https://github.com/sainib/tpcds
cd tpcds
mvn clean package 

## Hive processing 


SET hive.druid.broker.address.default=birens4.field.hortonworks.com:8082;
add jar hdfs:///tmp/hive-druid-handler.jar;
https://github.com/Agirish/tpcds
