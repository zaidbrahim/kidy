<style>
    .widget-user-header{
        background-position: center center;
        background-size: cover;
        height: 250px;
    }
</style>
<template>
    <div class="container">
        <div class="row">
          <div class="col-md-3">
            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle" :src="getProfilePhoto()" alt="User profile picture">
                </div>
                <h3 class="profile-username text-center">{{ this.form.name }}</h3>
                <p class="text-muted text-center">{{ this.form.type }}</p>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Followers</b> <a class="float-right">1,322</a>
                  </li>
                  <li class="list-group-item">
                    <b>Following</b> <a class="float-right">543</a>
                  </li>
                  <li class="list-group-item">
                    <b>Friends</b> <a class="float-right">13,287</a>
                  </li>
                </ul>
                <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active show" href="#settings" data-toggle="tab">Settings</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active show" id="settings">
                    <form class="form-horizontal">
                      <div class="form-group">
                        <label for="inputName" class="col-sm-2 control-label">Nom</label>
                        <div class="col-sm-10">
                            <input type="text" v-model="form.name" class="form-control" id="inputName" placeholder="Nom" :class="{ 'is-invalid': form.errors.has('name') }">
                            <has-error :form="form" field="name"></has-error>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" v-model="form.email" class="form-control" id="inputEmail" placeholder="Email" :class="{ 'is-invalid': form.errors.has('email') }">
                          <has-error :form="form" field="email"></has-error>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputPhoto" class="col-sm-2 control-label">Photo</label>
                        <div class="col-sm-10">
                            <input type="file" @change="updateProfile" class="form-control-file" id="inputPhoto">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="password" class="col-sm-12 control-label">Password (leave empty if not changing)</label>
                        <div class="col-sm-10">
                           <input type="password" v-model="form.password" class="form-control" id="password" placeholder="Password" :class="{ 'is-invalid': form.errors.has('password') }">
                           <has-error :form="form" field="password"></has-error>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                          <button type="submit" @click.prevent="updateInfo" class="btn btn-success">Update</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                form: new Form({
                    id: '',
                    name : '',
                    email:'',
                    type: '',
                    photo: '',
                    password: ''
                })
            }
        }, 

        mounted() {
            console.log('Component mounted.')
        },

        methods: {
            loadProfile(){
                axios.get('api/profile')
                .then(({ data }) => ( this.form.fill(data)));
            },

            updateProfile(e){
                let file = e.target.files[0];
                // console.log(file);
                let reader = new FileReader();
                if(file['size'] < 2111775){
                    reader.onloadend = (file) => {
                    // console.log('RESULT', reader.result)
                    this.form.photo = reader.result;
                    }
                    
                    reader.readAsDataURL(file);
                    
                }
                else{
                    swal.fire({
                        type: 'error',
                        title: 'Oops...',
                        text: 'You are uploading a large file!',
                    })
                }  
            },

            updateInfo() {
                this.$Progress.start();
                this.form.put('api/profile/')
                .then(() => {
                    this.$Progress.finish();
                    toast.fire({
                        type: 'success',
                        title: 'Informations modifiées avec succès'
                    })
                    Fire.$emit('Refresh');

                })
                .catch(() =>{
                    this.$Progress.fail();
                })
            },

            getProfilePhoto(){
                let photo = (this.form.photo.length > 200) ? this.form.photo : "img/profile/"+ this.form.photo ;
                return photo;
            },

        },

        created() {
            this.loadProfile();
            Fire.$on('Refresh', () => {
                this.loadProfile();
            });
        }
    }
</script>
