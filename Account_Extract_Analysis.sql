-- My work in progress extract
SELECT distinct c.`CompanyId`,
    c.`MembershipId`,
    -- mems.description as membershipstatus, 
    memt.description as membershiptype,
    c.`companyTypeId`,
    ct.description as CompanyType,
    -- c.`SizeCodeId`, -- don't need
    concat(coalesce(c.`name`, ''), ' ', coalesce(c.`name2`, '')) as acctname,
    c.`description`,
    c.`logo`,
    -- c.`enteredBy`, -- don't need
    -- c.`lastUpdated`, -- don't need
    -- c.`lastUpdatedBy`, -- don't need
    -- c.`taxId`, -- no data
    -- c.`staffing`,  -- no data
    c.`email`,
    c.`mxxCreated`,
    -- c.`mxxUpdated`,  -- don't need
    -- c.`article`,  -- no data
    -- c.`revenue`, -- no data
    c.`paidDues`,
    -- c.`isComplementary`,  -- no data
    -- c.`mxxUpdatedBy`,  -- don't need
    -- c.`mxxCreatedBy`,  -- don't need
    -- c.`aliases`,  -- don't need
    c.`companyStatusId`,
    cs.description as companystatus,
    -- c.`isPubliclyTraded`,  -- don't need
    -- c.`brands`,  -- don't need
    -- c.`BillingContactId`,  -- different object (ACR)
	-- c.`KeyContactId`,  -- different object (ACR)
    case c.`hasSubsidiaries` when 1 then 'Yes' else 'No'  end hasSubsidiaries,
    -- c.`visionsid`,  -- don't need
    c.`prospectStatus`,
    p.description as prospectStatus,
    -- c.`isParentCompany`,  -- no data
	case c.`womanOwned` when 1 then 'Yes' when 2 then 'No'  end IsWomanOwned,
    -- c.`alphaSort`,  -- don't need
    case c.`minorityOwned` when 1 then 'Yes' when 2 then 'No'  end IsMinorityOwned,
    -- c.`companyStruct`, -- no data
    -- c.`numPTEmployees`, -- no data
    -- c.`numFTEmployees`, -- no data
    -- c.`denoteDiversity`, -- no data
    -- c.`DirectoryContactId`,  -- don't need
    c.`yearEstablished`,
    c.`companyNum`,
	-- c.`ticker`,  -- no data
    -- c.`percentMale`,  -- no data
    -- c.`sepIncorp`,  -- no data
    -- c.`dayBoarding`,  -- no data
	-- c.`totalEnrollment`,  -- no data
    -- c.`pctepiscopal`,  -- no data
    -- c.`percentFemale`,  -- no data
    -- c.`percentCauc`,  -- no data
    -- c.`percentAfAm`,  -- no data
    -- c.`percentasam`,  -- no data
    -- c.`percentnatam`,  -- no data
    -- c.`percenthisp`,  -- no data
    -- c.`percentOtherRace`,  -- no data
    -- c.`fpercentcauc`,  -- no data
    -- c.`fpercentafam`,  -- no data
    -- c.`fpercentasam`,  -- no data
    -- c.`FpercentHisp`,  -- no data
    -- c.`fpercentnatam`,  -- no data
    -- c.`fpercentotherrace`,  -- no data
    -- c.`percentfinaid`,  -- no data
    -- c.`totalFinAid`,  -- no data
    -- c.`specialNotes`,  -- no data
    -- c.`otherProductCategory`, -- don't need
    -- c.`annualSales`, -- no data
    -- c.`diocese`,  -- no data
    -- c.`accreditedby`, -- no data
    -- c.`matchString`, -- don't need
    -- c.`tradeNames`,  -- don't need
    -- c.`agreementName`, -- don't need
    -- c.`constructionServices`, -- no data
    -- c.`bondable`,  -- don't need
    -- c.`recordOrigin`,  -- no data
    -- c.`howHeardAboutOther`,  -- don't need
	-- c.`tripartiteCommitteeDate`,  -- don't need
	-- c.`silent`,  -- don't need
	-- c.`localChaptersAsbestosWorkers`,  -- don't need
	-- c.`qaqcHowMany`,  -- don't need
	-- c.`oshaTotalSkinDisorders`,  -- don't need
	-- c.`localHasSheetMetalWorkers`,  -- don't need
	-- c.`fullTimeSafetyDirectorCount`,  -- don't need
	-- c.`oshaCasesJobTransfer`,  -- don't need
	-- c.`businessCertificationsOther`,  -- don't need
	-- c.`qaqcHasManager`,  -- don't need
	-- c.`localChapterPaintersGlazers`,  -- don't need
	-- c.`oshaForYear`,  -- don't need
	-- c.`specialtyContractorType`,  -- don't need
	-- c.`localChapterOperatingEngineers`,  -- don't need
	-- c.`localChapterElevatorOperators`,  -- don't need
	-- c.`oshaOtherRecordables`,  -- don't need
	-- c.`localChapterRoofers`,  -- don't need
	-- c.`nationalAgreementsOther`,  -- don't need
	-- c.`localHasElectricalWorkers`,  -- don't need
	-- c.`averageAnnualNumEmployees`,  -- don't need
	-- c.`localChapterIronWorkers`,  -- don't need
	-- c.`oshaTotalRespiratoryConditions`,  -- don't need
	-- c.`localHasPlasterersCement`,  -- don't need
	-- c.`localHasTeamsters`,  -- don't need
	-- c.`fullTimeSafetyDirector`,  -- don't need
    case c.`smallBusinessEnterprise` when 1 then 'Yes' when 2 then 'No'  end IsSmallBusinessEnterprise,
    -- c.`localChapterBoilermakers`, -- don't need
    -- c.`localChapterTeamsters`, -- don't need
    -- c.`annualBusinessVolume`, -- don't need
    -- c.`oshaTotalInjuries`, -- don't need
    -- c.`oshaCasesDaysAway`, -- don't need
    -- c.`localChapterUnitedAssociation`, -- don't need
    -- c.`localHasBricklayers`,  -- don't need
    -- c.`totalHoursWorkedLastYear`,  -- don't need
    -- c.`oshaTotalPoisonings`, -- don't need
    -- c.`localChapterCarpentersMillwrights`,  -- don't need
    -- c.`localChapterSheetMetalWorkers`,  -- don't need
    -- c.`localHasRoofers`, -- don't need
    case c.`disadvantagedBusiness` when 1 then 'Yes' when 2 then 'No'  end IsDisadvantagedBusiness,
   -- c.`localChapterPlasterersCement`,  -- don't need  -- don't need
   -- c.`substanceAbusePolicy`,  -- don't need
   -- c.`localHasElevatorOperators`,  -- don't need
   -- c.`localHasIronWorkers`,  -- don't need
   -- c.`localHasUnitedAssociation`,  -- don't need
   -- c.`localHasOperatingEngineers`,  -- don't need
   -- c.`otherWorkPerformed`,  -- don't need
   -- c.`oshaTotalNumberInjuries`,  -- don't need
   -- c.`oshaDeaths`,  -- don't need
   -- c.`localHasLaborers`,  -- don't need
   -- c.`localHasPaintersGlazers`,  -- don't need
   -- c.`localChapterLaborers`,  -- don't need
   -- c.`localHasCarpentersMillwrights`,  -- don't need
   -- c.`oshaTotalDaysAway`,  -- don't need
   -- c.`businessVolumeId`,  -- don't need
   -- c.`oshaTotalOtherIllness`,  -- don't need
   -- c.`localHasBoilermakers`,  -- don't need
   -- c.`oshaTotalJobTransferRestriction`,  -- don't need
   -- c.`oshaTotalHoursWorked`,  -- don't need
   -- c.`localChapterBricklayers`,  -- don't need
   -- c.`certsAndPreferredContractor`,  -- don't need
   -- c.`zeroInjuryPhilosophy`,  -- don't need
   -- c.`oshaTotalHearingLoss`,  -- don't need
   -- c.`localHasAsbestosWorkers`,  -- don't need
   -- c.`qaqcHasProgram`,  -- don't need
   -- c.`localChapterElectricalWorkers`,  -- don't need
   -- c.`emr`,  -- don't need
   -- c.`emrYear`,  -- don't need
   -- c.`additionalRosterSlots`,  -- don't need
    c.`criticalNotes`,
    -- c.`riskRating`,  -- no data
    -- c.`riskAssessment`, -- no data
    -- c.`congressofficeFor`,  -- no data
    -- c.`congresspersonFor`,  -- no data
    -- c.`numFilledSlots`,  -- no data
    -- c.`originalemail`, -- no data
    -- c.`highResImageId`,  -- don't need
    -- c.`congressSenators`,  -- no data
    -- c.`congressSenator1`, -- no data
    -- c.`congressSenator2`, -- no data
    -- c.`congressRep`, -- no data
    -- c.`congressionalDistrict`, -- no data
    -- c.`emailDomains`,  -- no data
    -- c.`duesBudget`,  -- no data
    c.`invoiceInformation`
    -- c.`createdOnWWW`, -- don't need
    -- c.`WorkHoursContactId`  -- different object (ACR)
FROM taucnea.company c
left join taucnea.membership m on c.membershipid = m.membershipid
-- left join taucnea.membershipstatus mems on mems.id=m.status  -- don't need
left join taucnea.membershiptype memt on memt.id=m.membershiptypeid
left join taucnea.companytype ct on ct.id=c.companyTypeId
-- left join taucnea.sizecode sc on sc.SizecodeId=c.SizecodeId -- don't need
left join taucnea.companyStatus cs on c.companystatusid = cs.id
left join taucnea.prospectstatus p on c.prospectstatus = p.id 
where c.name like '%Erie Plant%'
;


-- Count of companyids by companytype
select ct.description, count(c.companyid)
from taucnea.company c
left join taucnea.companytype ct on c.companyTypeId = ct.id
group by ct.description;


-- Dupe check on companyid
select companyid, count(*)
from taucnea.company c
group by companyid
order by count(*) desc;

-- Duplicates found
select *
from taucnea.company c
where c.name like '%Erie Plant%';


-- Analyzing Eugene's extract
SELECT 
   c.`CompanyId`,
   c.`MembershipId`,
   ct.description  CompanyType ,
   c.`name`,
   c.name2,
   c.`aliases`,
   c.`description`,
   c.`logo`,
   c.`email`,
   c.`paidDues`,
   st.description CompanyStatus,
   c.`hasSubsidiaries`,
   case c.`womanOwned` when 1 then 'Yes' when 2 then 'No'  end IsWomanOwnedDesc,
   case c.`minorityOwned` when 1 then 'Yes' when 2 then 'No'  end minorityOwnedDesc,
   c.`yearEstablished`,
   c.`companyNum`,
  case c.`smallBusinessEnterprise` when 1 then 'Yes' when 2 then 'No'  end smallBusinessEnterpriseDesc,
  case c.`disadvantagedBusiness` when 1 then 'Yes' when 2 then 'No'  end disadvantagedBusinessDesc,
  c.`criticalNotes`,
  c.`invoiceInformation`,
  -- GROUP_CONCAT( distinct con.description )  constructionservice,  -- don't need
  -- GROUP_CONCAT(distinct cot.description )  contractortype,  -- don't need
   GROUP_CONCAT(distinct cntr.description ) companycountry,
 --  cast(GROUP_CONCAT(distinct hh.description ) as char) HowHeardAbout,  -- don't need
 --  cast( GROUP_CONCAT(distinct na.description ) as char) NationalAgreement,  -- don't need
   cast( GROUP_CONCAT(distinct serv.description ) as char) Service,  -- don't need get confirmation (seems like industry)
   cast(   GROUP_CONCAT(distinct spr.description ) as char) StateProvince,
 --  cast(    GROUP_CONCAT(distinct wp.description ) as char)  workperformed,  -- don't need
       web.address website,
 --      addr.line1 prime_line1 , addr.line2 prime_line2,  addr.city prime_city, spr2.description prime_state, addr.zip prime_zip, addr.mainPhone prime_phone , 
 --      addr2.line1 direct_line1 , addr2.line2 direct_line2,  addr2.city direct_city, spr3.description direct_state, addr2.zip direct_zip, addr2.mainPhone direct_phone,
       addr3.line1 ship_line1 , addr3.line2 ship_line2,  addr3.city ship_city, spr4.description ship_state, addr3.zip ship_zip, 
       addr3.mainPhone ship_phone, -- no data
        addr4.line1 bill_line1 , addr4.line2 bill_line2,  addr4.city bill_city, spr5.description bill_state, addr4.zip bill_zip, 
        addr4.mainPhone bill_phone, -- no data
       rel.parentCompanyId , relt.description childaccounttype,
        mems.description as membership_status, memt.description as membership_type 
       
FROM taucnea.company c  
 left join taucnea.membership m on c.MembershipId=m.MembershipId
-- left join taucnea.membershipstatus mems on mems.id=m.status
left join taucnea.membershiptype memt on memt.id=m.membershiptypeid
left join taucnea.companytype ct on ct.id=c.companyTypeId
-- left join taucnea.sizecode sc on sc.SizecodeId=c.SizecodeId
left join taucnea.status st on st.id=c.CompanyStatusId
left join taucnea.individual i on i.IndividualId=c.BillingContactId
left join taucnea.address addr4 on addr4.AddressId= i.mainAddressId  -- Client wants the billing address of the billing contact
-- left join taucnea.individual i2 on i2.IndividualId=c.KeyContactId  -- different object (ACR)
left join taucnea.prospectstatus ps on ps.id=c.prospectstatus
-- left join taucnea.individual i3 on i3.IndividualId=c.DirectoryContactId -- don't need
-- left join taucnea.individual i4 on i4.IndividualId=c.WorkHoursContactId  -- different object (ACR)
-- left join taucnea.company2constructionservice cs on cs.CompanyId=c.CompanyId  -- don't need
--  left join taucnea.constructionservice con on con.ConstructionServiceId=cs.ConstructionServiceId  -- don't need
-- left join taucnea.company2contractortype cct on cct.CompanyId=c.CompanyId  -- don't need
--  left join taucnea.contractortype cot on cot.id=cct.ContractorTypeId  -- don't need
 left join taucnea.company2country ccntr on ccntr.CompanyId=c.CompanyId
 left join taucnea.country cntr on cntr.CountryId = ccntr.CountryId
 -- left join taucnea.company2howheardabout as chh on chh.CompanyId=c.CompanyId  -- don't need
 -- left join taucnea.howheardabout hh on hh.HowHeardAboutId=chh.HowHeardAboutId  -- don't need
 -- left join taucnea.company2nationalagreement cna on cna.CompanyId=c.CompanyId  -- don't need 
 -- left join taucnea.nationalagreement na on na.NationalAgreementId=cna.NationalAgreementId  -- don't need
 left join taucnea.company2service cser on cser.CompanyId=c.CompanyId
 left join taucnea.service serv on serv.ServiceId=cser.ServiceId
 left join taucnea.company2stateprovince csp on csp.CompanyId=c.CompanyId
 left join taucnea.stateprovince spr on spr.id=csp.StateProvinceId
 -- left join taucnea.company2workperformed cwp on cwp.CompanyId=c.CompanyId  -- don't need
 -- left join taucnea.workperformed wp on wp.WorkPerformedId=cwp.WorkPerformedId  -- don't need
 

left join (select CompanyId,address from  taucnea.website  where (mxxCreated,companyid) in (SELECT max(mxxCreated), companyid FROM taucnea.website where companyid is not null group by  companyid)) web on web.CompanyId=c.CompanyId
left join taucnea.branch br on br.CompanyId=c.CompanyId  -- contains address and phone information

-- left join taucnea.address addr on addr.AddressId=br.primaryAddressId -- don't need
-- left join taucnea.address addr2 on addr2.AddressId=br.directoryAddressId  -- don't need
left join taucnea.address addr3 on addr3.AddressId=br.shippingAddressId


-- left join taucnea.stateprovince spr2 on spr2.id=addr.StateProvinceId
-- left join taucnea.stateprovince spr3 on spr3.id=addr2.StateProvinceId
 left join taucnea.stateprovince spr4 on spr4.id=addr3.StateProvinceId 
  left join taucnea.stateprovince spr5 on spr5.id=addr4.StateProvinceId 

left join taucnea.relationship rel on rel.childcompanyid=c.companyId
left join taucnea.relationtype relt on relt.id=rel.relationtype
group by c.CompanyId;





-- FINAL Extract version
SELECT distinct c.`CompanyId` as External_ID__c,
    memt.description as Membership_Type__c,
    ct.description as Type,
    concat(coalesce(c.`name`, ''), ' ', coalesce(c.`name2`, '')) as Name,
    c.`description` as Description,
    c.`logo`,
    c.`email` as Email__c,
    c.`mxxCreated`, -- determine if this is needed
    c.`paidDues`,
    cs.description as Status__c,
    case c.`hasSubsidiaries` when 1 then 'Yes' else 'No'  end as hasSubsidiaries,
    c.`prospectStatus`,  -- determine if this is needed
    p.description as prospectStatus, -- determine if this is needed
	case c.`womanOwned` when 1 then 'Yes' when 2 then 'No'  end as IsWomanOwned__c,
    case c.`minorityOwned` when 1 then 'Yes' when 2 then 'No'  end as IsMinorityOwned__c,
    c.`yearEstablished` as Year_Established__c,
    c.`companyNum` as AccountNumber,
    serv.description as Industry,
	case c.`smallBusinessEnterprise` when 1 then 'Yes' when 2 then 'No'  end IsSmallBusinessEnterprise__c,
    case c.`disadvantagedBusiness` when 1 then 'Yes' when 2 then 'No'  end IsDisadvantagedBusiness__c,
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
    coalesce(i.mobilephone, i.workphone, i.homephone) as Phone,
    rel.parentCompanyId as ParentId, 
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
left join taucnea.company2service cser on cser.CompanyId=c.CompanyId
left join taucnea.service serv on serv.ServiceId=cser.ServiceId
left join taucnea.relationship rel on rel.childcompanyid=c.companyId
left join taucnea.relationtype relt on relt.id=rel.relationtype
-- where c.name like '%Erie Plant%'
-- where c.companyid IN  ('1498943586401', '34359798349')  -- Owner/Plant relationship