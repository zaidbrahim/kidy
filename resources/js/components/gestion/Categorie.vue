<template>
    <div class="container">
        <div class="row" v-if="$gate.isAdminOrUser()">
            <div class="col-12">
              <div class="card border-dark">
                <div class="card-header text-white bg-dark">
                  <h3 cl ass="card-title">Catégories</h3>
                  <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <button class="btn btn-success" @click="newModel">Ajouter</button>
                    </div>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <th>ID</th>
                                <th>Catégorie</th>
                                <th>Date d'ajout</th>
                                <th></th>
                            </tr>
                            <tr v-for="categorie in categories.data" :key="categorie.id">
                                <td>{{ categorie.id }}</td>
                                <td>{{ categorie.categorie | upText }}</td>
                                <td>{{ categorie.created_at | myDate }}</td>
                                <td class="text-right">
                                    <a href="#" @click="editModel(categorie)">
                                        <i class="fas fa-edit"></i>
                                    </a>

                                    <a href="#" @click="deleteCategorie(categorie.id)">
                                        <i class="fa fa-trash red"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
                
                <div class="card-footer">
                    <pagination :data="categories" @pagination-change-page="getResults"></pagination>
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
                        <h5 v-show="!editmode" class="modal-title" id="addNewLabel">Ajouter une nouvelle catégorie</h5>
                        <h5 v-show="editmode" class="modal-title" id="addNewLabel">Modifier une catégorie</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode ? updateCategorie() : createCategorie()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.categorie" placeholder="Catégorie" type="text" name="categorie" class="form-control" :class="{ 'is-invalid': form.errors.has('categorie') }">
                                <has-error :form="form" field="categorie"></has-error>
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
                categories : {},
                form: new Form({ 
                    id: '',
                    categorie : ''
                })
            }
        },

        methods: {
            newModel(){
                this.editmode = false;
                this.form.reset();
                $('#addNew').modal('show');
            },

            editModel(categorie){
                this.editmode = true;
                this.form.reset();
                $('#addNew').modal('show');
                this.form.fill(categorie);
            },

            loadCategories(){
                if(this.$gate.isAdminOrUser()){
                    axios.get("api/categorie").then(({ data }) => (this.categories = data));
                }
            },

            getResults(page = 1) {
                axios.get('api/categorie?page=' + page)
                    .then(response => {
                        this.categories = response.data;
                    });
            },

            createCategorie(){
                this.$Progress.start();
                this.form.post('api/categorie')
                .then(() => {
                    Fire.$emit('Refresh');
                    $('#addNew').modal('hide')
                    toast.fire({
                        type: 'success',
                        title: 'Catégorie ajouter avec success'
                    })
                    this.$Progress.finish();
                })
                .catch(() => {

                });
            },

            updateCategorie(){
                this.$Progress.start();
                this.form.put('api/categorie/'+this.form.id)
                .then(() => {
                    swal.fire(
                        'Modifié!',
                        'Catégorie Modifier.',
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

            deleteCategorie(id){
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
                            this.form.delete('api/categorie/'+id)
                            .then(() => {
                                swal.fire(
                                    'Supprimé!',
                                    'Catégorie supprimé.',
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
            this.loadCategories();
            Fire.$on('Refresh', () => {
                this.loadCategories();
            });

            //search
            Fire.$on('searching', () => {
                let query = this.$parent.search;  
                axios.get('api/findCategorie?q='+query)
                .then((data) => {
                    this.categories = data.data               
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
