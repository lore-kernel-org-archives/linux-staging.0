Received: from smtp67.iad3b.emailsrvr.com (smtp67.iad3b.emailsrvr.com [146.20.161.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52C96D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617804129;
	bh=ZiK2StztoNIq+qFIclskZEuQMGJV/uKeV4hb67IC5Zw=;
	h=From:To:Subject:Date:From;
	b=H5q8l/57TrBPv9+puVeVQxLAZxiF9Nvr/KqTMujduT2VVNiR4COYepln0aLUd8Vdr
	 ZpbhDk2hiSxcE9eq4X4FjFcbPXzxoN/yYOuHNt+b/zt1GSIDoqpRKMVeaqD/Oe1p19
	 z2kPQ85ce3zaRgKuL5ADz1YyhDS745dbi4BvuPeI=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp1.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id B0D9260175;
	Wed,  7 Apr 2021 10:02:08 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 4/5] staging: comedi: tests: ni_routes_test: Lines should not end with a '('
Date: Wed,  7 Apr 2021 15:01:41 +0100
Message-Id: <20210407140142.447250-5-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407140142.447250-1-abbotti@mev.co.uk>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 6de28929-b89a-445d-9861-df15a58200d7-5-1

Fix checkpatch.pl issues such as the following:

CHECK: Lines should not end with a '('
+	unittest(

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 .../comedi/drivers/tests/ni_routes_test.c     | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
index 7dfc70a4cc6f..96e778031da3 100644
--- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
+++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
@@ -243,13 +243,11 @@ void test_ni_assign_device_routes(void)
 	unittest(route_set_sources_in_order(devroutes),
 		 "all pci-6070e route_set->src's in order of signal source\n");
 
-	unittest(
-	  RVI(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(17) &&
-	  RVI(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == 0 &&
-	  RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == 0 &&
-	  RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) ==
-		V(NI_PFI_OUTPUT_AI_CONVERT),
-	  "pci-6070e finds e-series route_values table\n");
+	unittest(RVI(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(17) &&
+		 RVI(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == 0 &&
+		 RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == 0 &&
+		 RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) == V(NI_PFI_OUTPUT_AI_CONVERT),
+		 "pci-6070e finds e-series route_values table\n");
 
 	olddevroutes = devroutes;
 	oldtable = table;
@@ -263,12 +261,11 @@ void test_ni_assign_device_routes(void)
 		 "find device pci-6220\n");
 	unittest(oldtable != table, "pci-6220 find other route_values table\n");
 
-	unittest(
-	  RVI(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(20) &&
-	  RVI(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == V(12) &&
-	  RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == V(3) &&
-	  RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) == V(3),
-	  "pci-6220 finds m-series route_values table\n");
+	unittest(RVI(table, B(PXI_Star), B(NI_AI_SampleClock)) == V(20) &&
+		 RVI(table, B(NI_10MHzRefClock), B(TRIGGER_LINE(0))) == V(12) &&
+		 RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(0))) == V(3) &&
+		 RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) == V(3),
+		 "pci-6220 finds m-series route_values table\n");
 }
 
 void test_ni_sort_device_routes(void)
-- 
2.31.0

