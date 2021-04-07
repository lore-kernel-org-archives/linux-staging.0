Received: from smtp70.iad3a.emailsrvr.com (smtp70.iad3a.emailsrvr.com [173.203.187.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B865A6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617818000;
	bh=CH1+5KVhtnxZS5RmFR7yhoijkRzPn6SkIN+Si+FQ1/E=;
	h=From:To:Subject:Date:From;
	b=Ia409fKUAYzWgId7BJfwOV2gC3vqPWgRKGzFlTzm4ofsVvV6yv4YpBnCAWHSya2lA
	 9jKOMRlM77bYxYd/p/4ADxTrJAxvhfSD5rV6NHUeJDvZQnlz+VtxX5dkIocJYpV8l5
	 q7iEoq8O8BpUILJ2bx+TPnXWUh92z9spcpguRCrY=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp17.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 7DB1F25E60;
	Wed,  7 Apr 2021 13:53:19 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 2/6] staging: comedi: tests: ni_route_tests: Declare functions static
Date: Wed,  7 Apr 2021 18:53:03 +0100
Message-Id: <20210407175307.1114472-3-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407175307.1114472-1-abbotti@mev.co.uk>
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 5feb4b29-2060-4bb6-a8af-5bdb2c2252ce-3-1

The "ni_routes_test" module contains a bunch of functions with external
linkage that are not called externally.  Declare them `static`.

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 .../comedi/drivers/tests/ni_routes_test.c     | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
index cdfbb054d537..40fe4f180eb9 100644
--- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
+++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
@@ -194,7 +194,7 @@ static bool route_set_dests_in_order(const struct ni_device_routes *devroutes)
 }
 
 /* Tests that all route_set->src are in order of the signal source. */
-bool route_set_sources_in_order(const struct ni_device_routes *devroutes)
+static bool route_set_sources_in_order(const struct ni_device_routes *devroutes)
 {
 	int i;
 
@@ -211,7 +211,7 @@ bool route_set_sources_in_order(const struct ni_device_routes *devroutes)
 	return true;
 }
 
-void test_ni_assign_device_routes(void)
+static void test_ni_assign_device_routes(void)
 {
 	const struct ni_device_routes *devroutes, *olddevroutes;
 	const u8 *table, *oldtable;
@@ -268,7 +268,7 @@ void test_ni_assign_device_routes(void)
 		 "pci-6220 finds m-series route_values table\n");
 }
 
-void test_ni_sort_device_routes(void)
+static void test_ni_sort_device_routes(void)
 {
 	/* We begin by sorting the device routes for use in later tests */
 	ni_sort_device_routes(&DR);
@@ -279,7 +279,7 @@ void test_ni_sort_device_routes(void)
 		 "all route_set->src's of fake data in order of sig. source\n");
 }
 
-void test_ni_find_route_set(void)
+static void test_ni_find_route_set(void)
 {
 	unittest(!ni_find_route_set(bad_dest, &DR),
 		 "check for nonexistent route_set\n");
@@ -295,7 +295,7 @@ void test_ni_find_route_set(void)
 		 "find last route_set\n");
 }
 
-void test_ni_route_set_has_source(void)
+static void test_ni_route_set_has_source(void)
 {
 	unittest(!ni_route_set_has_source(&DR.routes[0], O(0)),
 		 "check for bad source\n");
@@ -307,7 +307,7 @@ void test_ni_route_set_has_source(void)
 		 "find last source\n");
 }
 
-void test_ni_route_to_register(void)
+static void test_ni_route_to_register(void)
 {
 	const struct ni_route_tables *T = &private.routing_tables;
 
@@ -357,7 +357,7 @@ void test_ni_route_to_register(void)
 		 "validate indirect route through brd3 to TRIGGER_LINE(1)\n");
 }
 
-void test_ni_lookup_route_register(void)
+static void test_ni_lookup_route_register(void)
 {
 	const struct ni_route_tables *T = &private.routing_tables;
 
@@ -396,7 +396,7 @@ void test_ni_lookup_route_register(void)
 		 "brd0_src1: lookup indirect route register\n");
 }
 
-void test_route_is_valid(void)
+static void test_route_is_valid(void)
 {
 	const struct ni_route_tables *T = &private.routing_tables;
 
@@ -411,7 +411,7 @@ void test_route_is_valid(void)
 		 "validate last destination\n");
 }
 
-void test_ni_is_cmd_dest(void)
+static void test_ni_is_cmd_dest(void)
 {
 	init_pci_fake();
 	unittest(ni_is_cmd_dest(NI_AI_SampleClock),
@@ -428,7 +428,7 @@ void test_ni_is_cmd_dest(void)
 		 "check that AO/SampleClockTimebase _not_ cmd destination\n");
 }
 
-void test_channel_is_pfi(void)
+static void test_channel_is_pfi(void)
 {
 	init_pci_fake();
 	unittest(channel_is_pfi(NI_PFI(0)), "check First pfi channel\n");
@@ -438,7 +438,7 @@ void test_channel_is_pfi(void)
 		 "check first non pfi channel\n");
 }
 
-void test_channel_is_rtsi(void)
+static void test_channel_is_rtsi(void)
 {
 	init_pci_fake();
 	unittest(channel_is_rtsi(TRIGGER_LINE(0)),
@@ -451,7 +451,7 @@ void test_channel_is_rtsi(void)
 		 "check first non rtsi channel\n");
 }
 
-void test_ni_count_valid_routes(void)
+static void test_ni_count_valid_routes(void)
 {
 	const struct ni_route_tables *T = &private.routing_tables;
 
@@ -459,7 +459,7 @@ void test_ni_count_valid_routes(void)
 	unittest(ni_count_valid_routes(T) == 57, "count all valid routes\n");
 }
 
-void test_ni_get_valid_routes(void)
+static void test_ni_get_valid_routes(void)
 {
 	const struct ni_route_tables *T = &private.routing_tables;
 	unsigned int pair_data[2];
@@ -476,7 +476,7 @@ void test_ni_get_valid_routes(void)
 		 "destination of first valid pair from ni_get_valid_routes\n");
 }
 
-void test_ni_find_route_source(void)
+static void test_ni_find_route_source(void)
 {
 	const struct ni_route_tables *T = &private.routing_tables;
 
@@ -493,7 +493,7 @@ void test_ni_find_route_source(void)
 		 "find invalid source (without checking device routes)\n");
 }
 
-void test_route_register_is_valid(void)
+static void test_route_register_is_valid(void)
 {
 	const struct ni_route_tables *T = &private.routing_tables;
 
@@ -508,7 +508,7 @@ void test_route_register_is_valid(void)
 		 "find last source");
 }
 
-void test_ni_check_trigger_arg(void)
+static void test_ni_check_trigger_arg(void)
 {
 	const struct ni_route_tables *T = &private.routing_tables;
 
@@ -541,7 +541,7 @@ void test_ni_check_trigger_arg(void)
 		 "check trigger arg for last src->dest\n");
 }
 
-void test_ni_get_reg_value(void)
+static void test_ni_get_reg_value(void)
 {
 	const struct ni_route_tables *T = &private.routing_tables;
 
-- 
2.31.0

