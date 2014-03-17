# -*- coding: utf-8 -*-

from nose.tools import *  # PEP8 asserts
from dropbox.client import DropboxClient

from tests.base import DbTestCase
from tests.factories import UserFactory

from website.addons.base import AddonError
from website.addons.dropbox.model import DropboxUserSettings
from website.addons.dropbox import core

class TestCore(DbTestCase):

    def setUp(self):
        self.user = UserFactory()
        self.user.add_addon('dropbox')
        self.user.save()

        self.settings = self.user.get_addon('dropbox')
        self.settings.access_token = '12345'
        self.settings.save()

    def test_get_addon_returns_dropbox_user_settings(self):
        result = self.user.get_addon('dropbox')
        assert_true(isinstance(result, DropboxUserSettings))

    def test_get_client_returns_a_dropbox_client(self):
        client = core.get_client(self.user)
        assert_true(isinstance(client, DropboxClient))

    def test_get_client_raises_addon_error_if_user_doesnt_have_addon_enabled(self):
        user_no_dropbox = UserFactory()
        with assert_raises(AddonError):
            core.get_client(user_no_dropbox)
