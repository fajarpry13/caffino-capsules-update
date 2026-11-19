<div class="modal fade" id="modalEditFaktaNutrisi" tabindex="-1" aria-labelledby="modalFaktaNutrisi" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title" id="modalFaktaNutrisi">Fakta Nutrisi</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        </div>
        <div class="modal-body">
            <form action="" id="faktanutrisi_form" method="post">
                @method('put')
                @csrf
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <input type="text" class="form-control" name="product_id" id="product_id" hidden>
                            <input type="text" class="form-control" name="name" id="fakta_name" value="">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <input type="text" class="form-control" name="value" id="fakta_value" value="">
                        </div>
                    </div>
                </div>
                <div class="float-right">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
    </div>
</div>