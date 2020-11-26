<template>
  <div id="app" class="mt-0" >
   <!-- çağırdığımız tek component listele componenti. 
   Bunun nedeni daha sonra başka projede listele componentini değiştirmeden app.vue üzerinde değişiklikler yaparak başka projeye entegre edebilmek.--> 
    <listele/>
  </div>
</template>

<script>
import listele from '@/components/listele.vue'

export default {
  components: {
    listele : listele,
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
