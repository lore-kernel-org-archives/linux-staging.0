Received: from smtp67.iad3b.emailsrvr.com (smtp67.iad3b.emailsrvr.com [146.20.161.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D684F6D12
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617804128;
	bh=GbQ3uf46nP5RFxkxBOwVEYPP9QbEZFISVYJB1W0TlG8=;
	h=From:To:Subject:Date:From;
	b=MFrS92Az46RFJqkJ0iNwPxVhncjNbrlVPiqEtjuMqC8uAsx0knC9RY+a8rNV4/xNI
	 YMTtTSFpPjAloKsT8kPr8GW6POqlc9aLzdwPee8bLFhvigcp9hPS9RYYXpMTjyFW4m
	 rfUSFB+Xni6vDcAkGKhmFnDMXY2QE1QxnV/y81ic=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp1.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 90EF3601B1;
	Wed,  7 Apr 2021 10:02:07 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 3/5] staging: comedi: tests: ni_routes_test: Avoid CamelCase: <RVi>
Date: Wed,  7 Apr 2021 15:01:40 +0100
Message-Id: <20210407140142.447250-4-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407140142.447250-1-abbotti@mev.co.uk>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 6de28929-b89a-445d-9861-df15a58200d7-4-1

Rename the `RVi` macro to `RVI` to avoid this checkpatch.pl issue:

CHECK: #27: FILE: drivers/staging/comedi/drivers/tests/ni_routes_test.c:27:
+#define RVi(table, src, dest)	((table)[(dest) * NI_NUM_NAMES + (src)])

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
Note: checkpatch.pl shows an unrelated CamelCase issue for this patch.
---
 .../comedi/drivers/tests/ni_routes_test.c      | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
index 696e610f1822..7dfc70a4cc6f 100644
--- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
+++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
@@ -24,7 +24,7 @@
 #include "../ni_routes.h"
 #include "unittest.h"
 
-#define RVi(table, src, dest)	((table)[(dest) * NI_NUM_NAMES + (src)])
+#define RVI(table, src, dest)	((table)[(dest) * NI_NUM_NAMES + (src)])
 #define O(x)	((x) + NI_NAMES_BASE)
 #define B(x)	((x) - NI_NAMES_BASE)
 #define V(x)	((x) | 0x80)
@@ -244,10 +244,10 @@ void test_ni_assign_device_routes(void)
 		 "all pci-6070e route_set->src's in order of signal source\n");
 
 	unittest(
-	  RVi(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(17) &&
-	  RVi(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == 0 &&
-	  RVi(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == 0 &&
-	  RVi(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) ==
+	  RVI(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(17) &&
+	  RVI(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == 0 &&
+	  RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == 0 &&
+	  RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) ==
 		V(NI_PFI_OUTPUT_AI_CONVERT),
 	  "pci-6070e finds e-series route_values table\n");
 
@@ -264,10 +264,10 @@ void test_ni_assign_device_routes(void)
 	unittest(oldtable != table, "pci-6220 find other route_values table\n");
 
 	unittest(
-	  RVi(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(20) &&
-	  RVi(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == V(12) &&
-	  RVi(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == V(3) &&
-	  RVi(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) == V(3),
+	  RVI(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(20) &&
+	  RVI(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == V(12) &&
+	  RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == V(3) &&
+	  RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) == V(3),
 	  "pci-6220 finds m-series route_values table\n");
 }
 
-- 
2.31.0

