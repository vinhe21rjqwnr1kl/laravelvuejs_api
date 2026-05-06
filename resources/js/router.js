import { createRouter, createMemoryHistory } from "vue-router";
import Categories from "./Components/Brands/Index.vue";
import Brands from "./Components/Categories/Index.vue";
import Products from "./Components/Products/Index.vue";

const routes = [
   {
    path : "/categories",
    component : Categories,
   },
   {
    path : "/brands",
    component : Brands,
   },
   {
    path:"/products",
    component:Products,
   }
   //thêm các router khác nếu cần 
];
const router = createRouter({
   history : createMemoryHistory(),
   routes,
});

export default router;