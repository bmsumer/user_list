<template >
                <div class="mt-0">
                    <div>
                        <b-button class="btn-success" v-b-modal.giris_modal>Giriş Yap</b-button>

                        <b-modal id="giris_modal" title="Giriş Yap" hide-footer>
                            <div class="row ml-4">
                                <h3 class="float-left col-4">E-Posta: </h3>
                                <input  type="text"  class="form-control col-6" v-model="giris_bilgileri.e_posta" placeholder="E-Posta"/>
                            </div>
                            <div class="row ml-4">
                                <h3 class="float-left col-4">Şifre: </h3>
                                <input  type="password"  class="form-control col-6" v-model="giris_bilgileri.sifre" placeholder="Şifre"/>
                            </div>
                            <hr>
                            <b-button class="mt-3 btn-success" block @click="giris()">Giriş Yap</b-button>
                           
                        </b-modal>

                        <div v-if="!kullanıcı[0]">

                            <b-modal id="hatali_modal" hide-footer hide-header>
                                
                                <div class="d-block text-center">
                                <h3>E-Posta veya Şifre Hatalı</h3>
                                </div>
                                <div class="row">
                                    <b-button class="btn-success col float-left ml-2 mr-1" @click="tekrar_dene()">Tekrar Giriş Yap</b-button>
                                    <b-button class="btn-danger col mr-2" v-model="kullanıcı" @click="$bvModal.hide('hatali_modal')">İptal</b-button>
                                </div>
                                
                            </b-modal>
                        </div>

                         <div v-if="kullanıcı[0]">
                         {{kullanıcı[0].id}}
                         </div>
                         
                    </div>
                </div>
       
</template>
<script>
import EventService from '@/services/EventService.js';

export default {
   data(){
       return{
            giris_bilgileri : {
                e_posta : "",
                sifre : "",
            },
            kullanıcı : [],
       }
   },
   mounted() {
      
   },
   methods : {
        kullanıcı_ekle(){
           EventService.ekle_kisi();
        },
        hideModal(name) {
            this.$bvModal.hide(name);
        },
        giris(){
           EventService.giris(this.giris_bilgileri)
            .then(
                (kullanıcı => {
                    this.$set(this, "kullanıcı", kullanıcı);
                    this.giden_veri(this.kullanıcı[0]);
                    }).bind(this)
                    
                );
                 this.$bvModal.hide("giris_modal");
                 this.$bvModal.show("hatali_modal");
        },
        tekrar_dene(){
            this.$bvModal.hide("hatali_modal");
            this.$bvModal.show("giris_modal");
        },
        giden_veri(user){
           this.$emit("user", user);
       },
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