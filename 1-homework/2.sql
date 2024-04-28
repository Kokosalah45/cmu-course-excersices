 select  release.name , release_info.date_year from release
  join medium on release.id = medium.release
  join medium_format on medium_format.id = medium.format
  join artist_credit on artist_credit.id = release.artist_credit
  join artist_credit_name on artist_credit_name.artist_credit = artist_credit.id
  join artist on artist.id = artist_credit_name.artist
  join area on artist.area = area.id
  join release_info on release_info.release = release.id
  where area.name = 'United Kingdom' and artist.name = 'The Beatles' and medium_format.name = '12" Vinyl' and date_year <= 1970
  order by release_info.date_year , release.name;