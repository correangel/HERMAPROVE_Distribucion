<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">

      <?php echo $content_top; ?>

      <div class="row">
        <div class="col-sm-12">
          <h3 style="margin-top: 0px"><?php echo $customer_info['lastname']; ?> <?php echo $customer_info['firstname']; ?> 
          <a class="btn link link_edit" href="<?php echo $edit; ?>"><?php echo $text_edit_info; ?></a>
          </h3>
          <span style="font-weight: 500"><?php echo $customer_info['email']; ?> &nbsp;</span>
          <span><span style="color:gray">Tel&eacute;fono:</span> <?php echo $customer_info['telephone']; ?> &nbsp;&nbsp;&nbsp;<span style="color:gray">Fax:</span> <?php echo $customer_info['fax']; ?></span>
        </div>

      </div>
      <br>
      <div class="row">
        <div class="col-sm-12">
          <h4 style="color:gray">Lista de direcciones <a style="margin-bottom: 10px" class="btn link link_new pull-right" href="<?php echo $url_add; ?>"><i class="fa fa-plus-circle" aria-hidden="true"></i> <?php echo $button_new_address ?></a>
          <!--<a class="btn btn_editar" href="<?php echo $address_edit; ?>"><?php echo $text_address; ?></a>-->
          </h4>
          <table class="table" >
                  <tr class="active direcciones_head">
                    <!--<th>Nombre</th>-->
                    <th>Compañia</th>
                    <th>Direcci&oacute;n</th>
                    <th>Localidad</th>
                    <th>Opciones</th>
                  </tr>
                  <?php foreach ($addresses as $address) { ?>
                      <tr>
                        <!--<td><?php echo $address['firstname'] ?> <?php echo $address['lastname'] ?></td>-->
                        <td>
                        <?php if ($address['company']) { ?>
                            <?php echo $address['company'] ?>
                        <?php } else { ?>
                            -
                        <?php } ?>
                        </td>
                         
                        <td>
                        <?php if ($address['address_1']) { ?>
                            <?php echo $address['address_1'] ?>
                        <?php } else { ?>
                            -
                        <?php } ?>
                        </td>

                        <td >
                        <?php if ($address['city']) { ?>
                            <?php echo $address['city'] ?>
                            <?php if ($address['country']) { ?>
                              <br><?php echo $address['country'] ?></td>
                            <?php } ?>
                        <?php } else { ?>
                            -
                        <?php } ?>
                        </td>

                        <td style="text-align: center;">
                        <a class="btn link link_edit" href="<?php echo $url_edit; ?><?php echo $address['address_id'] ?>"><i class="fa fa-pencil" aria-hidden="true" title="Editar direcci&oacute;n"></i></a>
                        <a class="btn link link_delete" href="<?php echo $url_delete; ?><?php echo $address['address_id'] ?>"><i class="fa fa-minus-circle" aria-hidden="true" title="Borrar direcci&oacute;n"></i></a>
                        </td>
                      </tr>
                        
                   <?php } ?> 
          </table>
        </div>
      </div>

     <!-- 
    <li><a class="btn btn-primary" href="<?php echo $password; ?>"><i class="fa fa-pencil" aria-hidden="true"></i> <?php echo $text_password; ?></a></li>

    <li><a class="btn btn-primary" href="<?php echo $wishlist; ?>"><i class="fa fa-pencil" aria-hidden="true"></i> <?php echo $text_wishlist; ?></a></li>

     <h2><?php echo $text_my_newsletter; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      </ul>-->


      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>
    </div>
  </div>
<?php echo $footer; ?> 