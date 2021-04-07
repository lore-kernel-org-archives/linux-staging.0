Received: from smtp64.iad3b.emailsrvr.com (smtp64.iad3b.emailsrvr.com [146.20.161.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A1C29CA
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617804126;
	bh=/dOliPq3xHroKzhefNMwai8d7F3Pi2l+5VMoRaxHEeg=;
	h=From:To:Subject:Date:From;
	b=RoS7w2zKTeA3iH8Ole3XjlqpJFZBaT1vi9Ei5EijEvosAMLjkgaXBLSPXjkpxY3kv
	 dmN0Cc7nXx8mDn4bFQRBX4Li6mVQrCC67/2/Vv58m8eylPNs+8tXN8ID2U5qoHKrZb
	 LBKLw/v/sByO2n9FfnAjGoPGMwI7f0aPsNZgXf+A=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp1.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 67AE2601AA;
	Wed,  7 Apr 2021 10:02:05 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 1/5] staging: comedi: tests: ni_routes_test: Fix compilation error
Date: Wed,  7 Apr 2021 15:01:38 +0100
Message-Id: <20210407140142.447250-2-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407140142.447250-1-abbotti@mev.co.uk>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 6de28929-b89a-445d-9861-df15a58200d7-2-1

The `ni_routes_test` module is not currently selectable using the
Kconfig files, but can be built by specifying `CONFIG_COMEDI_TESTS=m` on
the "make" command line.  It currently fails to compile due to an extra
parameter added to the `ni_assign_device_routes` function by
commit e3b7ce73c578 ("staging: comedi: ni_routes: Allow alternate board
name for routes").  Fix it by supplying the value `NULL` for the added
`alt_board_name` parameter (which specifies that there is no alternate
board name).

Fixes: e3b7ce73c578 ("staging: comedi: ni_routes: Allow alternate board name for routes")
Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/staging/comedi/drivers/tests/ni_routes_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
index 4061b3b5f8e9..68defeb53de4 100644
--- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
+++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
@@ -217,7 +217,8 @@ void test_ni_assign_device_routes(void)
 	const u8 *table, *oldtable;
 
 	init_pci_6070e();
-	ni_assign_device_routes(ni_eseries, pci_6070e, &private.routing_tables);
+	ni_assign_device_routes(ni_eseries, pci_6070e, NULL,
+				&private.routing_tables);
 	devroutes = private.routing_tables.valid_routes;
 	table = private.routing_tables.route_values;
 
@@ -253,7 +254,8 @@ void test_ni_assign_device_routes(void)
 	olddevroutes = devroutes;
 	oldtable = table;
 	init_pci_6220();
-	ni_assign_device_routes(ni_mseries, pci_6220, &private.routing_tables);
+	ni_assign_device_routes(ni_mseries, pci_6220, NULL,
+				&private.routing_tables);
 	devroutes = private.routing_tables.valid_routes;
 	table = private.routing_tables.route_values;
 
-- 
2.31.0

