<template>
    <div class="kutu  card bg-light p-3  rounded container-lg border-0 ">
       <div class=" border-0 container" >
            <div class=" container ">
                <div class="col-md-3 col-xs-8 float-left card shadow containeri container">
                     <div class="col-md-7 mb-4 mt-5 mx-auto d-block ">
                        <img class="rounded-circle z-depth-2 img-fluid border" alt="100x100" src="@/img/profile-non.png"
                        data-holder-rendered="true">
                        <button class=" btn shadow" ><i class="fas fa-pen"></i> </button>
                    </div>
                    <div class="col-md-13 mb-5  text-center">
                        <h5>{{kisi[0].name}} {{kisi[0].surname}}</h5> 
                        
                        <div v-for="yetki_adedi in yetki" :key="yetki_adedi.id">
                            <div v-if="yetki_adedi.id == kisi[0].rol_id" class="text-secondary">{{yetki_adedi.name}}</div>
                        </div>
                        <div class="text-secondary">{{kisi[0].eposta}}</div>
                    </div>
                    <br/>
                     <br/>
                     <br/>
                </div>

                <div class="col-md-8 col-xs-8 card shadow container">
                    <div class="card-header row bg-white ">
                        <div class="col-md-6 d-flex justify-content-start font-weight-bold align-text-bottom mt-2">
                            <i class="fas fa-user-tie fa-lg mr-3"></i><div class="align-text-bottom"> KULLANICI BİLGİLERİ</div>
                        </div>
                        <div class="col-md-6 d-flex justify-content-end ">
                            <b-button variant="warning" class="border-0 btn-sm"  @click="düzenle_git(kisi[0])" :disabled="gelen_rol_id != 1"><i class="fas fa-pen"></i> Düzenle</b-button>
                        </div>   
                    </div>
                <div class=" mt-3 mb-3 mr-3">
                    <div class="w-50 " style="float:left;">
                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-5 ">
                                <span class="input-group-text bg-white border-0 font-weight-bold" >Ad</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{kisi[0].name}}</div>
                        </div>
                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-5">
                                <span class="input-group-text bg-white border-0 font-weight-bold">Soyad</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{kisi[0].surname}}</div>
                        </div>
                        
                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-5">
                                <span class="input-group-text bg-white border-0 font-weight-bold">Cep Telefonu</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{kisi[0].cep}}</div>
                        </div>

                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-5">
                                <span class="input-group-text bg-white border-0 font-weight-bold">TC Kimlik No</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{kisi[0].TC}}</div>
                        </div>

                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-5">
                                <span class="input-group-text bg-white border-0 font-weight-bold">E-Mail</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{kisi[0].eposta}}</div>
                        </div>
                    </div>

                    <div class="w-40 ml-3" style="float:left;">
                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-6">
                                <span class="input-group-text bg-white border-0 font-weight-bold">İşe Giriş Tarihi</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{format_date(kisi[0].giris_tarih)}}</div>
                        </div>
                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-6">
                                <span class="input-group-text bg-white border-0 font-weight-bold">Doğum Tarihi</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{format_date(kisi[0].dogum)}}</div>
                        </div> 
                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-6">
                                <span class="input-group-text bg-white border-0 font-weight-bold">Doğum Yeri</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{kisi[0].dogum_yeri}}</div>
                        </div>
                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-6">
                                <span class="input-group-text bg-white border-0 font-weight-bold">Anne Adı</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{kisi[0].anne_adi}}</div>
                        </div>
                        <div class="input-group d-flex justify-content-start mb-3" style="float:none;">
                            <div class=" input-group-prepend d-flex justify-content-start col-6">
                                <span class="input-group-text bg-white border-0 font-weight-bold">Baba Adı</span>
                            </div>
                            <div class="input-group-text bg-white border-0  col-6 d-flex justify-content-start">{{kisi[0].baba_adi}}</div>
                        </div>
                    </div>
                    <br/>
                </div>
                <br/>
                </div>
                <br/>   
            </div>
        </div>
        </div>
</template>
<script>
import moment from 'moment'
export default {
    props : ["kisi", "yetki", "gelen_rol_id"],
    data(){
       return{   
       }     
   },
     methods: { 
      format_date(value){
         if (value) {
           return moment(String(value)).format('DD-MM-YYYY')
          }
      },
      düzenle_git(gelen_kisi){
           this.$emit("open_duzenle", gelen_kisi);
       },
   },
}
</script>
<style>
.kutu{
    margin-left: 2%;
    margin-right: 2%;
    margin-top: 2%;
}

.containeri {
  position: relative;
  width: 100%;
  max-width: 400px;
}

.containeri img {
  width: 100%;
  height: auto;
}

.containeri .btn {
  position: absolute;
  transform: translate(-70%, -30%);
  -ms-transform: translate(-75%, -75%);
  background-color: white;
  color: #555;
  font-size: 16px;
  padding: 6px 12px;
  border: none;
  cursor: pointer;
  border-radius: 50%;
  text-align: center;
  text-decoration: none;
  margin-top: 2%;
  
}
.containeri .btn:hover {
  background-color: grey;
}
</style>