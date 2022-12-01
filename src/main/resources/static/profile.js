const profile = {

    // Préparation des données
    data() {
        console.log("data");
        return {
            axios: null,
            router: null,
            username: null,
            user: {},
            activities: [],
            cv: null,
            token: null,
            isLoggedIn: false,
            isLoggedOut: false,
        }
    },

    // Mise en place de l'application
    mounted() {
        console.log("Mounted ");
        this.axios = axios.create({
            baseURL: 'http://localhost:8081/',
            headers: { 'Content-Type': 'application/json' },
        });
        this.getCurrentUser();
        this.getCvActivities();
        this.getCurrentUserCv();
    },

    methods: {

        getCvActivities: function (id){
            this.axios.get("api/cv/"+id)
                .then(r => {
                    console.log("show cv"+id+" done");
                    this.cv = r.data;
                });
            },
        // Place pour les futures méthodes
        getCurrentUser: function (){
            this.username = localStorage.getItem('USERNAME')
            console.log(this.username)
            if (this.username != null){
                this.isLoggedIn = true
            }
        },
        getCurrentUserCv: function (){
            this.axios.get("api/profileCv")
                .then(r => {
                    console.log("show cv done");
                    this.cv = r.data;
                    console.log(r.data);
                });


        },
        logoutUser: async function(){
            localStorage.removeItem('TOKEN')
            localStorage.removeItem('USERNAME')
            localStorage.clear()
            this.isLoggedOut = true
            window.location.href = '/login'
            console.log(this.isLoggedOut)

        },


    }
}
Vue.createApp(profile).mount('#profile');