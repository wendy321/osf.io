<div class="modal fade" id="duplicateModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4">
                        <h4>Links
                            % if node['points'] > 0:
                                <a class="btn btn-primary pull-right"
                                   href="#showLinks"
                                   data-toggle="modal"
                                   data-dismiss="modal"
                                >
                                    ${ node['points'] }
                                </a>
                            % else:
                                 <span class="well well-inline pull-right">
                                    ${ node['points'] }
                                </span>
                            % endif
                        </h4>
                        ${ language.LINK_DESCRIPTION }
                    </div>
                    <div class="col-md-4">
                        <h4>Templated From
                            <span class="well well-inline pull-right">
                                ${ node['templated_count'] }
                            </span>
                        </h4>
                        ${ language.TEMPLATE_DESCRIPTION }
                    </div>
                    <div class="col-md-4">
                        <h4>Forks
                            <a class="btn btn-primary pull-right"
                               href="${ node['url'] }forks/"
                            >
                                ${ node['fork_count'] }
                            </a>
                        </h4>
                        % if not disk_saving_mode:
                            ${ language.FORK_DESCRIPTION }
                        % else:
                            ${ language.DISK_SAVING_MODE}
                        % endif
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
##                        <a class="btn btn-primary form-control disabled">${ language.LINK_ACTION }</a>
                    </div>
                    <div class="col-md-4">
                        <a class="btn btn-primary form-control${'' if user_name and (user['is_contributor'] or node['is_public']) else ' disabled'}"
                           data-dismiss="modal"
                           onclick="NodeActions.useAsTemplate();"
                        >
                            ${ language.TEMPLATE_ACTION }
                        </a>
                    </div>

                    <div class="col-md-4">
                        % if not disk_saving_mode:
                            <a class="btn btn-primary form-control${ '' if user_name and (user['is_contributor'] or node['is_public']) else ' disabled'}"
                               data-dismiss="modal"
                               onclick="NodeActions.forkNode();"
                            >
                                ${ language.FORK_ACTION }
                            </a>
                        % endif
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

