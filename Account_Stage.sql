-- create table account_extract as
SELECT distinct c.`CompanyId` as External_ID__c,
    memt.description as Membership_Type__c,
    case 
		when ct.description = 'Legislative - Federal' then 'Legislative Federal'
        when ct.description = 'Legislative - State' then 'Legislative State'
        when ct.description = 'Regulatory - State' then 'Regulatory State'
        when ct.description = 'Regulatory - Federal' then 'Regulatory Federal'
        when ct.description = 'International Union' then 'International Unions'
        when ct.description is null then 'Other'
        else ct.description
    end as Type,
    concat(coalesce(c.`name`, ''), ' ', coalesce(c.`name2`, '')) as Name,
    c.`description` as Description,
    c.`logo`, -- still need to figure out how to load it
    c.`email` as Email__c,
    c.`mxxCreated` as CreatedDate,
    c.`paidDues`,  -- need to get more details
    cs.description as Status__c,
    case c.`hasSubsidiaries` when 1 then 'TRUE' else 'FALSE'  end as hasSubsidiaries, -- still need to finalize
    c.`prospectStatus`,  -- determine if this is needed
    p.description as prospectStatusDes, -- determine if this is needed
	case c.`womanOwned` when 1 then 'TRUE' when 2 then 'FALSE'  end as IsWomanOwned__c,
    case c.`minorityOwned` when 1 then 'TRUE' when 2 then 'FALSE'  end as IsMinorityOwned__c,
    c.`yearEstablished` as Year_Established__c,
    c.`companyNum` as AccountNumber,
    -- serv.description as Industry, -- 1 to many relationship. Need clarity from Client
	case c.`smallBusinessEnterprise` when 1 then 'TRUE' when 2 then 'FALSE'  end IsSmallBusinessEnterprise__c,
    case c.`disadvantagedBusiness` when 1 then 'TRUE' when 2 then 'FALSE'  end IsDisadvantagedBusiness__c,
    c.`criticalNotes` as Critical_Notes__c, 
    shipadr.line1 as ShippingStreet, 
    shipadr.city as ShippingCity, 
    shipst.description as ShippingState, 
    shipadr.zip as ShippingPostalCode, 
    shipc.description as ShippingCountry,
    biladr.line1 as BillingStreet, 
    biladr.city as BillingCity, 
    bilst.description as BillingState, 
    biladr.zip as BillingPostalCode,
    bilc.description as BillingCountry, 
    -- coalesce(i.mobilephone, i.workphone, i.homephone) as Phone,  -- pulled in individual phone 
    rel.parentCompanyId as ParentId, -- relationship will be a separate upsert
    relt.description as relationshipType
FROM taucnea.company c
left join taucnea.membership m on c.membershipid = m.membershipid
left join taucnea.membershiptype memt on memt.id=m.membershiptypeid
left join taucnea.companytype ct on ct.id=c.companyTypeId
left join taucnea.companyStatus cs on c.companystatusid = cs.id
left join taucnea.prospectstatus p on c.prospectstatus = p.id -- determine if this is needed
left join (select CompanyId,address 
           from  taucnea.website  
           where (mxxCreated,companyid) in (SELECT max(mxxCreated), companyid 
	                                       FROM taucnea.website 
                                           where companyid is not null 
                                           group by companyid)) web
  on web.companyid = c.companyid
left join taucnea.branch br on br.CompanyId=c.CompanyId  -- junction between company and address
left join taucnea.address shipadr on shipadr.AddressId=br.shippingAddressId
left join taucnea.stateprovince shipst on shipst.id = shipadr.stateprovinceid
left join taucnea.country shipc on shipc.countryid = shipadr.countryid
left join taucnea.individual i on i.IndividualId=c.BillingContactId
left join taucnea.address biladr on biladr.AddressId= i.mainAddressId  -- Client wants the billing address of the billing contact
left join taucnea.stateprovince bilst on bilst.id=biladr.StateProvinceId 
left join taucnea.country bilc on bilc.countryid = shipadr.countryid
-- left join taucnea.company2service cser on cser.CompanyId=c.CompanyId
-- left join taucnea.service serv on serv.ServiceId=cser.ServiceId  -- Need to get confirmation from the client
left join taucnea.relationship rel on rel.childcompanyid=c.companyId
left join taucnea.relationtype relt on relt.id=rel.relationtype
-- where c.name like '%Erie Plant%'
-- where c.companyid IN  ('1498943586401', '34359798349')  -- Owner/Plant relationship
group by c.companyid;




-- Extract for load testing
SELECT distinct External_ID__c,
    Membership_Type__c,
    Type,
    Name,
    Description,
    Email__c,
    CreatedDate,
    Status__c,
	IsWomanOwned__c,
    IsMinorityOwned__c,
    Year_Established__c,
    AccountNumber,
    IsSmallBusinessEnterprise__c,
    IsDisadvantagedBusiness__c,
    Critical_Notes__c, 
    ShippingStreet, 
    ShippingCity, 
    ShippingState, 
    ShippingPostalCode, 
    ShippingCountry,
    BillingStreet, 
    BillingCity, 
    BillingState, 
    BillingPostalCode,
    BillingCountry
FROM taucnea.account_extract