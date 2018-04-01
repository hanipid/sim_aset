<?php

use Phalcon\Config;
use Phalcon\Logger;

return new Config([
    'privateResources' => [
        'users' => [
            'index',
            'search',
            'edit',
            'create',
            'delete',
            'changePassword'
        ],
        'profiles' => [
            'index',
            'search',
            'edit',
            'create',
            'delete'
        ],
        'permissions' => [
            'index'
        ],
        'basic_settings' => [
            'index',
            'deleteLogo'
        ],
        'categories' => [
            'index',
            'search',
            'new',
            'edit',
            'create',
            'delete'
        ],
        'posts' => [
            'index',
            'search',
            'edit',
            'create',
            'delete'
        ],
        'master_pegawai' => [
            'index',
            'edit',
            'create',
            'delete'
        ]
    ]
]);
