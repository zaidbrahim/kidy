<template>
    <div class="container">
        <div class="row" v-if="$gate.isAdminOrUser()">
            <div class="col-12">
              <div class="card border-dark">
                <div class="card-header text-white bg-dark">
                  <h3 cl ass="card-title">Villes</h3>
                  <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <button class="btn btn-success" @click="newModel">Ajouter </button>
                    </div>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <th>ID</th>
                                <th>Ville</th>
                                <th>Date d'ajout</th>
                                <th></th>
                            </tr>
                            <tr v-for="ville in villes.data" :key="ville.id">
                                <td>{{ ville.id }}</td>
                                <td>{{ ville.ville | upText }}</td>
                                <td>{{ ville.created_at | myDate }}</td>
                                <td class="text-right">
                                    <a href="#" @click="editModel(ville)">
                                        <i class="fas fa-edit"></i>
                                    </a>

                                    <a href="#" @click="deleteVille(ville.id)">
                                        <i class="fa fa-trash red"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
                
                <div class="card-footer">
                    <pagination :data="villes" @pagination-change-page="getResults"></pagination>
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
                        <h5 v-show="!editmode" class="modal-title" id="addNewLabel">Ajouter une ville</h5>
                        <h5 v-show="editmode" class="modal-title" id="addNewLabel">Modifier une ville</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode ? updateVille() : createVille()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.ville" placeholder="Ville" type="text" name="ville" class="form-control" :class="{ 'is-invalid': form.errors.has('ville') }">
                                <has-error :form="form" field="ville"></has-error>
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
                villes : {},
                form: new Form({ 
                    id: '',
                    ville : '',
                })
            }
        },

        methods: {
            newModel(){
                this.editmode = false;
                this.form.reset();
                $('#addNew').modal('show');
            },

            editModel(ville){
                this.editmode = true;
                this.form.reset();
                $('#addNew').modal('show');
                this.form.fill(ville);
            },

            loadVilles(){
                if(this.$gate.isAdminOrUser()){
                    axios.get("api/ville").then(({ data }) => (this.villes = data));
                }
            },

            getResults(page = 1) {
                axios.get('api/ville?page=' + page)
                    .then(response => {
                        this.villes = response.data;
                    });
            },

            createVille(){
                this.$Progress.start();
                this.form.post('api/ville')
                .then(() => {
                    Fire.$emit('Refresh');
                    $('#addNew').modal('hide')
                    toast.fire({
                        type: 'success',
                        title: 'Ville ajouter avec success'
                    })
                    this.$Progress.finish();
                })
                .catch(() => {

                });
            },

            updateVille(){
                this.$Progress.start();
                this.form.put('api/ville/'+this.form.id)
                .then(() => {
                    swal.fire(
                        'Modifié!',
                        'Ville Modifier.',
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

            deleteVille(id){
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
                            this.form.delete('api/ville/'+id)
                            .then(() => {
                                swal.fire(
                                    'Supprimé!',
                                    'Ville supprimé.',
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
            this.loadVilles();
            Fire.$on('Refresh', () => {
                this.loadVilles();
            });

            //search
            Fire.$on('searching', () => {
                let query = this.$parent.search;  
                axios.get('api/findVille?q='+query)
                .then((data) => {
                    this.villes = data.data               
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
