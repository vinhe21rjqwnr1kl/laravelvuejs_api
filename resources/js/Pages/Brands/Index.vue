<template>
    <div>
        <Menu></Menu>
     <h1>Trang Brands</h1>
          <div v-if="loading" class="text-center text-blue-600">Loading brands...</div>
         <div v-else>
            <button @click="openModal(null)" class="bg-teal-500 text-white px-4 py-2 rounded mb-4">
                Add Brands
            </button>

         
         <table class="table-auto w-full border-collapse border border-gray-200 ">
  <thead>
    <tr class="bg-gray-100 text-left">      
      <th class="border border-gray-300 px-4 py-2">Id</th>
      <th class="border border-gray-300 px-4 py-2">Name</th>
      <th class="border border-gray-300 px-4 py-2">Description</th>
      <th class="border border-gray-300 px-4 py-2">Manage</th>
    </tr>
  </thead>
  <tbody>
    <tr v-for="brand in brands"  :key="brand.id">
      <td class="border border-gray-300 px-4 py-2 text-center">{{ brand.id }}</td>
      <td class="border border-gray-300 px-4 py-2 text-center">{{ brand.name }}</td>
      <td class="border border-gray-300 px-4 py-2 text-center">{{ brand.description }}</td>
      <td class="border border-gray-300 px-4 py-2 text-center">
        <button @click="openModal(brand)" class="text-teal-700">Edit</button>
        <button @click="deleteCategory(brand.id)" class="text-red-500 hover:text-red-700">Delete</button>

      </td>
    </tr>
  
  </tbody>
</table>
</div>
    </div>
</template>

<script>
axios
import axios from 'axios';
import Menu from '../Includes/Menu.vue';
     export default {
        components:{
            Menu
        },
        data(){
          return{
          brands :[],
          loading :true,
          error : null
          }
        },
        mounted(){
          this.fetchBrands();
        },
        methods:{
          async fetchBrands() {
            try {
               const response = await axios.get("http://127.0.0.1:8000/api/brands");
               this.brands = response.data;
               console.log(this.brands);
            }
            
             catch (error) {
             console.error("Error fetching brands", error);
            this.error = "failled to load brands, please try again later"
            }finally{
                 this.loading = false
            }
          
        }
    }
  }
</script>

<style lang="scss" scoped>

</style>