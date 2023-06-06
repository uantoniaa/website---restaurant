DROP TYPE IF EXISTS categ_produs;
DROP TYPE IF EXISTS tip_produse;

CREATE TYPE categ_produs AS ENUM( 'pizza', 'paste', 'gratar', 'desert', 'sucuri','bere');
CREATE TYPE tip_produse AS ENUM('mancare', 'bauturi');


CREATE TABLE IF NOT EXISTS preparate (
   id serial PRIMARY KEY,
   nume VARCHAR(50) UNIQUE NOT NULL,
   descriere TEXT,
   pret NUMERIC(8,2) NOT NULL,
   gramaj INT NOT NULL CHECK (gramaj>=0),   
   tip_produs tip_produse DEFAULT 'mancare',
   calorii INT NOT NULL CHECK (calorii>=0),
   categorie categ_produs DEFAULT 'bere',
   ingrediente VARCHAR [], --pot sa nu fie specificare deci nu punem NOT NULL
   disponibil_online BOOLEAN NOT NULL DEFAULT FALSE,
   imagine VARCHAR(300),
   data_adaugare TIMESTAMP DEFAULT current_timestamp
);

INSERT into preparate (nume, descriere, pret, gramaj, calorii, tip_produs, categorie, ingrediente, disponibil_online, imagine) VALUES
('Birra Morreti', 'Bere blondă italiană', 10.5 , 330, 150, 'bauturi', 'bere', '{"apă","malt","hamei"}', False, 'birra_morreti.jpg'),
('Edelweiss', 'Bere de grâu austriacă', 12.75 , 500, 180, 'bauturi', 'bere', '{"apă","malt","grâu","hamei"}', False, 'edelweiss.jpg'),
('Heineken', 'Bere blondă olandeză', 9.25 , 330, 160, 'bauturi', 'bere', '{"apă","malt","hamei"}', False, 'heineken.jpg'),
('Ciuc', 'Bere românească', 7.5 , 500, 140, 'bauturi', 'bere', '{"apă","malt","hamei"}', False, 'ciuc.jpg'),
('Pepsi', 'Băutură răcoritoare carbogazoasă', 5.0 , 330, 120, 'bauturi', 'sucuri', '{"apă","zahăr","acid citric"}', False, 'pepsi.jpg'),
('Tagliatelle', 'Paste lungi italienești', 15.0 , 250, 300, 'mancare', 'paste', '{"făină","ouă","apă","sare"}', False, 'tagliatelle.jpg'),
('Paste Carbonara', 'Paste cu sos carbonara', 18.5 , 300, 450, 'mancare', 'paste', '{"făină","ouă","smântână","cățel de usturoi","șuncă","parmezan","sare","piper"}', False, 'paste-carbonara.jpg'),
('Mirinda', 'Băutură răcoritoare cu gust de portocale', 5.0 , 330, 130, 'bauturi', 'sucuri', '{"apă","zahăr","acid citric"}', False, 'mirinda.jpg'),
('7UP', 'Băutură răcoritoare cu gust de lămâie-lime', 5.0 , 330, 120, 'bauturi', 'sucuri', '{"apă","zahăr","acid citric"}', False, '7up.jpg'),
('Prigat', 'Suc natural de fructe', 7.0 , 250, 110, 'bauturi', 'sucuri', '{"fructe","apă"}', False, 'prigat.jpg'),
('Clătite', 'Desert popular din aluat sub formă de disc plat', 12.0 , 200, 350, 'mancare', 'desert', '{"făină","ouă","lapte","zahăr","ulei"}', False, 'clatite.jpg'),
('Pizza Quattro Formaggi', 'Pizza cu patru tipuri de brânză', 25.0 , 800, 900, 'mancare', 'pizza', '{"aluat","sos de roșii","mozzarella","gorgonzola","parmezan","brânză de capră"}', False, 'pizza-quatro-formagi-jpg.jpg'),
('Cotlete de Berbecuț', 'Cotlete de berbecuț fragede și suculente', 35.0 , 300, 700, 'mancare', 'gratar', '{"carne de berbecuț","condimente"}', False, 'cotlete-de-berbecut.jpg'),
('Frigăruie la Grătar', 'Frigăruie de carne la grătar', 20.0 , 200, 500, 'mancare', 'gratar', '{"carne","legume"}', False, 'frigarui-la-gratar.jpg'),
('Pizza California', 'Pizza cu avocado și alte ingrediente proaspete', 28.0 , 750, 800, 'mancare', 'pizza', '{"aluat","sos de roșii","mozzarella","avocado","salam","ardei","măsline"}', False, 'pizza-california.jpg'),
('Spaghetti al Pomodoro', 'Paste lungi cu sos de roșii', 17.5 , 300, 400, 'mancare', 'paste', '{"făină","ouă","sos de roșii","ulei de măsline","usturoi","busuioc","sare","piper"}', False, 'spaghetti-al-pomodoro.jpg'),
('Linguine Crevete', 'Paste lungi cu creveți', 22.0 , 350, 550, 'mancare', 'paste', '{"făină","ouă","creveți","usturoi","ulei de măsline","sare","piper","pătrunjel"}', False, 'linguine-creveti.jpg'),
('Vită la Grătar', 'Felii de carne de vită la grătar', 32.0 , 300, 600, 'mancare', 'gratar', '{"carne de vită","condimente"}', False, 'vita-gratar.jpg'),
('Piept de Pui la Grătar', 'Piept de pui la grătar', 18.0 , 200, 400, 'mancare', 'gratar', '{"carne de pui","condimente"}', False, 'piept-pui-gratar.jpg'),
('Pizza Quattro Stagioni', 'Pizza cu patru sortimente de ingrediente', 26.0 , 800, 850, 'mancare', 'pizza', '{"aluat","sos de roșii","mozzarella","șuncă","ciuperci","ardei","măsline"}', False, 'pizza-quattro-stagioni.jpg'),
('Pizza Capriciosa', 'Pizza cu șuncă și ciuperci', 23.0 , 700, 800, 'mancare', 'pizza', '{"aluat","sos de roșii","mozzarella","șuncă","ciuperci","măsline"}', False, 'pizza-capriciosa.jpg'),
('Păpănași', 'Desert tradițional românesc', 14.0 , 250, 450, 'mancare', 'desert', '{"brânză de vaci","făină","ouă","smântână","zahăr","ulei","caise"}', False, 'papanasi.jpg'),
('Tiramisu', 'Desert italian cu mascarpone și cafea', 16.0 , 200, 500, 'mancare', 'desert', '{"mascarpone","cafea","biscuiți Savoiardi","cacao","ouă","zahăr"}', False, 'tiramisu.jpg'),
('Cheesecake', 'Desert din brânză de vaci și biscuiți', 13.0 , 180, 400, 'mancare', 'desert', '{"brânză de vaci","biscuiți","zahăr","ouă","unt","vanilie"}', False, 'cheesecake.jpg');