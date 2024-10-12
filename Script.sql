use db

#QUERY #1
#Seleziona gli utenti che hanno postato almeno un video

select u.id, u.username, m.`type` 
from medias m
join users u on u.id = m.user_id  
where m.type like 'video';

select count(user_id), user_id  
from medias m 
where type like 'video' 
group by user_id;

#con count(user_id) andremo a contare quante volte il valore 'user_id' verrà caricato (in pratica quanti video
#ogni utente ha caricato), con group by andremo a raggrupparli in base allo user_id



#QUERY #2
#Seleziona tutti i post senza Like (13)

select l.post_id, title
from posts p 
left join likes l on l.post_id = p.id 
where l.user_id is null;

#il left join include tutti i record della tabella post, con where andremo a controllare invece la quantità 
#di likes del post (in questo caso sarà NULL)


#QUERY #3 
#Conta il numero di like per ogni post (152)

select count(*),p.id, title
from posts p  
join likes l on l.post_id  = p.id  
group by l.post_id;

#con count(*) andremo a contare il numero totale di righe di ogni gruppo (ovvero i likes di ogni post), con
#group by andremo a raggrupparli in base all'id del post



#QUERY #4
#Ordina gli utenti per il numero di media caricati

SELECT count(m.id) as conteggio, u.id
from medias m 
join users u on u.id = m.user_id 
group by u.id
order by conteggio asc;

#con count(m.id) andremo a contare il numero di media per ogni utente, con group by andremo a ragguppare i 
#risultati in base all'id dell'utente, con order by conteggio ASC andremo semplicemente a ordinarli in
#maniera crescente


#QUERY #5
#Ordina gli utenti per totale di likes ricevuti nei loro posts

select count(l.post_id) as conteggio, u.id 
from likes l 
join users u on u.id = l.user_id 
join posts p on p.id = l.post_id 
group by u.id 
order by conteggio asc;

#con count(l.post_id) andremo a contare quanti likes sono stati messi ad ogni post, con group by andremo a 
#raggupparli in base all'id dell'utente, con order by andremo a ordinare i numeri di like in maniera crescente 