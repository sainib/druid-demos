create database if not exists tpcds_raw;
use tpcds_raw;


drop table if exists customer;
create external table customer (cCustomerId BIGINT, 
cCurrentCdemoSk BIGINT,
cCurrentHdemoSk BIGINT,
cCurrentAddrSk BIGINT,
cFirstShiptoDateId BIGINT,
cFirstSalesDateId BIGINT,
cSalutation STRING,
cFirstName STRING,
cLastName STRING,
cPreferredCustFlag STRING,
cBirthDay INT,
cBirthMonth INT,
cBirthYear INT,
cBirthCountry STRING,
cEmailAddress STRING,
cLastReviewDate INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/data/tpcds/raw/customer';



drop table if exists item;
create external table item 
(
iItemId  BIGINT,
iItemSk  BIGINT,
iRecStartDateId   BIGINT,
iRecEndDateId  STRING,
iItemDesc  STRING,
iCurrentPrice  DOUBLE,
iWholesaleCost  DOUBLE,
iBrandId BIGINT,
iBrand STRING,
iClassId BIGINT,
iClass STRING,
iCategoryId BIGINT,
iCategory STRING,
iManufactId BIGINT,
iManufact STRING,
iSize STRING,
iFormulation STRING,
iColor  STRING,
iUnits STRING,
iContainer STRING,
iManagerId  BIGINT,
iProductName 
iPromoSk 
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/data/tpcds/raw/item';



drop table if exists lineitem;
create external table lineitem 
(L_ORDERKEY BIGINT,
 L_PARTKEY BIGINT,
 L_SUPPKEY BIGINT,
 L_LINENUMBER INT,
 L_QUANTITY DOUBLE,
 L_EXTENDEDPRICE DOUBLE,
 L_DISCOUNT DOUBLE,
 L_TAX DOUBLE,
 L_RETURNFLAG STRING,
 L_LINESTATUS STRING,
 L_SHIPDATE STRING,
 L_COMMITDATE STRING,
 L_RECEIPTDATE STRING,
 L_SHIPINSTRUCT STRING,
 L_SHIPMODE STRING,
 L_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '/data/tpcds/raw/lineitem';

drop table if exists part;
create external table part (P_PARTKEY BIGINT,
 P_NAME STRING,
 P_MFGR STRING,
 P_BRAND STRING,
 P_TYPE STRING,
 P_SIZE INT,
 P_CONTAINER STRING,
 P_RETAILPRICE DOUBLE,
 P_COMMENT STRING) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '/data/tpcds/raw/part/';

drop table if exists supplier;
create external table supplier (S_SUPPKEY BIGINT,
 S_NAME STRING,
 S_ADDRESS STRING,
 S_NATIONKEY BIGINT,
 S_PHONE STRING,
 S_ACCTBAL DOUBLE,
 S_COMMENT STRING) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '/data/tpcds/raw/supplier/';

drop table if exists partsupp;
create external table partsupp (PS_PARTKEY BIGINT,
 PS_SUPPKEY BIGINT,
 PS_AVAILQTY INT,
 PS_SUPPLYCOST DOUBLE,
 PS_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION'/data/tpcds/raw/partsupp';

drop table if exists nation;
create external table nation (N_NATIONKEY BIGINT,
 N_NAME STRING,
 N_REGIONKEY BIGINT,
 N_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/data/tpcds/raw/nation';

drop table if exists region;
create external table region (R_REGIONKEY BIGINT,
 R_NAME STRING,
 R_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/data/tpcds/raw/region';



drop table if exists orders;
create external table orders (O_ORDERKEY BIGINT,
 O_CUSTKEY BIGINT,
 O_ORDERSTATUS STRING,
 O_TOTALPRICE DOUBLE,
 O_ORDERDATE STRING,
 O_ORDERPRIORITY STRING,
 O_CLERK STRING,
 O_SHIPPRIORITY INT,
 O_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/data/tpcds/raw/orders';
