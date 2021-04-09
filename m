Received: from smtp84.ord1c.emailsrvr.com (smtp84.ord1c.emailsrvr.com [108.166.43.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C2E6D13
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617966587;
	bh=g6u4EWmEPk83kelZ+HfS4TH/RnN9ds4VgfarZIg+1KA=;
	h=From:To:Subject:Date:From;
	b=UUn+Z5IGCepHivcCufFPebZ0E99yB9MYxC6B2eJpPAkqh8HbREnmjJh59GyZMu1Up
	 TRbRmSnD5YPkC3j52pG2unbNw951sqG8VWZCTRfPT7xehi8xmmlQ4JcMAb36HMf0gQ
	 Iho3bXQDSqZjqFk9jLFpwZWBbKgEQpZP4xUGre64=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp3.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 47EE3A00DE;
	Fri,  9 Apr 2021 07:09:46 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] staging: comedi: Kconfig: Fix COMEDI_TESTS_NI_ROUTES selections
Date: Fri,  9 Apr 2021 12:08:44 +0100
Message-Id: <20210409110844.148378-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: b75fc9f1-3861-4332-99c9-21887245fa71-1-1

The COMEDI_TESTS_NI_ROUTES option currently selects NI_ROUTING, which
doesn't exist.  It should be selecting COMEDI_NI_ROUTING.  Fix it.

Selecting COMEDI_TESTS_NI_ROUTES without COMEDI_NI_ROUTING resulted in
the following build errors:

ERROR: modpost: "ni_lookup_route_register"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!
ERROR: modpost: "ni_is_cmd_dest"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!
ERROR: modpost: "ni_find_route_source"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!
ERROR: modpost: "ni_get_valid_routes"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!
ERROR: modpost: "ni_count_valid_routes"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!
ERROR: modpost: "ni_sort_device_routes"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!
ERROR: modpost: "ni_assign_device_routes"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!
ERROR: modpost: "ni_find_route_set"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!
ERROR: modpost: "ni_route_set_has_source"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!
ERROR: modpost: "ni_route_to_register"
[drivers/staging/comedi/drivers/tests/ni_routes_test.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Fixes: c82b130616e3 ("staging: comedi: Add Kconfig options to build unit test modules")
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/staging/comedi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/Kconfig b/drivers/staging/comedi/Kconfig
index 1fbc517f4276..3cb61fa2c5c3 100644
--- a/drivers/staging/comedi/Kconfig
+++ b/drivers/staging/comedi/Kconfig
@@ -1342,7 +1342,7 @@ config COMEDI_TESTS_EXAMPLE
 
 config COMEDI_TESTS_NI_ROUTES
 	tristate "NI routing unit-test module"
-	select NI_ROUTING
+	select COMEDI_NI_ROUTING
 	help
 	  Enable support for a unit-test module to test the signal routing
 	  code used by comedi drivers for various National Instruments cards.
-- 
2.31.0

