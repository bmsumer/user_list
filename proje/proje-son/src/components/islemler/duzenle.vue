<template>
    <div class="kutu">
     
        <div class="card  container border-0" >
            <div class="card-body ">
                <div class="w-50 input-group mb-3 d-flex justify-content-end ">
                    <div class=" input-group-prepend">
                        <label class="input-group-text bg-white border-0" for="kullaıcı_yetkisi">*Kullanıcı Yetkisi</label>
                    </div>
                        <select class="custom-select col-4 d-flex justify-content-start" id="kullaıcı_yetkisi" v-model="kisi[0].rol_id">
                            <option v-for="yetki_adedi in yetki" :key="yetki_adedi.id" :value="yetki_adedi.id" :selected="yetki_adedi.id == kisi[0].rol_id">{{yetki_adedi.name}} </option>
                        </select>
                       <div class="col-4"></div>     
                </div>
                <div class=" ">
                    <div class="w-50 " style="float:left;">
                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0" >* Ad</span>
                            </div>
                            <input type="text" aria-label="First name" class="form-control col-8"  v-model="kisi[0].name" >
                        </div>
                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0">* Soyad</span>
                            </div>
                            <input type="text" aria-label="Second name" class="form-control col-8" v-model="kisi[0].surname">
                        </div>
                        
                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0">* Cep Telefonu</span>
                            </div>
                            <input type="tel" aria-label="phone" class="form-control col-8" v-model="kisi[0].cep" placeholder="555-444-33-22" @input="format_phone">
                        </div>

                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0">* TC Kimlik No</span>
                            </div>
                            <input type="text" aria-label="TC" class="form-control col-8" v-model="kisi[0].TC">
                        </div>

                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0">* E-Mail</span>
                            </div>
                            <input type="text" aria-label="email" class="form-control col-8" v-model="kisi[0].eposta">
                        </div>
                    </div>
                    
                    <div class="w-50 " style="float:left;">
                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0">* İşe Giriş Tarihi</span>
                            </div>
                            <input type="date" aria-label="work_date" class="form-control col-8" :value="format_date(kisi[0].giris_tarih)" @input="update_giris(format_date($event.target.value))">
                        </div>

                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0">Doğum Tarihi</span>
                            </div>
                            <input type="date" aria-label="birth_date" class="form-control col-8" :value="format_date(kisi[0].dogum)" @input="update_dogum(format_date($event.target.value))">
                        </div>
                   
                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0">Doğum Yeri</span>
                            </div>
                            <input type="text" aria-label="dogum_yeri" class="form-control col-8" v-model="kisi[0].dogum_yeri">
                        </div>
                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0">Anne Adı</span>
                            </div>
                            <input type="text" aria-label="anne_adi" class="form-control col-8" v-model="kisi[0].anne_adi">
                        </div>
                        <div class="input-group d-flex justify-content-end mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-end">
                                <span class="input-group-text bg-white border-0">Baba Adı</span>
                            </div>
                            <input type="text" aria-label="baba_adi" class="form-control col-8" v-model="kisi[0].baba_adi">
                        </div>
                    </div>

                </div>
                
            </div>
        </div>
        <div v-if="kisi[0].id == null" class="col-7 d-flex justify-content-end">
            <b-button class="col-4" variant="primary" @click="ekle_basildi(kisi[0]);">Ekle</b-button>
            <b-button class="col-4 ml-2 border-0" variant="light" @click="temizle_basildi()">Temizle</b-button>
        </div>
        <div v-if="kisi[0].id != null" class="col-7 d-flex justify-content-end">
            <b-button class=" btn-success col-4"  @click="kaydet_basildi(kisi[0])">Kaydet</b-button>
            <b-button class=" btn-danger col-4 ml-2"  block @click="iptal_basildi()">İptal</b-button>
        </div>
    </div>
</template>
<script>
import moment from 'moment'
import EventService from '@/services/EventService.js';

export default {
    props : ["kisi", "yetki"],
    data(){
       return{      
       }     
   },
  methods: { 
      // Tarih formatını düzeltme
      format_date(value){
         if (value) {
           return moment(String(value)).format('YYYY-MM-DD')
          }
      },
      // Telefon formatını düzeltme
        format_phone() {
            var x = this.kisi[0].cep.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,2})(\d{0,2})/);
            this.kisi[0].cep = !x[2] ? x[1] :'(' + x[1] + ') ' + x[2] + (x[3] ? ' ' + x[3] : '') + (x[4] ? ' ' + x[4] : '');
        },
     // dogum tarihi düzeltilmiş
      update_dogum(value){
          this.kisi[0].dogum = value;
          this.$emit('input', value);
      },
    // giriş tarihi düzeltilmiş
      update_giris(value){
          this.kisi[0].giris_tarih = value;
          this.$emit('input', value);
      },
      // Sunucuya veri gönderme ve göndermeden önce standart formatta veri kaydetme
      ekle_basildi(value){
            if (this.kontrol(value)){
                if(this.kisi[0].cep[0] != "+"){
                    this.kisi[0].cep = "+90 " + this.kisi[0].cep;
                }
                value.name = value.name.charAt(0).toUpperCase() + value.name.slice(1).toLowerCase();
                value.surname = value.surname.charAt(0).toUpperCase() + value.surname.slice(1).toLowerCase();
                value.eposta = value.eposta.toLowerCase();
                if(value.dogum_yeri !== undefined){
                     value.dogum_yeri = value.dogum_yeri.charAt(0).toUpperCase() + value.dogum_yeri.slice(1).toLowerCase();
                }
                if(value.anne_adi !== undefined){
                     value.anne_adi = value.anne_adi.charAt(0).toUpperCase() + value.anne_adi.slice(1).toLowerCase();
                }
                if(value.baba_adi !== undefined){
                   
                    value.baba_adi = value.baba_adi.charAt(0).toUpperCase() + value.baba_adi.slice(1).toLowerCase();
                }
                EventService.ekle_kisi(value);
                this.$emit("ekle_basildi", "modal_ekle");
            }
            
      },
      // Zorunlu alanların kontrolu, alanların format kontrolu
      kontrol(gelen){
          if(gelen.name == "" || gelen.name === undefined){
               alert("İsim Boş Bırakılamaz");
               return false;
           }
           else if(gelen.surname == "" || gelen.surname === undefined){
               alert("Soyisim Boş Bırakılamaz" );
               return false;
           }
           else if(gelen.cep == "" || gelen.cep === undefined || (gelen.cep.length != 15 && gelen.cep.length != 19)){
               alert("Girdiğiniz Cep Telefonu Numarası Hatalı");
               return false;
           }
            else if(gelen.TC == "" || gelen.TC === undefined || gelen.TC.length != 11){
               alert("Girdiğiniz TC No Hatalı");
               return false;
           }
            else if(gelen.eposta == "" || gelen.eposta === undefined){
               alert("Eposta Boş Bırakılamaz");
               return false;
           }
            else if(gelen.giris_tarih == "" || gelen.giris_tarih === undefined){
               alert("Geçerli Bir işe giriş tarihi giriniz");
               return false;
           }
           else if(gelen.rol_id == "" || gelen.rol_id === undefined || gelen.rol_id == "0"){
               alert("Kullanıcı Rolü Seçmelisiniz");
               return false;
           }
           else{
               
               return true;
           }
      },
      // iptal tuşuna basıldığında ana ekrana geri dönme
      iptal_basildi(){
          this.$emit("iptal_basildi", "modal_duzenle");
      },
      // temizle butonuna basıldığında verilerin boşaltılması
      temizle_basildi(){
          this.$set(this.kisi, 0, "");
      },
      // kaydet butonuna basıldığında yapılacak işlemler
      kaydet_basildi(value){
          if (this.kontrol(value)){
             if(this.kisi[0].cep[0] != "+"){
                    this.kisi[0].cep = "+90 " + this.kisi[0].cep;
                }
            value.name = value.name.charAt(0).toUpperCase() + value.name.slice(1).toLowerCase();
                value.surname = value.surname.charAt(0).toUpperCase() + value.surname.slice(1).toLowerCase();
                value.eposta = value.eposta.toLowerCase();
                if(value.dogum_yeri !== undefined){
                     value.dogum_yeri = value.dogum_yeri.charAt(0).toUpperCase() + value.dogum_yeri.slice(1).toLowerCase();
                }
                if(value.anne_adi !== undefined){
                     value.anne_adi = value.anne_adi.charAt(0).toUpperCase() + value.anne_adi.slice(1).toLowerCase();
                }
                if(value.baba_adi !== undefined){
                   
                    value.baba_adi = value.baba_adi.charAt(0).toUpperCase() + value.baba_adi.slice(1).toLowerCase();
                }
            EventService.update_kisi(value);
            this.$emit("iptal_basildi", "modal_duzenle");
          }
      }
   },
  
   watch :{
    },
    mounted(){
    },
}
</script>
<style>
.kutu{
    margin-left: 5%;
    margin-right: 5%;
    margin-top: 2%;
}
</style>