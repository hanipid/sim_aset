<div class="page-header">
    <h1>
        Create categories
    </h1>
</div>

{{ content() }}

<form method="post" autocomplete="off" class="form-horizontal">

<div class="form-group">
    <label for="fieldName" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
        {{ form.render("name") }}
    </div>
</div>


<div class="form-group">
    <label for="fieldParent" class="col-sm-2 control-label">Parent</label>
    <div class="col-sm-10">
        {{ form.render("parent") }}
    </div>
</div>

    {{ form.render("type") }}

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Save', 'class': 'btn btn-primary') }}
    </div>
</div>

</form>
