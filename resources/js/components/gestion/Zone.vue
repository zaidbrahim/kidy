<template>
    <div class="container">
        <div class="row" v-if="$gate.isAdminOrUser()">
            <div class="col-12">
              <div class="card border-dark">
                <div class="card-header text-white bg-dark">
                  <h3 cl ass="card-title">Zones</h3>
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
                                <th>Zone</th>
                                <th>Ville</th>
                                <th>Date d'ajout</th>
                                <th></th>
                            </tr>
                            <tr v-for="zone in zones.data" :key="zone.id">
                                <td>{{ zone.id }}</td>
                                <td>{{ zone.zone | upText }}</td>
                                <td>{{ zone.ville.ville }}</td>
                                <td>{{ zone.created_at | myDate }}</td>
                                <td class="text-right">
                                    <a href="#" @click="editModel(zone)">
                                        <i class="fas fa-edit"></i>
                                    </a>

                                    <a href="#" @click="deleteZone(zone.id)">
                                        <i class="fa fa-trash red"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
                
                <div class="card-footer">
                    <pagination :data="zones" @pagination-change-page="getResults"></pagination>
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
                        <h5 v-show="!editmode" class="modal-title" id="addNewLabel">Ajouter une zone</h5>
                        <h5 v-show="editmode" class="modal-title" id="addNewLabel">Modifier une zone</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode ? updateZone() : createZone()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.zone" placeholder="Zone" type="text" name="zone" class="form-control" :class="{ 'is-invalid': form.errors.has('zone') }">
                                <has-error :form="form" field="zone"></has-error>
                            </div>

                            <div class="form-group">
                                <select v-model="form.ville_id" name="ville_id" id="ville_id" class="form-control">
                                    <option value="" selected>Ville</option>
                                    <option v-for="ville in villes.data" v-bind:value="ville.id">{{ ville.ville }}</option>
                                </select>
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
                zones : {},
                villes: {},
                

                form: new Form({ 
                    id: '',
                    zone: '',
                    ville_id: '',
                }), 
                
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

            loadZones(){
                if(this.$gate.isAdminOrUser()){
                    axios.get("api/zone").then(({ data }) => (this.zones = data));
                }
            },
            

            loadVilles(){
                if(this.$gate.isAdminOrUser()){
                    axios.get("api/ville").then(({ data }) => (this.villes = data));
                }
            },

            getResults(page = 1) {
                axios.get('api/zone?page=' + page)
                    .then(response => {
                        this.zones = response.data;
                    });
            },

            createZone(){
                this.$Progress.start();
                this.form.post('api/zone')
                .then(() => {
                    Fire.$emit('Refresh');
                    $('#addNew').modal('hide')
                    toast.fire({
                        type: 'success',
                        title: 'Zone ajoutée avec success'
                    })
                    this.$Progress.finish();
                })
                .catch(() => {

                });
            },

            updateZone(){
                this.$Progress.start();
                this.form.put('api/zone/'+this.form.id)
                .then(() => {
                    swal.fire(
                        'Modifié!',
                        'Zone Modifiée.',
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

            deleteZone(id){
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
                            this.form.delete('api/zone/'+id)
                            .then(() => {
                                swal.fire(
                                    'Supprimé!',
                                    'Zone supprimée.',
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
            this.loadZones();
            this.loadVilles();
            Fire.$on('Refresh', () => {
                this.loadZones();
                this.loadVilles();
            });
            //search
            Fire.$on('searching', () => {
                let query = this.$parent.search;  
                axios.get('api/findZone?q='+query)
                .then((data) => {
                    this.zones = data.data               
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