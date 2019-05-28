export default class Gate{
   
    constructor(user){

        this.user = user;

    }

    isAdmin(){
        return this.user.type === 'admin'; 
    }

    isUser(){
        return this.user.type === 'user'; 
    }

    isWeb(){
        return this.user.type === 'web'; 
    }

    isAdminOrUser(){

        if(this.user.type === 'admin' || this.user.type === 'user'){
            return true; 
        }
    }

    isAdminOrWeb(){

        if(this.user.type === 'admin' || this.user.type === 'web'){
            return true; 
        }
    }
    
}