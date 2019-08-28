<template>
    <div class="container">
        <div class="row" v-if="$gate.isAdminOrUser()">
            <div class="col-12">
              <div class="card card-danger card-outline">
                <div class="card-header no-border">
                  <h3 cl ass="card-title">Etablissements</h3>
                  <div class="card-tools">
                    <div class="input-group input-group-sm">
                        <button class="btn btn-success" @click="newModel">Ajouter</button>
                    </div>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">
                    <table class="table table-hover">
                        <thead class="bg-success-gradient">
                            <tr>
                                <th>ID</th>
                                <th>Type</th>
                                <th>Etablissement</th>
                                <th>Ville</th>
                                <th>Nom Contact</th>
                                <th>N° Tél</th>
                                <th>N° Whatsapp</th>
                                <th>Date d'ajout</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="etablissement in getdata.etablissements.data" :key="etablissement.id">
                                <td><small>{{ etablissement.id }}</small></td>
                                <td><small>{{ etablissement.categorie.categorie }}</small></td>
                                <td><small>{{ etablissement.etablissement | upText }}</small></td>
                                <td><small>{{ etablissement.ville.ville }}</small></td>
                                <td><small>{{ etablissement.nom_contact }}</small></td>
                                <td><small>{{ etablissement.tel }}</small></td>
                                <td><small>{{ etablissement.whatsapp }}</small></td>
                                <td><small>{{ etablissement.created_at | myDate }}</small></td>
                                <td class="text-right">
                                    <a href="#" @click="editModel(etablissement)">
                                        <i class="fas fa-edit"></i>
                                    </a>

                                    <a href="#" @click="deleteEtablissement(etablissement.id)">
                                        <i class="fa fa-trash red"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
                
                <div class="card-footer">
                    <pagination :data="getdata.etablissements" @pagination-change-page="getResults"></pagination>
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
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary">
                        <h5 v-show="!editmode" class="modal-title" id="addNewLabel">Ajouter un Etablissement</h5>
                        <h5 v-show="editmode" class="modal-title" id="addNewLabel">Modifier un Etablissement</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode ? updateEtablissement() : createEtablissement()">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="type">Type</label>
                                                <select v-model="form.categorie_id" name="type" id="type" class="form-control">
                                                    <option value="" selected="selected" disabled>Type</option>
                                                    <option v-for="categorie in getdata.categories" v-bind:value="categorie.id">{{ categorie.categorie }}</option>
                                                </select>
                                                <has-error :form="form" field="type"></has-error>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="Etablissement">Etablissement</label>
                                                <input v-model="form.etablissement" placeholder="Etablissement" type="text" name="etablissement" class="form-control" :class="{ 'is-invalid': form.errors.has('etablissement') }">
                                                <has-error :form="form" field="etablissement"></has-error>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="ville">Ville</label>
                                                        <select v-model="form.ville_id" name="ville_id" id="ville_id" class="form-control">
                                                            <option value="" selected>Ville</option>
                                                            <option v-for="ville in getdata.villes" v-bind:value="ville.id">{{ ville.ville }}</option>
                                                        </select>
                                                        <has-error :form="form" field="ville"></has-error>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="zone">Zone</label>
                                                        <select v-model="form.zone_id" name="zone_id" id="zone_id" class="form-control">
                                                            <option value="" selected>Zone</option>
                                                            <option v-for="zone in getdata.zones" v-bind:value="zone.id">{{ zone.zone }}</option>
                                                        </select>
                                                        <has-error :form="form" field="zone"></has-error>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="niveau_etude_id">Niveau d'etudes</label>
                                                <select v-model="form.niveau_etude_id" name="niveau_etude_id[]" id="niveau_etude_id" class="form-control" multiple>
                                                    <option value="" selected="selected" disabled>Niveau d'etudes</option>
                                                    <option v-for="niveau_etude in getdata.niveau_etudes" v-bind:value="niveau_etude.id">{{ niveau_etude.niveau }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="nom_contact">Nom du Contact</label>
                                                <input v-model="form.nom_contact" placeholder="Nom du Contact" type="text" name="nom_contact" class="form-control" :class="{ 'is-invalid': form.errors.has('nom_contact') }">
                                                <has-error :form="form" field="nom_contact"></has-error>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <input v-model="form.email" placeholder="exemple@exemple.com" type="text" name="email" class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
                                                <has-error :form="form" field="email"></has-error>
                                            </div>
                                        </div>                                    
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="tel">N° Tél.</label>
                                                        <input v-model="form.tel" placeholder="N° Tél." type="text" name="tel" class="form-control text-small" :class="{ 'form-control is-invalid': form.errors.has('tel') }">
                                                        <has-error :form="form" field="tel"></has-error>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="fax">Fax</label>
                                                        <input v-model="form.fax" placeholder="Fax" type="text" name="fax" class="form-control" :class="{ 'is-invalid': form.errors.has('fax') }">
                                                        <has-error :form="form" field="fax"></has-error>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="whatsapp">N° Whatsapp</label>
                                                        <input v-model="form.whatsapp" placeholder="N° Whatsapp" type="text" name="whatsapp" class="form-control" :class="{ 'is-invalid': form.errors.has('whatsapp') }">
                                                        <has-error :form="form" field="whatsapp"></has-error>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="descriptionOverview">Présentation</label>
                                            <textarea name="description" v-model="form.description" class="form-control" :class="{ 'is-invalid': form.errors.has('description') }">

                                            </textarea>
                                            <has-error :form="form.description" field="description"></has-error>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label for="mensualite">Mensualité</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input v-model="form.mensualite_min" placeholder="Min" type="text" name="mensualite_min" class="form-control" :class="{ 'is-invalid': form.errors.has('mensualite_min') }">
                                                        <has-error :form="form" field="mensualite_min"></has-error>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input v-model="form.mensualite_max" placeholder="Max" type="text" name="mensualite_max" class="form-control" :class="{ 'is-invalid': form.errors.has('mensualite_max') }">
                                                        <has-error :form="form" field="mensualite_max"></has-error>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="site_web">Site web</label>
                                                <input v-model="form.site_web" placeholder="http://" type="text" name="site_web" class="form-control" :class="{ 'is-invalid': form.errors.has('site_web') }">
                                                <has-error :form="form" field="site_web"></has-error>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="adresse">Adresse</label>
                                                <input v-model="form.adresse" placeholder="Adresse" type="text" name="adresse" class="form-control" :class="{ 'is-invalid': form.errors.has('adresse') }">
                                                <has-error :form="form" field="adresse"></has-error>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="maps">Maps</label>
                                                <input v-model="form.maps" placeholder="https://www.google.com/maps" type="text" name="maps" class="form-control" :class="{ 'is-invalid': form.errors.has('maps') }">
                                                <has-error :form="form" field="maps"></has-error>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input v-model="form.latitude" placeholder="Latitude" type="text" name="latitude" class="form-control" :class="{ 'is-invalid': form.errors.has('latitude') }">
                                                        <has-error :form="form" field="latitude"></has-error>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input v-model="form.longitude" placeholder="Longitude" type="text" name="longitude" class="form-control" :class="{ 'is-invalid': form.errors.has('longitude') }">
                                                        <has-error :form="form" field="longitude"></has-error>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="text-center mb-1">
                                                <img class="img-fluid" :src="getPhotoEtablissement()" alt="">
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 mt-4">
                                                    <input type="file" @change="getPhoto" class="form-control-file" id="inputPhoto">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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

                getdata : {
                    etablissements: {}, 
                    villes: {},
                    zones: {},
                    categories: {},
                    niveau_etudes: {},
                },

                form: new Form({ 
                    id: '',
                    categorie_id: '',
                    user_id: '',
                    etablissement: '',
                    descirption: '',
                    etat: 1,
                    nom_contact: '',
                    email: '',
                    adresse: '',
                    zone_id: '',
                    ville_id: '',
                    latitude: '',
                    longitude: '',
                    photo: '',
                    tel: '',
                    fax: '',
                    whatsapp: '',
                    maps: '',
                    site_web: '',
                    mensualite_min: '',
                    mensualite_max: '',
                    niveau_etude_id:[],
                }), 
            }
        },

        methods: {
            newModel(){
                this.editmode = false;
                this.form.reset();
                $('#addNew').modal('show');
            },

            editModel(etablissement){
                this.editmode = true;
                this.form.reset();
                $('#addNew').modal('show');
                this.form.fill(etablissement);
            },

            loadEtablissements(){
                if(this.$gate.isAdminOrUser()){
                    axios.get("api/etablissement").then(({ data }) => (this.getdata = data));
                }
            },

            getResults(page = 1) {
                axios.get('api/etablissement?page=' + page)
                    .then(response => {
                        this.getdata = response.data;
                    });
            },

            getPhotoEtablissement(){
                let photo = (this.form.photo.length > 400) ? this.form.photo : "img/etablissement/"+ this.form.photo ;
                return photo;
            },

            getPhoto(e){
                let file = e.target.files[0];
                let reader = new FileReader();
                if(file['size'] < 2111775){
                    reader.onloadend = (file) => {
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

            createEtablissement(){
                this.$Progress.start();
                this.form.post('api/etablissement')
                .then(() => {
                    Fire.$emit('Refresh');
                    $('#addNew').modal('hide')
                    toast.fire({
                        type: 'success',
                        title: 'Etablissement ajouté avec success'
                    })
                    this.$Progress.finish();
                })
                .catch(() => {

                });
            },

            updateEtablissement(){
                this.$Progress.start();
                this.form.put('api/etablissement/'+this.form.id)
                .then(() => {
                    swal.fire(
                        'Modifié!',
                        'Etablissement Modifié.',
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

            deleteEtablissement(id){
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
                            this.form.delete('api/etablissement/'+id)
                            .then(() => {
                                swal.fire(
                                    'Supprimé!',
                                    'Etablissement supprimé.',
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
            this.loadEtablissements();
            Fire.$on('Refresh', () => {
                this.loadEtablissements();
            });
            //search
            Fire.$on('searching', () => {
                let query = this.$parent.search;  
                axios.get('api/findEtablissement?q='+query)
                .then((data) => {
                    this.getdata = data
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