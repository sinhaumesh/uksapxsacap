using Core as EPM;
using Util;
using PO;
using SO;
using MD;

context MDViews {
	define view BPView as SELECT from MD.BusinessPartner 
        mixin { ORDERS: Association[*] to SO.Header on ORDERS.PARTNER.PARTNERID = $projection.PARTNERID; }
        into {
			PARTNERID, 
			ORDERS
    };
    
	view BPOrdersView as select from BPView {
		PARTNERID,
		ORDERS[LIFECYCLESTATUS='N'].SALESORDERID as orderId
	}; 

	view BPOrders2View as select from BPView {
		PARTNERID,
		ORDERS[LIFECYCLESTATUS='N'].{ SALESORDERID as orderId,
        	                        GROSSAMOUNT  as grossAmt }
	};

	view BPOrders3View as select from BPView {
		PARTNERID,
		ORDERS[LIFECYCLESTATUS='N'].{ SALESORDERID as orderId,
                                GROSSAMOUNT  as grossAmt,
                                ITEMS[NETAMOUNT>200].{ PRODUCT.PRODUCTID,
                                                       NETAMOUNT }
                              }
	}; 


 define view BuyerView as SELECT from MD.BusinessPartner {
        PARTNERID as ![Id],
        EMAILADDRESS as ![EmailAddress],
        COMPANYNAME as ![CompanyName],
        ADDRESSES.CITY as ![City],
        ADDRESSES.POSTALCODE as ![PostalCode],
        ADDRESSES.STREET as ![Street],
        ADDRESSES.BUILDING as ![Building],
        ADDRESSES.COUNTRY as ![Country],
        ADDRESSES.REGION as ![Region],
        HISTORY.CREATEDBY.LOGINNAME as ![CreatedBy]
   } where PARTNERROLE = '1';
 
    define view SupplierView as SELECT from MD.BusinessPartner {
        PARTNERID as ![Id],
        EMAILADDRESS as ![EmailAddress],
        COMPANYNAME as ![CompanyName],
        ADDRESSES.CITY as ![City],
        ADDRESSES.POSTALCODE as ![PostalCode],
        ADDRESSES.STREET as ![Street],
        ADDRESSES.BUILDING as ![Building],
        ADDRESSES.COUNTRY as ![Country],
        ADDRESSES.REGION as ![Region],
        HISTORY.CREATEDBY.LOGINNAME as ![CreatedBy]
   }  where PARTNERROLE = '2';
   
   define view ProductView as SELECT from MD.Products 
        mixin { PO_ORDERS: Association[*] to PO.ItemView on PO_ORDERS.![ProductID] =  $projection.![Product_Id]; }
        into {
		PRODUCTID as ![Product_Id], 
        NAMEID,
        DESCID,				
		CATEGORY as ![Product_Category],
		CURRENCY as ![Product_Currency],
        PRICE as ![Product_Price],		
		TYPECODE as ![Product_TypeCode],
        WEIGHTMEASURE as ![Product_WeightMeasure],
        WEIGHTUNIT as ![Product_WeightUnit],
        SUPPLIER.PARTNERID as ![Supplier_Id],
        SUPPLIER.COMPANYNAME as ![Supplier_CompanyName],
        SUPPLIER.ADDRESSES.CITY as ![Supplier_City],
        SUPPLIER.ADDRESSES.POSTALCODE as ![Supplier_PostalCode],
        SUPPLIER.ADDRESSES.STREET as ![Supplier_Street],
        SUPPLIER.ADDRESSES.BUILDING as ![Supplier_Building],
        SUPPLIER.ADDRESSES.COUNTRY as ![Supplier_Country],
        PO_ORDERS
   };
   
   define view ProductValuesView as SELECT from MDViews.ProductView {
		![Product_Id], 
		PO_ORDERS.![CurrencyCode] as ![CurrencyCode],		
		SUM(PO_ORDERS.![Amount]) as ![POGrossAmount]
   } group by ![Product_Id], PO_ORDERS.![CurrencyCode];

   @Search.searchable: true 
  define View texts As Select From Util.Texts as B {
     B.TEXTID,
     B.LANGUAGE,
     B.ISOLANGUAGE,
     @Search.defaultSearchElement : true       
     B.TEXT
  }; 
  
@Search.searchable: true  
@EnterpriseSearch.enabled: true
  Define View productTexts As Select From MD.Products as A
  mixin {
			T		: association[1] to texts on A.NAMEID = T.TEXTID;
		} 
  into
  {
		@EnterpriseSearch.key : true  
		A.PRODUCTID,
		@EnterpriseSearch.usageMode: [ #AUTO_FACET ]
		@Search.defaultSearchElement : true		
		A.CATEGORY,
		@EnterpriseSearch.highlighted : {enabled : true}
		@Search.defaultSearchElement : true	
		@EnterpriseSearch.presentationMode: [ #DETAIL ]
        T.TEXT
	};
	
};