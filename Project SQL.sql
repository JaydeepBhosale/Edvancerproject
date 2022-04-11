
#problem 1

select * from [dbo].[Tenancy_histories]
select * from[dbo].[profiles]

select top 1
p.profile_id, CONCAT(p.first_name,' ',p.last_name) as Full_name,p.phone, 
datediff (day, th.move_in_date, th.Move_out_date) as total_duration 
from [dbo].[profiles] p
inner join
[dbo].[Tenancy_histories] th
on
p.profile_id = th. Profile_id
where th.move_out_date is not null


#problem 2
 select * from[dbo].[Tenancy_histories]	
 select * from[dbo].[profiles]

 Select 
  profile_id, CONCAT(first_name, Last_name) as Full_name, Email, Phone, maritial_status
  from [dbo].[profiles]
 where maritial_status= 'y' and profile_id in
(select profile_id
 from [dbo].[Tenancy_histories]
 where rent >9000)

 #Problem 3
 select * from[dbo].[Tenancy_histories]	
 select * from[dbo].[profiles]
 select * from[dbo].[Referrals]
 select * from[dbo].[Employment_details]
 select * from [dbo].[houses]

 Select pr.profile_id, CONCAT(pr.first_name,' ',pr.last_name) as Full_name, pr.email, pr.phone, 
 pr.[city(hometown)], th.house_id, th.move_in_date, th.move_out_date, th.rent, ed.latest_employer, 
 ed.occupational_catagory, rf.refferer_id
 from [dbo].[profiles] pr
 left join
 [dbo].[Tenancy_histories] th
 on
 pr.profile_id = th.profile_id
 left join
[dbo].[Referrals] rf
 on
pr.profile_id = rf.ref_id
 left join
 [dbo].[Employment_details] ed
 on
 pr.profile_id = ed.profile_id
 where move_in_date between '2015-01-01'and '2016-01-01' and [city(hometown)] <> 'delhi' 
 order by rent Desc

 #problem 4 

 Select * from[dbo].[Tenancy_histories]	
 select * from[dbo].[profiles]
 select * from[dbo].[Referrals]
 select * from[dbo].[Employment_details]
 select * from [dbo].[houses]

 
 Select pr.profile_id, CONCAT(pr.first_name,' ',pr.last_name) as Full_name, pr.email, pr.phone,
 rf.referral_valid, rf.referrer_bonus_amount
 from [dbo].[profiles] pr
 inner join
 [dbo].[Referrals] rf
 on
 pr.profile_id = rf.refferer_id   
 where referral_valid= '1'
 group by profile_id, referrer_bonus_amount, first_name, last_name, email, phone, referral_valid, referrer_bonus_amount

 #problem 5
 select * from[dbo].[Tenancy_histories]	
 select * from[dbo].[profiles]
 
 Select pr.[city(hometown)], th.rent 
 from [dbo].[profiles] pr
 inner join
 [dbo].[Tenancy_histories]	th
 on
 th.profile_id = pr.profile_id 
 group by [city(hometown)]
 
 #problem 6
 Select * from[dbo].[Tenancy_histories]	
 select * from[dbo].[profiles]
 select * from[dbo].[Referrals]
 select * from[dbo].[Employment_details]
 select * from [dbo].[houses]
 Select * from [dbo].[addresses]

 
 Create view 
 vw_tenant
 as
 select th.profile_id, th.rent, th.move_in_date, hs.house_type, hs.beds_vacant, ad.description, pr.[city(hometown)]
 from [dbo].[Tenancy_histories]	th
 inner join
 [dbo].[houses] hs
 on 
 th.house_id = hs.house_id
 inner join
[dbo].[addresses] ad
on
th.house_id = ad.house_id
inner join 
[dbo].[profiles] pr
on
th.profile_id = pr.profile_id
where move_in_date >= '2015-04-30'
order by profile_id


#problem 8

 Select * from[dbo].[Tenancy_histories]	
 select * from[dbo].[profiles]


select pr.profile_id, CONCAT(pr.first_name,' ', pr.last_name) as Full_name, pr.phone, th.rent,
IIF (th.rent >10000, 'A', 
iif (th.rent between 7500 and 10000, 'B' , 'C')) Customer_segment
from[dbo].[Tenancy_histories] th
left join
[dbo].[profiles] pr
on
pr.profile_id = th.profile_id
order by Customer_segment


#problem 9

 Select * from[dbo].[Tenancy_histories]	
 Select * From [dbo].[Referrals]
 select * from[dbo].[profiles]  
 select * from [dbo].[houses]


 select pr.profile_id, CONCAT(pr.first_name, ' ' , pr.last_name) as FullName, pr.phone, 
 pr.[city(hometown)], th.house_id, hs.bhk_details, hs.bed_count, hs.beds_vacant, hs.house_type, hs.furnishing_type
 from profiles pr
 inner join 
 [dbo].[Tenancy_histories] th
 on
 pr.profile_id = th.profile_id
 inner join 
 [dbo].[houses] hs
 on
 th.house_id = hs.house_id


 #problem 10

select top 5 *, (bed_count-beds_vacant) AS occupancy
from [dbo].[houses]
order by occupancy DESC
