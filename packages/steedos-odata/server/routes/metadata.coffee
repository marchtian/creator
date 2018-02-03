WebApp.connectHandlers.use '/odata/v4/$metadata', (req, res, next) ->
	console.log "/odata/v4/$metadata"
	try
		data = '<?xml version="1.0" encoding="utf-8"?><edmx:Edmx Version="4.0" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx"><edmx:DataServices><Schema Namespace="ODataDemo" xmlns="http://docs.oasis-open.org/odata/ns/edm"><EntityType Name="Product"><Key><PropertyRef Name="ID" /></Key><Property Name="ID" Type="Edm.Int32" Nullable="false" /><Property Name="Name" Type="Edm.String" /><Property Name="Description" Type="Edm.String" /><Property Name="ReleaseDate" Type="Edm.DateTimeOffset" Nullable="false" /><Property Name="DiscontinuedDate" Type="Edm.DateTimeOffset" /><Property Name="Rating" Type="Edm.Int16" Nullable="false" /><Property Name="Price" Type="Edm.Double" Nullable="false" /><NavigationProperty Name="Categories" Type="Collection(ODataDemo.Category)" Partner="Products" /><NavigationProperty Name="Supplier" Type="ODataDemo.Supplier" Partner="Products" /><NavigationProperty Name="ProductDetail" Type="ODataDemo.ProductDetail" Partner="Product" /></EntityType><EntityType Name="FeaturedProduct" BaseType="ODataDemo.Product"><NavigationProperty Name="Advertisement" Type="ODataDemo.Advertisement" Partner="FeaturedProduct" /></EntityType><EntityType Name="ProductDetail"><Key><PropertyRef Name="ProductID" /></Key><Property Name="ProductID" Type="Edm.Int32" Nullable="false" /><Property Name="Details" Type="Edm.String" /><NavigationProperty Name="Product" Type="ODataDemo.Product" Partner="ProductDetail" /></EntityType><EntityType Name="Category" OpenType="true"><Key><PropertyRef Name="ID" /></Key><Property Name="ID" Type="Edm.Int32" Nullable="false" /><Property Name="Name" Type="Edm.String" /><NavigationProperty Name="Products" Type="Collection(ODataDemo.Product)" Partner="Categories" /></EntityType><EntityType Name="Supplier"><Key><PropertyRef Name="ID" /></Key><Property Name="ID" Type="Edm.Int32" Nullable="false" /><Property Name="Name" Type="Edm.String" /><Property Name="Address" Type="ODataDemo.Address" /><Property Name="Location" Type="Edm.GeographyPoint" SRID="Variable" /><Property Name="Concurrency" Type="Edm.Int32" ConcurrencyMode="Fixed" Nullable="false" /><NavigationProperty Name="Products" Type="Collection(ODataDemo.Product)" Partner="Supplier" /></EntityType><ComplexType Name="Address"><Property Name="Street" Type="Edm.String" /><Property Name="City" Type="Edm.String" /><Property Name="State" Type="Edm.String" /><Property Name="ZipCode" Type="Edm.String" /><Property Name="Country" Type="Edm.String" /></ComplexType><EntityType Name="Person"><Key><PropertyRef Name="ID" /></Key><Property Name="ID" Type="Edm.Int32" Nullable="false" /><Property Name="Name" Type="Edm.String" /><NavigationProperty Name="PersonDetail" Type="ODataDemo.PersonDetail" Partner="Person" /></EntityType><EntityType Name="Customer" BaseType="ODataDemo.Person"><Property Name="TotalExpense" Type="Edm.Decimal" Nullable="false" /></EntityType><EntityType Name="Employee" BaseType="ODataDemo.Person"><Property Name="EmployeeID" Type="Edm.Int64" Nullable="false" /><Property Name="HireDate" Type="Edm.DateTimeOffset" Nullable="false" /><Property Name="Salary" Type="Edm.Single" Nullable="false" /></EntityType><EntityType Name="PersonDetail"><Key><PropertyRef Name="PersonID" /></Key><Property Name="PersonID" Type="Edm.Int32" Nullable="false" /><Property Name="Age" Type="Edm.Byte" Nullable="false" /><Property Name="Gender" Type="Edm.Boolean" Nullable="false" /><Property Name="Phone" Type="Edm.String" /><Property Name="Address" Type="ODataDemo.Address" /><Property Name="Photo" Type="Edm.Stream" Nullable="false" /><NavigationProperty Name="Person" Type="ODataDemo.Person" Partner="PersonDetail" /></EntityType><EntityType Name="Advertisement" HasStream="true"><Key><PropertyRef Name="ID" /></Key><Property Name="ID" Type="Edm.Guid" Nullable="false" /><Property Name="Name" Type="Edm.String" /><Property Name="AirDate" Type="Edm.DateTimeOffset" Nullable="false" /><NavigationProperty Name="FeaturedProduct" Type="ODataDemo.FeaturedProduct" Partner="Advertisement" /></EntityType><EntityContainer Name="DemoService"><EntitySet Name="Products" EntityType="ODataDemo.Product"><NavigationPropertyBinding Path="ODataDemo.FeaturedProduct/Advertisement" Target="Advertisements" /><NavigationPropertyBinding Path="Categories" Target="Categories" /><NavigationPropertyBinding Path="Supplier" Target="Suppliers" /><NavigationPropertyBinding Path="ProductDetail" Target="ProductDetails" /></EntitySet><EntitySet Name="ProductDetails" EntityType="ODataDemo.ProductDetail"><NavigationPropertyBinding Path="Product" Target="Products" /></EntitySet><EntitySet Name="Categories" EntityType="ODataDemo.Category"><NavigationPropertyBinding Path="Products" Target="Products" /></EntitySet><EntitySet Name="Suppliers" EntityType="ODataDemo.Supplier"><NavigationPropertyBinding Path="Products" Target="Products" /></EntitySet><EntitySet Name="Persons" EntityType="ODataDemo.Person"><NavigationPropertyBinding Path="PersonDetail" Target="PersonDetails" /></EntitySet><EntitySet Name="PersonDetails" EntityType="ODataDemo.PersonDetail"><NavigationPropertyBinding Path="Person" Target="Persons" /></EntitySet><EntitySet Name="Advertisements" EntityType="ODataDemo.Advertisement"><NavigationPropertyBinding Path="FeaturedProduct" Target="Products" /></EntitySet></EntityContainer><Annotations Target="ODataDemo.DemoService"><Annotation Term="Org.OData.Display.V1.Description" String="This is a sample OData service with vocabularies" /></Annotations><Annotations Target="ODataDemo.Product"><Annotation Term="Org.OData.Display.V1.Description" String="All Products available in the online store" /></Annotations><Annotations Target="ODataDemo.Product/Name"><Annotation Term="Org.OData.Display.V1.DisplayName" String="Product Name" /></Annotations><Annotations Target="ODataDemo.DemoService/Suppliers"><Annotation Term="Org.OData.Publication.V1.PublisherName" String="Microsoft Corp." /><Annotation Term="Org.OData.Publication.V1.PublisherId" String="MSFT" /><Annotation Term="Org.OData.Publication.V1.Keywords" String="Inventory, Supplier, Advertisers, Sales, Finance" /><Annotation Term="Org.OData.Publication.V1.AttributionUrl" String="http://www.odata.org/" /><Annotation Term="Org.OData.Publication.V1.AttributionDescription" String="All rights reserved" /><Annotation Term="Org.OData.Publication.V1.DocumentationUrl " String="http://www.odata.org/" /><Annotation Term="Org.OData.Publication.V1.TermsOfUseUrl" String="All rights reserved" /><Annotation Term="Org.OData.Publication.V1.PrivacyPolicyUrl" String="http://www.odata.org/" /><Annotation Term="Org.OData.Publication.V1.LastModified" String="4/2/2013" /><Annotation Term="Org.OData.Publication.V1.ImageUrl " String="http://www.odata.org/" /></Annotations></Schema></edmx:DataServices></edmx:Edmx>'


		res.setHeader('Content-type', 'application/xml');
		res.end(data)
	catch e
		console.error e.stack
		JsonRoutes.sendResult res,
			code: 200
			data: { errors: [{errorMessage: e.message}] }


WebApp.connectHandlers.use '/odata/v4/ppppp', (req, res, next) ->
	console.log "/odata/v4/ppppp"
	try
		data = {"@odata.context":"http://services.odata.org/V4/OData/OData.svc/$metadata#Products","value":[{"ID":0,"Name":"Bread","Description":"Whole grain bread","ReleaseDate":"1992-01-01T00:00:00Z","DiscontinuedDate":null,"Rating":4,"Price":2.5},{"ID":1,"Name":"Milk","Description":"Low fat milk","ReleaseDate":"1995-10-01T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":3.5},{"ID":2,"Name":"Vint soda","Description":"Americana Variety - Mix of 6 flavors","ReleaseDate":"2000-10-01T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":20.9},{"ID":3,"Name":"Havina Cola","Description":"The Original Key Lime Cola","ReleaseDate":"2005-10-01T00:00:00Z","DiscontinuedDate":"2006-10-01T00:00:00Z","Rating":3,"Price":19.9},{"ID":4,"Name":"Fruit Punch","Description":"Mango flavor, 8.3 Ounce Cans (Pack of 24)","ReleaseDate":"2003-01-05T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":22.99},{"ID":5,"Name":"Cranberry Juice","Description":"16-Ounce Plastic Bottles (Pack of 12)","ReleaseDate":"2006-08-04T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":22.8},{"ID":6,"Name":"Pink Lemonade","Description":"36 Ounce Cans (Pack of 3)","ReleaseDate":"2006-11-05T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":18.8},{"ID":7,"Name":"DVD Player","Description":"1080P Upconversion DVD Player","ReleaseDate":"2006-11-15T00:00:00Z","DiscontinuedDate":null,"Rating":5,"Price":35.88},{"ID":8,"Name":"LCD HDTV","Description":"42 inch 1080p LCD with Built-in Blu-ray Disc Player","ReleaseDate":"2008-05-08T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":1088.8},{"@odata.type":"#ODataDemo.FeaturedProduct","ID":9,"Name":"Lemonade","Description":"Classic, refreshing lemonade (Single bottle)","ReleaseDate":"1970-01-01T00:00:00Z","DiscontinuedDate":null,"Rating":7,"Price":1.01},{"@odata.type":"#ODataDemo.FeaturedProduct","ID":10,"Name":"Coffee","Description":"Bulk size can of instant coffee","ReleaseDate":"1982-12-31T00:00:00Z","DiscontinuedDate":null,"Rating":1,"Price":6.99}]}


		res.setHeader('Content-type', 'application/json;odata.metadata=minimal');
		res.setHeader('OData-Version', '4.0')
		res.end(JSON.stringify(data))
	catch e
		console.error e.stack
		JsonRoutes.sendResult res,
			code: 200
			data: { errors: [{errorMessage: e.message}] }

WebApp.connectHandlers.use '/odata/v4/Products', (req, res, next) ->
	console.log "/odata/v4/Products"
	console.log req.headers
	try
		data = '<?xml version="1.0" encoding="utf-8"?><feed xml:base="http://services.odata.org/V4/OData/OData.svc/" xmlns="http://www.w3.org/2005/Atom" xmlns:d="http://docs.oasis-open.org/odata/ns/data" xmlns:m="http://docs.oasis-open.org/odata/ns/metadata" xmlns:georss="http://www.georss.org/georss" xmlns:gml="http://www.opengis.net/gml" m:context="http://services.odata.org/V4/OData/OData.svc/$metadata#Products"><id>http://services.odata.org/V4/OData/OData.svc/Products</id><title type="text">Products</title><updated>2018-02-02T09:41:22Z</updated><link rel="self" title="Products" href="Products" /><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(0)</id><category term="#ODataDemo.Product" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(0)" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(0)/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(0)/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(0)/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(0)/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(0)/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(0)/ProductDetail" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">0</d:ID><d:Name>Bread</d:Name><d:Description>Whole grain bread</d:Description><d:ReleaseDate m:type="DateTimeOffset">1992-01-01T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">4</d:Rating><d:Price m:type="Double">2.5</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(1)</id><category term="#ODataDemo.Product" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(1)" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(1)/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(1)/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(1)/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(1)/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(1)/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(1)/ProductDetail" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">1</d:ID><d:Name>Milk</d:Name><d:Description>Low fat milk</d:Description><d:ReleaseDate m:type="DateTimeOffset">1995-10-01T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">3</d:Rating><d:Price m:type="Double">3.5</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(2)</id><category term="#ODataDemo.Product" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(2)" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(2)/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(2)/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(2)/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(2)/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(2)/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(2)/ProductDetail" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">2</d:ID><d:Name>Vint soda</d:Name><d:Description>Americana Variety - Mix of 6 flavors</d:Description><d:ReleaseDate m:type="DateTimeOffset">2000-10-01T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">3</d:Rating><d:Price m:type="Double">20.9</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(3)</id><category term="#ODataDemo.Product" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(3)" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(3)/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(3)/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(3)/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(3)/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(3)/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(3)/ProductDetail" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">3</d:ID><d:Name>Havina Cola</d:Name><d:Description>The Original Key Lime Cola</d:Description><d:ReleaseDate m:type="DateTimeOffset">2005-10-01T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:type="DateTimeOffset">2006-10-01T00:00:00Z</d:DiscontinuedDate><d:Rating m:type="Int16">3</d:Rating><d:Price m:type="Double">19.9</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(4)</id><category term="#ODataDemo.Product" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(4)" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(4)/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(4)/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(4)/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(4)/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(4)/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(4)/ProductDetail" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">4</d:ID><d:Name>Fruit Punch</d:Name><d:Description>Mango flavor, 8.3 Ounce Cans (Pack of 24)</d:Description><d:ReleaseDate m:type="DateTimeOffset">2003-01-05T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">3</d:Rating><d:Price m:type="Double">22.99</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(5)</id><category term="#ODataDemo.Product" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(5)" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(5)/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(5)/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(5)/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(5)/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(5)/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(5)/ProductDetail" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">5</d:ID><d:Name>Cranberry Juice</d:Name><d:Description>16-Ounce Plastic Bottles (Pack of 12)</d:Description><d:ReleaseDate m:type="DateTimeOffset">2006-08-04T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">3</d:Rating><d:Price m:type="Double">22.8</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(6)</id><category term="#ODataDemo.Product" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(6)" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(6)/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(6)/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(6)/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(6)/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(6)/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(6)/ProductDetail" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">6</d:ID><d:Name>Pink Lemonade</d:Name><d:Description>36 Ounce Cans (Pack of 3)</d:Description><d:ReleaseDate m:type="DateTimeOffset">2006-11-05T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">3</d:Rating><d:Price m:type="Double">18.8</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(7)</id><category term="#ODataDemo.Product" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(7)" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(7)/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(7)/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(7)/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(7)/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(7)/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(7)/ProductDetail" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">7</d:ID><d:Name>DVD Player</d:Name><d:Description>1080P Upconversion DVD Player</d:Description><d:ReleaseDate m:type="DateTimeOffset">2006-11-15T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">5</d:Rating><d:Price m:type="Double">35.88</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(8)</id><category term="#ODataDemo.Product" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(8)" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(8)/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(8)/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(8)/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(8)/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(8)/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(8)/ProductDetail" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">8</d:ID><d:Name>LCD HDTV</d:Name><d:Description>42 inch 1080p LCD with Built-in Blu-ray Disc Player</d:Description><d:ReleaseDate m:type="DateTimeOffset">2008-05-08T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">3</d:Rating><d:Price m:type="Double">1088.8</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(9)</id><category term="#ODataDemo.FeaturedProduct" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(9)/ODataDemo.FeaturedProduct" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(9)/ODataDemo.FeaturedProduct/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(9)/ODataDemo.FeaturedProduct/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(9)/ODataDemo.FeaturedProduct/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(9)/ODataDemo.FeaturedProduct/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(9)/ODataDemo.FeaturedProduct/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(9)/ODataDemo.FeaturedProduct/ProductDetail" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Advertisement" type="application/xml" title="Advertisement" href="Products(9)/ODataDemo.FeaturedProduct/Advertisement/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Advertisement" type="application/atom+xml;type=entry" title="Advertisement" href="Products(9)/ODataDemo.FeaturedProduct/Advertisement" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">9</d:ID><d:Name>Lemonade</d:Name><d:Description>Classic, refreshing lemonade (Single bottle)</d:Description><d:ReleaseDate m:type="DateTimeOffset">1970-01-01T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">7</d:Rating><d:Price m:type="Double">1.01</d:Price></m:properties></content></entry><entry><id>http://services.odata.org/V4/OData/OData.svc/Products(10)</id><category term="#ODataDemo.FeaturedProduct" scheme="http://docs.oasis-open.org/odata/ns/scheme" /><link rel="edit" title="Product" href="Products(10)/ODataDemo.FeaturedProduct" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Categories" type="application/xml" title="Categories" href="Products(10)/ODataDemo.FeaturedProduct/Categories/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Categories" type="application/atom+xml;type=feed" title="Categories" href="Products(10)/ODataDemo.FeaturedProduct/Categories" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Supplier" type="application/xml" title="Supplier" href="Products(10)/ODataDemo.FeaturedProduct/Supplier/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Supplier" type="application/atom+xml;type=entry" title="Supplier" href="Products(10)/ODataDemo.FeaturedProduct/Supplier" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/ProductDetail" type="application/xml" title="ProductDetail" href="Products(10)/ODataDemo.FeaturedProduct/ProductDetail/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/ProductDetail" type="application/atom+xml;type=entry" title="ProductDetail" href="Products(10)/ODataDemo.FeaturedProduct/ProductDetail" /><link rel="http://docs.oasis-open.org/odata/ns/relatedlinks/Advertisement" type="application/xml" title="Advertisement" href="Products(10)/ODataDemo.FeaturedProduct/Advertisement/$ref" /><link rel="http://docs.oasis-open.org/odata/ns/related/Advertisement" type="application/atom+xml;type=entry" title="Advertisement" href="Products(10)/ODataDemo.FeaturedProduct/Advertisement" /><title /><updated>2018-02-02T09:41:22Z</updated><author><name /></author><content type="application/xml"><m:properties><d:ID m:type="Int32">10</d:ID><d:Name>Coffee</d:Name><d:Description>Bulk size can of instant coffee</d:Description><d:ReleaseDate m:type="DateTimeOffset">1982-12-31T00:00:00Z</d:ReleaseDate><d:DiscontinuedDate m:null="true" /><d:Rating m:type="Int16">1</d:Rating><d:Price m:type="Double">6.99</d:Price></m:properties></content></entry></feed>'


		res.setHeader('Content-type', 'application/atom+xml')

		res.end(data)
	catch e
		console.error e.stack
		JsonRoutes.sendResult res,
			code: 200
			data: { errors: [{errorMessage: e.message}] }

JsonRoutes.add 'get', '/odata/v4/data', (req, res, next) ->
	console.log "/odata/v4/data"
	try
		data = {"@odata.context":"http://services.odata.org/V4/OData/OData.svc/$metadata#Products","value":[{"ID":0,"Name":"Bread","Description":"Whole grain bread","ReleaseDate":"1992-01-01T00:00:00Z","DiscontinuedDate":null,"Rating":4,"Price":2.5},{"ID":1,"Name":"Milk","Description":"Low fat milk","ReleaseDate":"1995-10-01T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":3.5},{"ID":2,"Name":"Vint soda","Description":"Americana Variety - Mix of 6 flavors","ReleaseDate":"2000-10-01T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":20.9},{"ID":3,"Name":"Havina Cola","Description":"The Original Key Lime Cola","ReleaseDate":"2005-10-01T00:00:00Z","DiscontinuedDate":"2006-10-01T00:00:00Z","Rating":3,"Price":19.9},{"ID":4,"Name":"Fruit Punch","Description":"Mango flavor, 8.3 Ounce Cans (Pack of 24)","ReleaseDate":"2003-01-05T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":22.99},{"ID":5,"Name":"Cranberry Juice","Description":"16-Ounce Plastic Bottles (Pack of 12)","ReleaseDate":"2006-08-04T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":22.8},{"ID":6,"Name":"Pink Lemonade","Description":"36 Ounce Cans (Pack of 3)","ReleaseDate":"2006-11-05T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":18.8},{"ID":7,"Name":"DVD Player","Description":"1080P Upconversion DVD Player","ReleaseDate":"2006-11-15T00:00:00Z","DiscontinuedDate":null,"Rating":5,"Price":35.88},{"ID":8,"Name":"LCD HDTV","Description":"42 inch 1080p LCD with Built-in Blu-ray Disc Player","ReleaseDate":"2008-05-08T00:00:00Z","DiscontinuedDate":null,"Rating":3,"Price":1088.8},{"@odata.type":"#ODataDemo.FeaturedProduct","ID":9,"Name":"Lemonade","Description":"Classic, refreshing lemonade (Single bottle)","ReleaseDate":"1970-01-01T00:00:00Z","DiscontinuedDate":null,"Rating":7,"Price":1.01},{"@odata.type":"#ODataDemo.FeaturedProduct","ID":10,"Name":"Coffee","Description":"Bulk size can of instant coffee","ReleaseDate":"1982-12-31T00:00:00Z","DiscontinuedDate":null,"Rating":1,"Price":6.99}]}


		JsonRoutes.sendResult res,
			code: 200
			data: data
	catch e
		console.error e.stack
		JsonRoutes.sendResult res,
			code: 200
			data: { errors: [{errorMessage: e.message}] }