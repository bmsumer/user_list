<template >
    <div  class="mt-0">
     <!-- Burada navbar.vue componentini çağırıyoruz ve her sayfada kullanıyoruz kullanıcı giriş yaptıktan sonra  navbar componenti ilgili verileri kullanıcıya iletiyor.-->
      <navbar @edit_profile="incele($event)" @profile="gelen_profile($event)" v-bind:konum="konum_adi"/>
        <div class="kutu shadow p-3 mb-5 bg-white rounded container-lg " v-if="profile[0].id == -1">
           <h1>Risksoft Panele Hoşegeldiniz</h1> 
           <h3>Kullanıcı Bilgilerini Görüntülemek İçin Lütfen Giriş Yapınız</h3> 
        </div>
      <div class="kutu shadow p-3 mb-5 bg-white rounded container-lg " v-if="profile[0].id != -1">
        <div class="card  container-lg"  >
            <div class="card-header row bg-white">
                <i class="fas fa-user-tie fa-lg mr-3"></i>KULLANICI LİSTESİ
            </div>
            <div class="card-body">
            <div class="mb-2">
                <input v-if="!arama" type="text"  class="form-control col-4 float-left mr-2" v-model="gelen" placeholder="Aramak İstediğiniz TC No, İsim veya Soyisimi Giriniz" @change="search_tc()" />
                <button v-if="!arama" type="button" class="btn btn-primary d-flex justify-content-start text-justify float-left" v-on:click="search_tc()" >Ara</button>
                <button v-if="arama" type="button" class="btn btn-danger d-flex justify-content-start text-justify float-left " v-on:click="search_tc()">Arama İptal</button>
                <div class="d-flex justify-content-end">
                    <button  type="button" class="btn btn-success " @click="ekle([])" :disabled="profile[0].rol_id != 1"><i class="fas fa-plus"></i> Kullanıcı Ekle</button>
                </div> 
            </div>
                <table class="table table-bordered " id="listele_table">
                    <thead>
                        <tr>
                            <th scope="col">Kullanıcı Adı</th>
                            <th scope="col">Kullanıcı Yetkisi</th>
                            <th scope="col">E-Mail</th>
                            <th scope="col">TC Kimlik No</th>
                            <th scope="col">Cep Telefonu</th>
                            <th scope="col">İşlemler</th>
                        </tr>
                    </thead>
                    <tbody >
                            <tr  scope="row"  v-for="kullanıcı in kullanıcılar" :key="kullanıcı.id">
                                <td v-if="filter_id.indexOf(kullanıcı.id) != -1 || !arama">{{kullanıcı.name}} {{kullanıcı.surname}}</td>
                                <td v-if="filter_id.indexOf(kullanıcı.id) != -1 || !arama">{{yetkiler[kullanıcı.rol_id-1].name}}</td>
                                <td v-if="filter_id.indexOf(kullanıcı.id) != -1 || !arama">{{kullanıcı.eposta}}</td>
                                <td v-if="filter_id.indexOf(kullanıcı.id) != -1 || !arama">{{kullanıcı.TC}}</td>
                                <td v-if="filter_id.indexOf(kullanıcı.id) != -1 || !arama">{{kullanıcı.cep}}</td>
                                <td v-if="filter_id.indexOf(kullanıcı.id) != -1 || !arama">
                                        <b-dropdown   variant="link"  class="col-16" no-caret>
                                            <template #button-content>
                                            <i class="fas fa-ellipsis-h fa-lg"></i>
                                            </template>
                                            <b-button variant="outline-primary" class="border-0" @click="incele(kullanıcı)"><i class="far fa-eye"></i> İncele</b-button>
                                            <b-button variant="outline-primary" class="border-0" @click="düzenle(kullanıcı)" :disabled="profile[0].rol_id != 1"><i class="fas fa-pen"></i> Düzenle</b-button>
                                            <b-dropdown-divider></b-dropdown-divider>
                                            <b-button variant="outline-primary"  class="border-0" @click="silme_uyarısı(kullanıcı)" :disabled="profile[0].rol_id != 1"><i class="far fa-trash-alt"></i> Sil</b-button> 
                                        </b-dropdown>
                                </td> 
                            </tr>  
                    </tbody>
                </table>
                <div class="mt-0">
                    <b-modal size="xl" id="modal_duzenle" hide-footer @hide="konum_adi = 'Kullanıcılar'">
                        <template #modal-title>
                            <i class='fas fa-user-tie fa-lg mr-3"'> </i>  KULLANICI DÜZENLE 
                        </template>
                        <duzenle @iptal_basildi="kapat($event)" class="mt-0" :kisi="duzenle_kisi" :yetki="yetkiler" />                       
                    </b-modal>
                </div>
                <div class="mt-0">
                    <b-modal size="xl" id="modal_ekle" hide-footer @hide="konum_adi = 'Kullanıcılar'">
                        <template #modal-title>
                            <i class='fas fa-user-tie fa-lg mr-3"'> </i>  KULLANICI EKLE 
                        </template>
                        <duzenle @ekle_basildi="kapat($event)"  class="mt-0" :kisi="duzenle_kisi" :yetki="yetkiler"/>
                    </b-modal>
                </div>
                    <b-modal size="xl" variant="outline-primary" body-bg-variant="light" header-bg-variant="light" id="modal_incele" hide-footer hide-header @hide="konum_adi = 'Kullanıcılar'">
                        <incele @open_duzenle="düzenle($event)" class="ml-2" :kisi="incele_kisi" :yetki="yetkiler" :gelen_rol_id="profile[0].rol_id"/> 
                    </b-modal>
                    <div>
                        <b-modal id="modal_sil" title="Silmek İstediğinizden Emin misiniz?" hide-footer @hide="konum_adi = 'Kullanıcılar'">
                            <b-button class="btn-danger col-5 ml-4 float-left mr-2" @click="sil()"><i class="far fa-trash-alt"></i> Sil</b-button>
                            <b-button class=" btn-success col-5 ml-2"  block @click="hideModal('modal_sil')">İptal</b-button>
                        </b-modal>
                    </div>
            </div>
        </div>
       </div> 
    </div>
</template>
<script>
import duzenle from '@/components/islemler/duzenle.vue'
import incele from '@/components/islemler/incele.vue'
import EventService from '@/services/EventService.js'
import navbar from '@/components/islemler/navbar.vue'
export default {
   components: {
        duzenle : duzenle,
        incele : incele,
        navbar : navbar,
   },
   data(){
       return{
           konum_adi : "Giriş Ekranı",
           events: [],
           users: [],
           positions: [],
           filter_id : [],
           gelen : "",
           arama : false,
           showModal_duzenle : true,
           key:"",
           sil_value: -1,
           duzenle_kisi : [],
           incele_kisi : [],
           profile : [{"id" :-1,}],
           kullanıcılar :[],
           yetkiler : {}
       }
   },
   mounted() {
       // Sayfa yüklendiğinde veritabanından gereken değerler alınıyor.
        EventService.getKisiler()
            .then(
                (kullanıcılar => {
                    this.$set(this, "kullanıcılar", kullanıcılar);
                    }).bind(this)
                );
        EventService.getRoller()
            .then(
                (yetkiler => {
                    this.$set(this, "yetkiler", yetkiler);
                    }).bind(this)
                );
        
   },
   methods : {
       // Kullanıcı ekle sayfasında ekle butonuna basıldığında veritabanına eklemek için gereken fonskiyon çapırılıyor
       kullanıcı_ekle(){
           EventService.ekle_kisi();
       },
       // Tablo içinde arama burada yapılıyor
       search_tc(){
           if(this.gelen != ""){
               this.filter_id = [];
               this.arama = true;
                for(var i = 0; i<this.kullanıcılar.length; i++){          
                    var sonuc = this.kullanıcılar[i].TC.indexOf(this.gelen);
                    var sonuc_name = this.kullanıcılar[i].name.toLowerCase().indexOf(this.gelen.toLowerCase());
                    var sonuc_surname = this.kullanıcılar[i].surname.toLowerCase().indexOf(this.gelen.toLowerCase());
                    if(sonuc != -1){
                        this.$set(this.filter_id, this.filter_id.length, this.kullanıcılar[i].id)
                    }
                    else if(sonuc_name != -1){
                        this.$set(this.filter_id, this.filter_id.length, this.kullanıcılar[i].id)
                    }
                    else if(sonuc_surname != -1){
                        this.$set(this.filter_id, this.filter_id.length, this.kullanıcılar[i].id)
                    }
                    
                }
           }
           else{
               this.filter_id = [];
               this.arama = false;
           }
           this.gelen = ""
       },
       // Bir modalın kapatılması için çağrılan fonsiyon
        hideModal(name) {
            this.$bvModal.hide(name);
        },
       // İncele butonun basıldığ zaman oluşan işlemler
       incele(gelen){
           this.$set(this.incele_kisi, 0, gelen);
           this.$bvModal.show("modal_incele");
           this.konum_adi = "Kullanıcı Bilgileri";
       },
       // Kullanıcı girişi yapıldığı zaman gelen veri doğrultuusnda yönlendirilecek ekran ve diğer işlemler
       gelen_profile(gelen){
           this.$set(this.profile, 0, gelen);
           if(gelen.id != -1){
               this.konum_adi = "Kullanıcılar";
           }
           else{
               this.konum_adi = "Giriş Ekranı";
           }
       },
       // Düzenle butonun basıldığ zaman oluşan işlemler
       düzenle(gelen){
           this.$set(this.duzenle_kisi, 0, gelen);
           this.$bvModal.show("modal_duzenle");
           this.konum_adi = "Kullanıcı Düzenle";
       },
       // Ekle butonun basıldığ zaman oluşan işlemler
       ekle(gelen){
                this.$set(this.duzenle_kisi, 0, gelen);
                this.$bvModal.show("modal_ekle");
                this.konum_adi = "Kullanıcı Ekle";
       },
       // Bir işlem yapıldıktan sonra ana sayfaya yönlendirme fonsiyonu
       kapat(value){
           this.$bvModal.hide(value);
           EventService.getKisiler()
            .then(
                (kullanıcılar => {
                    this.$set(this, "kullanıcılar", kullanıcılar);
                    }).bind(this)
                );
       },
       // Silmek talebi sonrası uyarı
       silme_uyarısı(value){
            this.sil_value = value.id;
            this.$bvModal.show("modal_sil");
       },
       // Veritabanından silme işlemi
       sil(){
           EventService.sil(this.sil_value);
           EventService.getKisiler()
            .then(
                (kullanıcılar => {
                    this.$set(this, "kullanıcılar", kullanıcılar);
                    }).bind(this)
                );
            this.$bvModal.hide("modal_sil");
       }
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