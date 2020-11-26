import axios from "axios"
import moment from 'moment'
function format_date(value){
  if (value) {
    return moment(String(value)).format('YYYY-MM-DD');
   }
}

export default {
  async getEvents() {
    let res = await axios.get("http://localhost:8001/events");
    return res.data;
  },
  async getEventSingle(eventId) {
    let res = await axios.get("http://localhost:8001/events/" + eventId);
    return res.data;
  },


  async getKisiler() {
    let res = await axios.get("http://localhost:3000/getemployee");
    return res.data;
  },
  async getRoller() {
    let res = await axios.get("http://localhost:3000/getrol");
    return res.data;
  },
  async ekle_kisi(kisi) {
   // debugger;
    let res = await axios.get("http://localhost:3000/ekle/" + kisi.rol_id + "/" + kisi.name + "/" + kisi.surname + "/" + kisi.cep + "/" + kisi.TC + "/"
    + kisi.eposta + "/" + kisi.giris_tarih + "/" + kisi.dogum + "/" + kisi.dogum_yeri + "/" + kisi.anne_adi + "/" + kisi.baba_adi);
    return res.data;
  },


  async update_kisi(kisi) {
    // debugger;
     let res = await axios.get("http://localhost:3000/update/" + kisi.rol_id + "/" + kisi.name + "/" + kisi.surname + "/" + kisi.cep + "/" + kisi.TC + "/"
     + kisi.eposta + "/" + kisi.giris_tarih + "/" + format_date(kisi.dogum) + "/" + kisi.dogum_yeri + "/" + kisi.anne_adi + "/" + kisi.baba_adi + "/" + kisi.id);
     return res.data;
   },
   async sil(kisi) {
    // debugger;
     let res = await axios.get("http://localhost:3000/delete/" + kisi);
     return res.data;
   },
   async giris(giris) {
    // debugger;
     let res = await axios.get("http://localhost:3000/giris/" + giris.e_posta + "/" + giris.sifre);
     return res.data;
   },

  
}