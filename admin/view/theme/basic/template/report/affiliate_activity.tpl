<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
                <div class="pull-right">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_show_filter; ?>" class="btn btn-primary btn-sm" id="showFilter"><i class="fa fa-eye"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_hide_filter; ?>" class="btn btn-primary btn-sm" id="hideFilter"><i class="fa fa-eye-slash"></i></button>
                </div>
            </div>
            <div class="panel-body">
                <div class="well" style="display:none;">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="caret"></span>
                                    </button>
                                    <button type="button" onclick="filter();" class="btn btn-default"><div class="filter-type"><?php echo $entry_affiliate; ?></div></button>
                                    <ul class="dropdown-menu">
                                        <li><a class="filter-list-type" onclick="changeFilterType('<?php echo $entry_affiliate; ?>', 'filter_affiliate');"><?php echo $entry_affiliate; ?></a></li>
                                        <li><a class="filter-list-type" onclick="changeFilterType('<?php echo $entry_ip; ?>', 'filter_ip');"><?php echo $entry_ip; ?></a></li>
                                        <li><a class="filter-list-type" onclick="changeFilterType('<?php echo $entry_date_start; ?>', 'filter_date_start');"><?php echo $entry_date_start; ?></a></li>
                                        <li><a class="filter-list-type" onclick="changeFilterType('<?php echo $entry_date_end; ?>', 'filter_date_end');"><?php echo $entry_date_end; ?></a></li>
                                    </ul>
                                </div>
                                <input type="text" name="filter_affiliate" value="<?php echo $filter_affiliate; ?>" placeholder="<?php echo $entry_affiliate; ?>" id="input-affiliate" class="form-control filter" />
                                <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" placeholder="<?php echo $entry_ip; ?>"  id="input-ip" class="form-control filter hidden" />
                                <div class="input-group date filter hidden filter hidden filter_date_start">
                                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control filter hidden" />
                                  <span class="input-group-btn">
                                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                  </span></div>
                                <div class="input-group date filter hidden filter_date_end">
                                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control filter hidden" />
                                  <span class="input-group-btn">
                                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                  </span></div>
                            </div>
                        </div>
                    </div>
                    <?php if (!empty($filter_affiliate) || !empty($filter_ip) || !empty($filter_date_start) || !empty($filter_date_end)) { ?>
                    <div class="row">
                        <div class="col-lg-12 filter-tag">
                            <?php if ($filter_affiliate) { ?>
                            <div class="filter-info pull-left">
                                <label class="control-label"><?php echo $entry_affiliate; ?>:</label> <label class="filter-label"> <?php echo $filter_affiliate; ?></label>
                                <a class="filter-remove" onclick="removeFilter(this, 'filter_affiliate');"><i class="fa fa-times"></i></a>
                            </div>
                            <?php } ?>
                            <?php if ($filter_ip) { ?>
                            <div class="filter-info pull-left">
                                <label class="control-label"><?php echo $entry_ip; ?>:</label> <label class="filter-label"> <?php echo $filter_ip; ?></label>
                                <a class="filter-remove" onclick="removeFilter(this, 'filter_ip');"><i class="fa fa-times"></i></a>
                            </div>
                            <?php } ?>
                            <?php if ($filter_date_start) { ?>
                            <div class="filter-info pull-left">
                                <label class="control-label"><?php echo $entry_date_start; ?>:</label> <label class="filter-label"> <?php echo $filter_date_start; ?></label>
                                <a class="filter-remove" onclick="removeFilter(this, 'filter_date_start');"><i class="fa fa-times"></i></a>
                            </div>
                            <?php } ?>
                            <?php if ($filter_date_end) { ?>
                            <div class="filter-info pull-left">
                                <label class="control-label"><?php echo $entry_date_end; ?>:</label> <label class="filter-label"> <?php echo $filter_date_end; ?></label>
                                <a class="filter-remove" onclick="removeFilter(this, 'filter_date_end');"><i class="fa fa-times"></i></a>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <td class="text-left"><?php echo $column_comment; ?></td>
                            <td class="text-left"><?php echo $column_ip; ?></td>
                            <td class="text-left"><?php echo $column_date_added; ?></td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if ($activities) { ?>
                        <?php foreach ($activities as $activity) { ?>
                        <tr>
                            <td class="text-left"><?php echo $activity['comment']; ?></td>
                            <td class="text-left"><?php echo $activity['ip']; ?></td>
                            <td class="text-left"><?php echo $activity['date_added']; ?></td>
                        </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr>
                            <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                        </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript"><!--
    function filter() {
        url = 'index.php?route=report/affiliate_activity&token=<?php echo $token; ?>';

        var filter_affiliate = $('input[name=\'filter_affiliate\']').val();

        if (filter_affiliate) {
            url += '&filter_affiliate=' + encodeURIComponent(filter_affiliate);
        }
        var filter_ip = $('input[name=\'filter_ip\']').val();

        if (filter_ip) {
            url += '&filter_ip=' + encodeURIComponent(filter_ip);
        }

        var filter_date_start = $('input[name=\'filter_date_start\']').val();

        if (filter_date_start) {
            url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
        }

        var filter_date_end = $('input[name=\'filter_date_end\']').val();

        if (filter_date_end) {
            url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
        }

        location = url;
    }
    //--></script>
    <script type="text/javascript"><!--
    $('input[name=\'filter_affiliate\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=marketing/affiliate/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['affiliate_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'filter_affiliate\']').val(item['label']);
        }
    });
    //--></script>
    <script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script></div>
<?php echo $footer; ?>
