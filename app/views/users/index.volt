{{ content() }}

<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div align="right">
            {{ link_to("users/create", "<i class='icon-plus-sign'></i> Create Users", "class": "btn btn-primary") }}
        </div>

        <form class="form" method="post" action="{{ url("users/search") }}" autocomplete="off">

            <div class="center">

                <h2>Search users</h2>

                <div class="clearfix">
                    <label for="id">Id</label>
                    {{ form.render("id") }}
                </div>

                <div class="clearfix">
                    <label for="name">Name</label>
                    {{ form.render("name") }}
                </div>

                <div class="clearfix">
                    <label for="email">E-Mail</label>
                    {{ form.render("email") }}
                </div>

                <div class="clearfix">
                    <label for="profilesId">Profile</label>
                    {{ form.render("profilesId") }}
                </div>

                <div class="clearfix">
                    {{ submit_button("Search", "class": "btn btn-primary") }}
                </div>

            </div>

        </form>
    </div>
</div>