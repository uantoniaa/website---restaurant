class Produs{

    constructor({id, nume, descriere, pret, gramaj, tip_produs, calorii, categorie, ingrediente, disponibil_online, imagine, data_adaugare}={}) {

        for(let prop in arguments[0]){
            this[prop]=arguments[0][prop]
        }

    }

}