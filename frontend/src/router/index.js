import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '@/views/Home.vue';
import SearchLocation from '@/views/SearchLocation.vue';
import SearchApt from '@/views/SearchApt.vue';
import RegistApt from '@/views/RegistApt.vue';
import DetailApt from '@/components/DetailApt.vue';
import MyPageFavList from '@/components/MyPage/MyPageFavList.vue';
import MyPageMngInfo from '@/components/MyPage/MyPageMngInfo.vue';
import UpdateMyInfo from '@/components/MyPage/UpdateMyInfo.vue';
import Board from '@/views/Board.vue';
import WriteArticle from '@/components/Board/WriteArticle.vue';
import DetailArticle from '@/components/Board/DetailArticle.vue';
import UpdateArticle from '@/components/Board/UpdateArticle.vue';

Vue.use(VueRouter);

import Header from "@/components/Header.vue";

// Main = 아파트 포함 맵
// Home
// 동검색: searchLocation  , SearchLocation
// 아파트검색: searchApt ,  SearchApt 
// 매물: registApt


export default new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,

  routes: [
    {
      path: '/',
      components: {
        Header: Header,
        default: Home,
      }
    },

    {
      path: '/searchLocation',
      components: {
        Header: Header,
        default: SearchLocation,
      }
    },

    {
      path: '/searchApt',
      components: {
        Header: Header,
        default: SearchApt,
      }
    },

    {
      path: '/registApt',
      components: {
        Header: Header,
        default: RegistApt,
      }
    },

    {
      path: '/detailApt',
      components: {
        Header: Header,
        default: DetailApt,
      }
    },

    {
      path: '/myPageFavList',
      components: {
        Header: Header,
        default: MyPageFavList,
      }
    },

    {
      path: '/myPageMngInfo',
      components: {
        Header: Header,
        default: MyPageMngInfo,
      }
    },
    {
      path: '/myPageMngInfo/update',
      components: {
        Header: Header,
        default: UpdateMyInfo,
      }
    },

    {
      path: '/board',
      components: {
        Header: Header,
        default: Board,
      }
    },
    {
      path: '/board/detail',
      components: {
        Header: Header,
        default: DetailArticle,
      }
    },
    {
      path: '/board/writeArticle',
      components: {
        Header: Header,
        default: WriteArticle,
      }
    },
    {
      path: '/board/updateArticle',
      components: {
        Header: Header,
        default: UpdateArticle,
      }
    }
  ],
});
