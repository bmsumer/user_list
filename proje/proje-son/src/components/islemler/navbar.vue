<template >
    
    <div>
        <b-navbar toggleable="lg" variant="faded" type="light">
            <b-navbar-brand  href="#" class="float-left"><h3 class="float-left mr-2 ">Risksoft Panel </h3> <h5 class="float-left mt-1 text-secondary" > / {{konum}}</h5> </b-navbar-brand>
            <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

            <b-collapse id="nav-collapse" is-nav>
            <b-navbar-nav class="ml-auto">
                <giris v-if="!user.id" @user="user = $event"/>
                <b-nav-item-dropdown class="float-left" v-if="user.id" right>
             
                <template #button-content class="float-left">
                    <em class="font-weight-bold">{{user.name}} {{user.surname}} </em>
                    <br/>
                    <em class="font-weight-light float-left" v-for="yetki_adedi in yetkiler" :key="yetki_adedi.id">
                         <div v-if="yetki_adedi.id == user.rol_id" class="text-secondary">{{yetki_adedi.name}} </div>
                    </em>
                </template>
                <b-button variant="light" class="bg-white border-0" @click="profil_ac()">Profil</b-button>
                <br/>
                <b-button variant="light" class="bg-white border-0" @click="cikis()">Çıkış Yap</b-button>
                </b-nav-item-dropdown>
            </b-navbar-nav>
            </b-collapse>
        </b-navbar>
</div>
    
</template>
<script>
import giris from '@/components/islemler/giris.vue'
import EventService from '@/services/EventService.js';

export default {
   props : ["konum"],
   components: {
      giris : giris,
   },
   data(){
       return{
            user : [],
            yetkiler : {},
       }
   },
   mounted() {
      EventService.getRoller()
            .then(
                (yetkiler => {
                    this.$set(this, "yetkiler", yetkiler);
                    }).bind(this)
                );
   },
   methods : {
       cikis() {
           this.user = [];
       },
       profil_ac(){
           this.$emit("edit_profile", this.user);
       }
      
   },
   watch : {
        user(val) {
            if(val.id){
                this.$emit('profile', val);
            }
            else{
                this.$emit('profile', {"id": -1,});
            }
        },
       
   }
   
   
}
</script>
<style>
.kutu{
    margin-left: 5%;
    margin-right: 5%;
    margin-top: 2%;
}
</style>