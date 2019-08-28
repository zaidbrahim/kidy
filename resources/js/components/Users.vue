<template>
    <div class="container">
        <div class="row" v-if="$gate.isAdminOrUser()">
            <div class="col-12">
              <div class="card border-dark">
                <div class="card-header text-white bg-dark">
                  <h3 cl ass="card-title">Utilisateurs</h3>
                  <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <button class="btn btn-success" @click="newModel">Ajouter <i class="fas fa-user-plus fa-fw"></i></button>
                    </div>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <th>ID</th>
                                <th>Nom</th>
                                <th>Email</th>
                                <th>Type</th>
                                <th>Date d'ajout</th>
                                <th></th>
                            </tr>
                            <tr v-for="user in users.data" :key="user.id">
                                <td>{{ user.id }}</td>
                                <td>{{ user.name | upText }}</td>
                                <td>{{ user.email }}</td>
                                <td>{{ user.type | upText }}</td>
                                <td>{{ user.created_at | myDate }}</td>
                                <td class="text-right">
                                    <a href="#" @click="editModel(user)">
                                        <i class="fas fa-edit"></i>
                                    </a>
                        
                                    <a href="#" @click="deleteUser(user.id)">
                                        <i class="fa fa-trash red"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
                
                <div class="card-footer">
                    <pagination :data="users" @pagination-change-page="getResults"></pagination>
                </div>
                <!--.card-footer -->
              </div>
              <!-- /.card -->
            </div>
        </div>
        <div class="row" v-if="!$gate.isAdminOrUser()">
            <div class="col-md-12">
                <not-found></not-found>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addNew" tabindex="-1" role="dialog" aria-labelledby="addNewLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addNewLabel">Ajouter un nouveau utilisateur</h5>
                        <h5 v-show="editmode" class="modal-title" id="addNewLabel">Modifier un utilisateur</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode ? updateUser() : createUser()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.name" placeholder="Nom" type="text" name="name" class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                <has-error :form="form" field="name"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.email" placeholder="Email" type="email" name="email" class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
                                <has-error :form="form" field="email"></has-error>
                            </div>
                            <div class="form-group">
                                <select name="type" v-model="form.type" id="type" class="form-control" :class="{ 'is-invalid': form.errors.has('type') }">
                                    <option value="">Select User Role</option>
                                    <option value="admin">Admin</option>
                                    <option value="user">Utilisateur</option>
                                    <option value="web">Web</option>
                                </select>
                                <has-error :form="form" field="type"></has-error>
                            </div>

                            <div class="form-group">
                                <input v-model="form.password" type="password" name="password" id="password" class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
                                <has-error :form="form" field="password"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Editer</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Ajouter</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                editmode: false,
                users : {},
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

        methods: {
            newModel(){
                this.editmode = false;
                this.form.reset();
                $('#addNew').modal('show');
            },

            editModel(user){
                this.editmode = true;
                this.form.reset();
                $('#addNew').modal('show');
                this.form.fill(user);
            },

            loadUsers(){
                if(this.$gate.isAdminOrUser()){
                    axios.get("api/user").then(({ data }) => (this.users = data));
                }
            },

            getResults(page = 1) {
                axios.get('api/user?page=' + page)
                    .then(response => {
                        this.users = response.data;
                    });
            },

            createUser(){
                this.$Progress.start();
                this.form.post('api/user')
                .then(() => {
                    Fire.$emit('Refresh');
                    $('#addNew').modal('hide')
                    toast.fire({
                        type: 'success',
                        title: 'Utilisateur ajouter avec success'
                    })
                    this.$Progress.finish();
                })
                .catch(() => {
                    this.$Progress.fail();
                });
            },

            updateUser(){
                this.$Progress.start();
                this.form.put('api/user/'+this.form.id)
                .then(() => {
                    swal.fire(
                        'Modifié!',
                        'Utilisateur Modifier.',
                        'success'
                    );
                    $('#addNew').modal('hide')
                    Fire.$emit('Refresh');
                    this.$Progress.finish();
                })
                .catch(() => {
                    this.$Progress.fail();
                })
            },

            deleteUser(id){
                swal.fire({
                    title: 'Êtes-vous sûr?',
                    text: "Vous ne pourrez pas revenir en arrière!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Oui, Supprimer!'
                })
                    .then((result) => {
                        // send request to the serve
                        if (result.value) {
                            this.form.delete('api/user/'+id)
                            .then(() => {
                                swal.fire(
                                    'Supprimé!',
                                    'Utilisateur supprimé.',
                                    'success'
                                );
                                Fire.$emit('Refresh');
                            })
                            .catch(() => {
                                swal.fire(
                                    'Failed!',
                                    'There was somehing wrong.',
                                    'warning'
                                );
                            }) 
                        } 
                    })
            },
        },

        created() {
            this.loadUsers();
            Fire.$on('Refresh', () => {
                this.loadUsers();
            });
            // refreche Page evry 3s
            //setInterval(() => this.loadUsers(), 3000);

            //search
            Fire.$on('searching', () => {
                let query = this.$parent.search;  
                axios.get('api/findUser?q='+query)
                .then((data) => {
                    this.users = data.data               
                })
                .catch(() => {
                    swal.fire(
                        'Failed!',
                        'There was somehing wrong.',
                        'warning'
                    );
                })
            });
        }
    }
</script>
