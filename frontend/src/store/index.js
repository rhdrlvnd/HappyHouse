import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default new Vuex.Store({
  state: {
    accessToken: null,
    userId: "",
    userName: "",
    aptName: "",
    selectsido: 0,
    selectgugun: 0,
    selectdong: 0,
    sido:[
      {sidoCode: 11, sidoName:"서울특별시"},
    ],
    gugun:[
      {gugunCode: 11, gugunName:"서울특별시"},
    ],
    dong:[
      {code: 11, dong:"서울특별시"},
    ],
    apts:[
    ],
    ranks:[
    ],
    boards: [  
    ],
    articles: [
    ],
    favs: [],
    favapt:[],
    favorite:{user_no : 6, deal_no: 6},
  },
  getters: {
    getAccessToken(state) {
      if(localStorage.accessToken && typeof localStorage.accessToken != "undefined")
        return localStorage.accessToken;
      console.log("getAccessToken" + localStorage.accessToken +" " + state.accessToken);
      if(state.accessToken == null)
        return false;
      return state.accessToken;
    },
    getUserId(state) {
      return state.userId;
    },
    getUserName(state) {
      return state.userName;
    }
  },
  mutations: {
    LOGIN(state, payload) {
      console.log("payload[auth-token]: " + payload["auth-token"]);
      state.accessToken = payload["auth-token"];
      state.userId = payload["user-id"];
      state.userName = payload["user-name"];
      state.userNo = payload["user-no"];
      localStorage.accessToken = state.accessToken;
      localStorage.user_no = state.userNo;
    },
    GETSIDO(state, payload) {
      state.sido = payload["list"];
    },
    GETGUGUN(state, payload) {
      state.gugun = payload["list"];
    },
    GETDONG(state, payload) {
      state.dong = payload["list"];
    },
    SEARCHDONG(state, payload) {
      state.apts = payload["list"];
    },
    SEARCHNAME(state, payload) {
      state.apts = payload["list"];
    },
    GETRANK(state, payload) {
      state.ranks = payload;
    },
    GETBOARD(state, payload) {
      state.boards = payload["list"];
    },
    GETFAVLIST(state, payload) {
      state.favs = payload["list"];
    },
    LOGOUT(state) {
      localStorage.clear();
      state.accessToken = null;
      state.userId = "";
      state.userName = "";
    }
  },
  actions: {
    LOGIN(context, user) {
      console.log(SERVER_URL);
      return axios
        .post(`${SERVER_URL}/user/login`, user)
        .then((response) => {
          context.commit("LOGIN", response.data);
          axios.defaults.headers.common[
            "auth-token"
          ] = `${response.data["auth-token"]}`;
        });
    },
    REGIST(context, user) {
      return axios
        .post(`${SERVER_URL}/user/register`, user)
        // .then((response) => {
          // context.commit("REGIST", response.data);
          // axios.defaults.headers.common[
          //   "auth-token"
          // ] = `${response.data["auth-token"]}`;
        // });
    },
    FAVORITE() {
      console.log("favorite : " + this.state.favorite.deal_no);
      return axios
        .post(`${SERVER_URL}/favorite/insert`, this.state.favorite)
        .then((response) => {
          console.log(response)
        });
    },

    GETSIDO(context) {
      console.log(SERVER_URL);
      return axios
        .get(`${SERVER_URL}/map/sido`)
        .then((response) => {
          context.commit("GETSIDO", response.data);
        });
    },
    GETGUGUN(context) {
      return axios
        .get(`${SERVER_URL}/map/gugun`,
        {params: {
          sidoCode: this.state.sido[this.state.selectsido]["sidoCode"]
        }})
        .then((response) => {
          context.commit("GETGUGUN", response.data);
        });
    },
    GETDONG(context) {
      return axios
        .get(`${SERVER_URL}/map/dong`,
        {params: {
          gugunCode: this.state.gugun[this.state.selectgugun]["gugunCode"]
        }})
        .then((response) => {
          context.commit("GETDONG", response.data);
        });
    },
    SEARCHDONG(context) {
      return axios
        .get(`${SERVER_URL}/house/dong`,
        {params: {
          dong: this.state.dong[this.state.selectdong]["dong"]
        }})
        .then((response) => {
          context.commit("SEARCHDONG", response.data);
        });
    },
    SEARCHNAME(context) {
      return axios
        .get(`${SERVER_URL}/house/apt`,
        {params: {
          aptName: this.state.aptName
        }})
        .then((response) => {
          context.commit("SEARCHNAME", response.data);
        });
    },
    GETRANK(context) {
      return axios
        .get(`${SERVER_URL}/favorite/rank`)
        .then((response) => {
          context.commit("GETRANK", response.data);
        });
    },
    GETBOARD(context) {
      console.log("");
      return axios
        .get(`${SERVER_URL}/boards`)
        .then((response) => {
          console.log(response);
          console.log(response.data["list"][0]);
          context.commit("GETBOARD", response.data);
      });
    },
    GETFAVLIST(context) {
      return axios
        .get(`${ SERVER_URL }/mypage/favlist`)
      .then((response)=>{
        context.commit("GETFAVLIST",response.data);
      });
    },
    WRITE(context, board) {
      console.log(board.title);
      console.log(board.content);
      return axios
        .post(`${SERVER_URL}/boards/insert`, board)
        
    },
    LOGOUT(context) {
      context.commit("LOGOUT");
      axios.defaults.headers.common["auth-token"] = undefined;
    }
  },
  modules: {}
});