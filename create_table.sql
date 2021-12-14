DROP TABLE NEO_SHARE_CHANNEL_RATIO PURGE;
DROP TABLE NEO_WAREHOUSE_SHARE_RATIO PURGE;
DROP TABLE NEO_CHANNEL_STORAGE PURGE;
DROP TABLE NEO_SHARE_STORAGE PURGE;

DROP TABLE NEO_CHANNEL PURGE;
DROP TABLE NEO_SHARE_STORE PURGE;
DROP TABLE NEO_WAREHOUSE PURGE;
DROP TABLE NEO_STORAGE PURGE;


-- table NEO_CHANNEL
CREATE TABLE NEO_CHANNEL 
(	ID NUMBER, 
	NAME VARCHAR2(200 BYTE)
) ;



--NEO_CHANNEL_STORAGE
CREATE TABLE NEO_CHANNEL_STORAGE 
(	ID NUMBER, 
	SKU_CODE NUMBER, 
	CHANNEL_ID NUMBER, 
	QTY_PREOUT NUMBER, 
	QTY_PREIN NUMBER, 
	QTY_STORAGE NUMBER
);


--NEO_SHARE_CHANNEL_RATIO
CREATE TABLE NEO_SHARE_CHANNEL_RATIO 
(	ID NUMBER, 
	SHARE_STORE_ID NUMBER, 
	CHANNEL_ID NUMBER, 
	RATIO NUMBER
) ;


--NEO_SHARE_STORAGE
CREATE TABLE NEO_SHARE_STORAGE 
(	ID NUMBER, 
	SKU_CODE NUMBER, 
	SHARE_STORE_ID NUMBER, 
	QTY_PREOUT NUMBER, 
	QTY_PREIN NUMBER, 
	QTY_STORAGE NUMBER
);


 --NEO_SHARE_STORE
CREATE TABLE NEO_SHARE_STORE 
(   ID NUMBER, 
	NAME VARCHAR2(200 BYTE)
) ;


--NEO_WAREHOUSE
CREATE TABLE NEO_WAREHOUSE 
(	ID NUMBER, 
	NAME VARCHAR2(200 BYTE)
);


--NEO_WAREHOUSE_SHARE_RATIO
CREATE TABLE NEO_WAREHOUSE_SHARE_RATIO 
(	ID NUMBER, 
	WAREHOUSE_ID NUMBER, 
	SHARE_STORE_ID NUMBER, 
	RATIO NUMBER
);
	  
	 
CREATE TABLE NEO_STORAGE
(	ID NUMBER, 
	SKU_CODE NUMBER, 
	WAREHOUSE_ID NUMBER, 
	QTY_PREOUT NUMBER, 
	QTY_PREIN NUMBER, 
	QTY_STORAGE NUMBER,
	QTY_SHARE NUMBER,
	QTY_AVAILABLE NUMBER
)  ;

	  
--CREATE PK	  
ALTER TABLE NEO_CHANNEL ADD CONSTRAINT PK_CHANNEL_ID PRIMARY KEY (ID) USING INDEX  ENABLE;

ALTER TABLE NEO_SHARE_CHANNEL_RATIO ADD CONSTRAINT PK_SHARE_CHANNEL_RATIO_ID PRIMARY KEY (ID) USING INDEX  ENABLE;  

ALTER TABLE NEO_CHANNEL_STORAGE ADD CONSTRAINT PK_CHANNEL_STORAGE_ID PRIMARY KEY (ID) USING INDEX  ENABLE;

ALTER TABLE NEO_SHARE_STORAGE ADD CONSTRAINT PK_SHARE_STORAGE_ID PRIMARY KEY (ID) USING INDEX  ENABLE;	 

ALTER TABLE NEO_SHARE_STORE ADD CONSTRAINT PK_SHARE_STORE_ID PRIMARY KEY (ID) USING INDEX  ENABLE;

ALTER TABLE NEO_WAREHOUSE_SHARE_RATIO ADD CONSTRAINT PK_WAREHOUSE_SHARE_RATIO_ID PRIMARY KEY (ID) USING INDEX  ENABLE;

ALTER TABLE NEO_WAREHOUSE ADD CONSTRAINT PK_WAREHOUSE_ID PRIMARY KEY (ID) USING INDEX  ENABLE;

ALTER TABLE NEO_STORAGE ADD CONSTRAINT PK_NEO_STORAGE_ID PRIMARY KEY (ID) USING INDEX  ENABLE;


-- create foreinkey

ALTER TABLE NEO_CHANNEL_STORAGE ADD CONSTRAINT FK_NEO_CHANNEL_STORAGE__CHANNEL_ID FOREIGN KEY (CHANNEL_ID)
	  REFERENCES NEO_CHANNEL (ID) ENABLE;
	  
ALTER TABLE NEO_SHARE_CHANNEL_RATIO ADD CONSTRAINT FK_NEO_SHARE_CHANNEL_RATIO__SHARE_STORE_ID FOREIGN KEY (SHARE_STORE_ID)
	  REFERENCES NEO_SHARE_STORE (ID) ENABLE;

ALTER TABLE NEO_SHARE_CHANNEL_RATIO ADD CONSTRAINT FK_NEO_SHARE_CHANNEL_RATIO__CHANNEL_ID FOREIGN KEY (CHANNEL_ID)
	  REFERENCES NEO_CHANNEL (ID) ENABLE;	  

ALTER TABLE NEO_SHARE_STORAGE ADD CONSTRAINT FK_NEO_SHARE_STORAGE__SHARE_STORE_ID FOREIGN KEY (SHARE_STORE_ID)
	  REFERENCES NEO_SHARE_STORE (ID) ENABLE;
	  
ALTER TABLE NEO_WAREHOUSE_SHARE_RATIO ADD CONSTRAINT FK_NEO_WAREHOUSE_SHARE_RATIO__WAREHOUSE_ID FOREIGN KEY (WAREHOUSE_ID)
	  REFERENCES NEO_WAREHOUSE (ID) ENABLE;

ALTER TABLE NEO_WAREHOUSE_SHARE_RATIO ADD CONSTRAINT FK_NEO_WAREHOUSE_SHARE_RATIO__SHARE_STORE_ID FOREIGN KEY (SHARE_STORE_ID)
	  REFERENCES NEO_SHARE_STORE (ID) ENABLE;	

ALTER TABLE NEO_STORAGE ADD CONSTRAINT FK_NEO_STORAGE__STORAGE_WAREHOUSE_ID FOREIGN KEY (WAREHOUSE_ID)
	  REFERENCES NEO_WAREHOUSE (ID) ENABLE;	  