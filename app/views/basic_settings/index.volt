<div class="page-header">
    <h1>
        Setting Website Data 
    </h1>
</div>

{{ content() }}

{{ form("class" : "form-horizontal", "enctype" : "multipart/form-data") }}


{{ form.render("id") }}

<div class="form-group">
    <label for="fieldSiteName" class="col-sm-2 control-label">Site Name</label>
    <div class="col-sm-10">
        {{ form.render("site_name") }}
        {{ form.messages("site_name") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldMetaTitle" class="col-sm-2 control-label">Meta Title</label>
    <div class="col-sm-10">
        {{ form.render("meta_title") }}
        {{ form.messages("meta_title") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldSiteDescription" class="col-sm-2 control-label">Site Description</label>
    <div class="col-sm-10">
        {{ form.render("meta_description") }}
        {{ form.messages("meta_description") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldAddress" class="col-sm-2 control-label">Address</label>
    <div class="col-sm-10">
        {{ form.render("address") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldPhoneNumber" class="col-sm-2 control-label">Phone Number</label>
    <div class="col-sm-10">
        {{ form.render("phone_number") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldEmail" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
        {{ form.render("email") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldCurrency" class="col-sm-2 control-label">Currency</label>
    <div class="col-sm-10">
        {#
        <select class="form-control currency" name="currency">
        {% for c in currency %}
            <option id="fieldCurrency" value="{{ c.id }}" data-money="{{ c.alphabetic_code }}" {% if c.id == website_data.currency %}selected{% endif %}>{{ c.entity ~ " - " ~ c.alphabetic_code }}</option>
        {% endfor %}
        </select>
        #}
        {{ form.render("currency") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldSsSpeed" class="col-sm-2 control-label">Slideshow Speed</label>
    <div class="col-sm-10">
        {{ form.render("ss_speed") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldLogo" class="col-sm-2 control-label">Logo</label>
    <div class="col-sm-10">
        {% if basicSettings.logo != null %}
        <div class="wrapper">
            <img src="{{ url('uploads/basic_settings/'~basicSettings.logo) }}" alt="">
            <a href="{{ url('basic_settings/deleteLogo') }}" title="Delete Logo" class="text-danger" onclick="return confirm('Are you sure?')"><i class="fa fa-close"></i></a>
        </div>
        {% endif %}
        {{ form.render("logo") }}
    </div>
</div>

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ form.render('Save') }}
    </div>
</div>

</form>
