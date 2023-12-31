@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_PROD {
key PRODUCTID: String(10); 
PRODUCT_TYPECODE: String(2);
PRODUCT_CATEGORY: String(40);
PRODUCT_CURRENCY: String(5);
PRODUCT_WEIGHTUNIT: String(3);
PRODUCT_WEIGHTMEASURE: Decimal(13,3);
PRODUCT_PRICE: Decimal(15,2);
PRODUCTPICURL: String(255);
PRODUCT_NAME: String(1024);
PRODUCT_DESCRIPTION: String(1024);
SUPPLIER_ID: String(10);
COMPANYNAME: String(80);
SUPPLIER_CITY: String(40);
SUPPLIER_POSTALCODE: String(10);
SUPPLIER_STREET: String(60);
SUPPLIER_BUILDING: String(10);
SUPPLIER_COUNTRY: String(3);
SUPPLIER_REGION: String(4);
}

@cds.persistence.exists
Entity PO_POVIEW {
key PURCHASEORDERID: String(10);
PURCHASEORDERITEM: String(10);
PARTNERID: String(10);
PRODUCTID: String(10);
CURRENCY: String(5);
GROSSAMOUNT: Decimal(15,2);
NETAMOUNT: Decimal(15,2);
TAXAMOUNT: Decimal(15,2);
QUANTITY: Decimal(13,3);
QUANTITYUNIT: String(3);
DELIVERYDATE: Date;
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_PO_HEADER_EN {
key PURCHASEORDERID: String(10);
key PURCHASEORDERITEM: String(10);
APPROVALSTATUS: String(1); 
CONFIRMSTATUS: String(1);
CURRENCY: String(5);
GROSSAMOUNT: Decimal(15,2);
HISTORY_CHANGEDAT: Date;
HISTORY_CHANGEDBY_EMPLOYEEID: String(10);
HISTORY_CREATEDAT: Date;
HISTORY_CREATEDBY_EMPLOYEEID: String(10);
INVOICINGSTATUS: String(1);
LIFECYCLESTATUS: String(1);
NETAMOUNT: Decimal(15,2); 
NOTEID: String(10);
ORDERINGSTATUS: String(1);
PARTNER_PARTNERID: String(10);
TAXAMOUNT: Decimal(15,2);
APPROVALSTATUSDESC: String(60);
CONFIRMSTATUSDESC: String(60);
LIFECYCLESTATUSDESC: String(60);
ORDERINGSTATUSDESC: String(60);
PRODUCT_PRODUCTID: String(10);
PRODUCTNAME: String(1024);
CATEGORY: String(40);
CITY: String(40);
COMPANYNAME: String(80);
LEGALFORM: String(10);
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_PO_ITEM {
key PURCHASEORDERID: String(10);
key PURCHASEORDERITEM: String(10);
PRODUCTNAME: String(1024);
TAXAMOUNT: Decimal(15,2);
PRODUCT_PRODUCTID: String(10);
CURRENCY: String(5);
GROSSAMOUNT: Decimal(15,2);
NETAMOUNT: Decimal(15,2); 
QUANTITY: Decimal(13,3);
QUANTITYUNIT: String(3);
DELIVERYDATE: Date;
CATEGORY: String(40);
}

@cds.persistence.exists
Entity PO_HEADERVIEW {
key PURCHASEORDERID: String(10);
CREATEDBYEMPLOYEEID: String(10);
CREATEDBYFIRSTNAME: String(40);
CREATEDBYLASTNAME: String(40);
CREATEDBYLOGINNAME: String(12);
CREATEDAT: Date;
PARTNERID: String(10);
COMPANYNAME: String(80);
CURRENCY: String(5);
GROSSAMOUNT: Decimal(15,2);
NETAMOUNT: Decimal(15,2); 
TAXAMOUNT: Decimal(15,2);
POData: Association to many SAP_HANA_DEMOCONTENT_EPM_MODELS_PO_ITEM on POData.PURCHASEORDERID=PURCHASEORDERID;
}
@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_CUSTOMER_DISCOUNT_BY_RANKING_AND_REGION{
key REGION: String(4);
key COMPANY_NAME: String(80);
key DISCOUNT: Decimal(15,2);
SALES_AMER: Decimal(18,2);
SALES_EMEA: Decimal(18,2);
SALES_AFR: Decimal(18,2);
SALES_APJ: Decimal(18,2);
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_SALESORDER_DYNAMIC_JOIN {
REGION: String(4);
TOTAL_SALES: Decimal(15,2); 
SALES: Decimal(15,2);
SHARE_SALES: Decimal(12,5);
COUNTRY: String(3);
PRODUCTID: String(10);
PRODUCT_NAME: String(1024);
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_SALESORDER_RANKING {
key COMPANY_NAME: String(20);
ORDERS: String(20);
ORDER_RANK: String(20);
SALES: String(20);
SALES_RANK: String(20);
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_SALES_YEAR_COMPARISON(
IP_YEAR_1: String(4),
IP_YEAR_2: String(4)
){
key PRODUCT_CATEGORY: String(40);
YEAR: String(4);
YEAR1_NET_AMOUNT: Decimal(15,2);
YEAR2_NET_AMOUNT: Decimal(15,2);
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_BUYER {
key PARTNERID: String(10);
PARTNERROLE: String(3);
EMAILADDRESS: String(255);
COMPANYNAME: String(80);
LEGALFORM: String(10);
CITY: String(40);
POSTALCODE: String(10);
BUILDING: String(10);
STREET: String(60);
COUNTRY: String(3);
REGION: String(4);
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_SALES_OVERVIEW_WO_CURR_CONV_OPT_WRAPPER {
BILLINGSTATUS: String(1);
COMPANYNAME: String(80);
CURRENCY: String(5); 
DELIVERYSTATUS: String(1);
HISTORY_CREATEDBY: String(10);
LIFECYCLESTATUS: String(1);
PARTNERID: String(10);
PRODUCTID: String(10);
PRODUCTID_1: String(10);
PRODUCTPICURL: String(255);
PRODUCT_CATEGORY: String(40);
PRODUCT_CURRENCY: String(5);
PRODUCT_DESCRIPTION: String(1024); 
PRODUCT_NAME: String(1024);
PRODUCT_TYPECODE: String(2);
PRODUCT_WEIGHTUNIT: String(3);
QUANTITYUNIT: String(3);
key SALESORDERID: String(10);
key SALESORDERITEM: String(10);
SUPPLIER_BUILDING: String(10);
SUPPLIER_CITY: String(40);
SUPPLIER_COUNTRY: String(3);
SUPPLIER_ID: String(10);
SUPPLIER_POSTALCODE: String(10);
SUPPLIER_REGION: String(4);
SUPPLIER_STREET: String(60);
NETAMOUNT: Decimal(15,2);
POSTING_DATE: Date;
PRODUCT_PRICE: Decimal(15,2);
PRODUCT_WEIGHTMEASURE: Decimal(13,3);
QUANTITY: Decimal(13,3);
RM_AMOUNT_COMPLETED: Decimal(15,2);
RM_AMOUNT_DELIVERED: Decimal(15,2);
RM_AMOUNT_INPROCESS: Decimal(15,2);
RM_AMOUNT_NEW: Decimal(15,2);
RM_AMOUNT_PAID: Decimal(15,2);
RM_AMOUNT_UNDELIVERED: Decimal(15,2);
RM_AMOUNT_UNPAID: Decimal(15,2);
TAXAMOUNT: Decimal(15,2);
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_SALES_ORDER_HEADER_W_BUYER {
key SALESORDERID: String(10);
BILLINGSTATUS: String(1);
CURRENCY: String(5); 
DELIVERYSTATUS: String(1);
GROSSAMOUNT: Decimal(15,2);
HISTORY_CHANGEDAT: Date;
HISTORY_CHANGEDBY_EMPLOYEEID: String(10);
HISTORY_CREATEDAT: Date;
HISTORY_CREATEDBY_EMPLOYEEID: String(10);
LIFECYCLESTATUS: String(1);
NETAMOUNT: Decimal(15,2); 
NOTEID: String(10);
PARTNER_PARTNERID: String(10);
TAXAMOUNT: Decimal(15,2);
BUILDING: String(10);
CITY: String(40);
COMPANYNAME: String(80);
COUNTRY: String(3);
EMAILADDRESS: String(255);
LEGALFORM: String(10);
PARTNERID: String(10);
PARTNERROLE: String(3);
POSTALCODE: String(10);
REGION: String(4);
STREET: String(60);
SalesOrderItem: Association to many SAP_HANA_DEMOCONTENT_EPM_MODELS_SALES_OVERVIEW_WO_CURR_CONV_OPT_WRAPPER on SalesOrderItem.SALESORDERID=SALESORDERID;
}

@cds.persistence.exists
Entity SO_ITEM {
key SALESORDERID: String(10);
SALESORDERITEM: String(10);
PRODUCT_PRODUCTID: String(10);
NOTEID: String(10);
CURRENCY: String(5);
GROSSAMOUNT: Decimal(15,2);
NETAMOUNT: Decimal(15,2);
TAXAMOUNT: Decimal(15,2);
ITEMATPSTATUS: String(1);
OPITEMPOS: String(10);
QUANTITY: Decimal(13,3);
QUANTITYUNIT: String(3);
DELIVERYDATE: Date;
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_SPATIAL_MODELS_REGION_PRODUCT {
key SALESORDERID: String(10);
key SALESORDERITEM: String(10);
LATITUDE: Double;
LONGITUDE: Double;
QUANTITY: Decimal(13,3);
PRODUCT_PRODUCTID: String(10);
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity SAP_HANA_DEMOCONTENT_EPM_SPATIAL_MODELS_PRODUCT_SALES {
PRODUCT_PRODUCTID: String(10);
YEAR_OF_SALE: String(1);
GROSSAMOUNT_1: Decimal(15,2);
}

@cds.persistence.exists 
@cds.persistence.calcview
Entity SAP_HANA_DEMOCONTENT_EPM_SPATIAL_MODELS_BP_ADDRESS_DETAILS {
ADDRESSID: String(10);
CITY: String(40);
POSTALCODE: String(10);
STREET: String(60);
BUILDING: String(10);
COUNTRY: String(3);
REGION: String(4);
LATITUDE: Double;
LONGITUDE: Double;
PARTNERID: String(10);
EMAILADDRESS: String(255);
PHONENUMBER: String(30);
FAXNUMBER: String(30);
WEBADDRESS: String(1024);
COMPANYNAME: String(80);
LEGALFORM: String(10);
}

@cds.persistence.exists 
@cds.persistence.calcview
Entity SAP_HANA_DEMOCONTENT_EPM_MODELS_PURCHASE_COMMON_CURRENCY {
PURCHASEORDERID: String(10);
PURCHASEORDERITEM: String(10);
CURRENCY: String(5);
CATEGORY: String(40);
CITY: String(40);
COMPANYNAME: String(80);
POSTALCODE: String(10);
PARTNERID: String(10);
PRODUCTID: String(10);
HISTORY_CREATEDAT: Date;
GROSSAMOUNT: Decimal(15,2);
CONVGROSSAMOUNT: Decimal(13,2);
}
