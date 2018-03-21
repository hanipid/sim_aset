{{ content() }}

<div class="container-fluid">
  <form action="{{ url('posts/create') }}" method="post" id="contentForm" class="form-horizontal" autocomplete="off">
    
    {% set id = post.getLast().id + 1 %}
    {{ hidden_field("id", "value" : id) }}
    {{ hidden_field("post_author", "value" : auth.getIdentity()['id'], "type" : "numeric", "class" : "form-control", "id" : "fieldPostAuthor") }}
    {{ hidden_field("updated_at", "size" : 30, "class" : "form-control tanggal", "id" : "fieldUpdatedAt", "value" : date( 'Y-m-d H:i:s',time())) }}
    {{ hidden_field("post_type", "size" : 30, "class" : "form-control", "id" : "fieldPostType", "value" : "post") }}

    <div class="row">
      <div class="col-md-8">

        <div class="form-group">
          {{ text_field("post_title", "cols": "30", "rows": "4", "class" : "form-control post_title", "id" : "fieldPostTitle", "placeholder" : "Post Title") }}
        </div>

        <div class="form-group">
          {{ text_area("post_content", 'id' : "summernote", "class" : "form-control") }}
        </div>

        <div id="modal-image" class="modal">
          <?php
          $site_url = 'http://' . $_SERVER['SERVER_NAME'] . $this->config->application->baseUri . 'uploads/posts/'; //edit path
          $directory = "uploads/posts/"; //edit path
          $images = glob($directory.'*.{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF}', GLOB_BRACE);
          ?>

          <div class="modal-dialog modal-lg"   style="overflow:initial">
            <div class="modal-content">
              <div class="btn-info modal-header">
              <h4 class="modal-title"><i class="fa fa-image"></i>&nbsp;&nbsp;Image manager
              <button type="button" data-toggle="tooltip" title="" id="button-upload" class="btn btn-primary pull-right"><i class="fa fa-upload"></i>&nbsp;&nbsp;UPLOAD IMAGE</button>
              </h4>
              </div>
              <div class="modal-body"  style="height:400px;overflow-y:auto">
                <?php
                  $i=0;
                  foreach ($images as $image) {
                    $image = basename($image);
                    $image = $site_url.$image
                ?>
                <div id="image_<?php echo $i ?>" style="margin:5px;float:left;width:155px;height:145px;">
                  <div class="thumb" data-image="<?php echo $image; ?>"><span><img class="pop" style="" src="<?php echo $image; ?>" /></span></div>
                  <div style="margin:-10px 0 10px 0" class="pull-right">
                    <a data-toggle="tooltip" class="delete-image" data-image_id="<?php echo $i ?>" data-image="<?php echo basename($image) ?>" href="javascript:;" title="Delete image"><i class="fa fa-trash-o fa-lg"></i></a>&nbsp;&nbsp;
                    <a data-toggle="tooltip" class="insert-image" data-image="<?php echo $image ?>" title="insert image" href="javascript:;"><i class="fa fa-sign-in fa-lg"></i></a>
                  </div>
                </div>
                <?php
                    $i++;
                  } 
                ?>
              </div>
              <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button></div>
            </div>
          </div>
          <!-- show image popup -->
          <div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-body">
                  <img src="" id="imagepreview" style="width:100%;" >
                </div>
                <p style="text-align:right;padding-right:20px">
                  <button type="button" class="btn btn-default close-modal">Close</button>
                </p>
              </div>
            </div>
          </div>

          <!-- delete image popup -->
          <div class="modal fade" id="imagemodaldelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
            <div class="btn-warning modal-header">
              <h4 class="modal-title"><i class="fa fa-trash-o"></i>&nbsp;&nbsp;Delete Image</h4>
              </div>
                <div class="modal-body">
                  Are you sure you want to delete the image?
                </div>
                <p style="text-align:right;padding-right:20px">
                  <button type="button" id="delete_image" class="btn btn-primary close-modal">Yes</button>&nbsp;<button type="button" class="btn btn-default close-modal">No</button>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- .col-md-8 -->

      <div class="col-md-4">
        <div class="list-group">

          <div href="#" class="list-group-item">
            <h4 class="list-group-item-heading">Category</h4>
            <p class="list-group-item-text">
              <select class="form-control" name="post_category">
              {% for c in categories %}
                <option value="{{ c.id }}">{{ c.name }}</option>
              {% endfor %}
              </select>
            </p>
          </div>

          <div href="#" class="list-group-item">
            <h4 class="list-group-item-heading">Date</h4>
            <p class="list-group-item-text">
              {{ text_field("published_at", "size" : 30, "class" : "form-control datetime", "id" : "fieldPublishedAt" }}
            </p>
          </div>

          <div href="#" class="list-group-item">
            <h4 class="list-group-item-heading">Comment</h4>
            <div class="row list-group-item-text">
              <div class="col-sm-6">
                {{ radio_field("comment_status", "value" : "open", "id" : "commentOpen", "checked" : "checked") }}
                <label for="commentOpen">Open</label>
              </div>
              <div class="col-sm-6">
                {{ radio_field("comment_status", "value" : "close", "id" : "commentClose") }}
                <label for="commentClose">Close</label>
              </div>
            </div>
          </div>

          <div href="#" class="list-group-item">
            <h4 class="list-group-item-heading">Custom Url</h4>
            <p class="list-group-item-text">
              {{ text_field("post_url", "cols": "30", "rows": "4", "class" : "form-control", "id" : "fieldPostTitle", "placeholder" : "Post Url") }}
            </p>
          </div>

          <div class="list-group-item">
            <h4 class="list-group-item-heading">Sidebar Setting</h4>
            <p class="list-group-item-text">
              {{ select_static("column_set", ["1" : "No Sidebar", "2" : "With Sidebar"], "class": "form-control") }}
            </p>
          </div>

          <div href="#" class="list-group-item">
            <h4 class="list-group-item-heading">Publication</h4>
            <div class="row list-group-item-text">
              <div class="col-sm-6">
                {{ radio_field("post_status", "value" : "draft", "id" : "commentOpen", "checked" : "checked") }}
                <label for="commentOpen">Draft</label>
              </div>
              <div class="col-sm-6">
                {{ radio_field("post_status", "value" : "publish", "id" : "commentClose") }}
                <label for="commentClose">Publish</label>
              </div>
            </div>
          </div>

        </div> <!-- .list-group -->

        <div class="form-group">
          <div class="col-sm-12">
            {{ submit_button('Publish', 'class': 'btn btn-primary btn-block') }}
          </div>
        </div>
      </div> <!-- .col-md-4 -->
    </div> <!-- .row -->

  </form>
</div>