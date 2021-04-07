Received: from smtp70.iad3b.emailsrvr.com (smtp70.iad3b.emailsrvr.com [146.20.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9C70
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617804130;
	bh=3KUUhqo1H2+MsHr0NNbEO+9D+/yLMZRFsmJz45g0ZpI=;
	h=From:To:Subject:Date:From;
	b=OLyUuDX0AgeDUYPbh7fmEZzeUtXKvrOCizxA0CjvzAwqwIRbluhwXbExC8PhKar5Y
	 YWaANvtPtu2EkB0yLzWSCAFWasnEv4AEwRwu17gfEEk9NKKkgccUyRe4W8rm4y96lG
	 /nuMchj17vC/tNG7FzaTADU5CO4Sn1VWcBTj7Wig=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp1.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id D49D0601B4;
	Wed,  7 Apr 2021 10:02:09 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 5/5] staging: comedi: tests: Correct unittest_fptr
Date: Wed,  7 Apr 2021 15:01:42 +0100
Message-Id: <20210407140142.447250-6-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407140142.447250-1-abbotti@mev.co.uk>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 6de28929-b89a-445d-9861-df15a58200d7-6-1

The definition of the `unittest_fptr` function pointer type has the
wrong function return type `void *` instead of `void`.  The problem is
hidden by a bunch of unnecessary type-casts.  Fix the type definition
and remove the type-casts.

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 .../comedi/drivers/tests/example_test.c       |  2 +-
 .../comedi/drivers/tests/ni_routes_test.c     | 32 +++++++++----------
 .../staging/comedi/drivers/tests/unittest.h   |  2 +-
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/comedi/drivers/tests/example_test.c b/drivers/staging/comedi/drivers/tests/example_test.c
index fc65158b8e8e..4d1ab130339d 100644
--- a/drivers/staging/comedi/drivers/tests/example_test.c
+++ b/drivers/staging/comedi/drivers/tests/example_test.c
@@ -53,7 +53,7 @@ void test0(void)
 static int __init unittest_enter(void)
 {
 	const unittest_fptr unit_tests[] = {
-		(unittest_fptr)test0,
+		test0,
 		NULL,
 	};
 
diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
index 96e778031da3..777d9b5d96d4 100644
--- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
+++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
@@ -578,22 +578,22 @@ void test_ni_get_reg_value(void)
 static int __init ni_routes_unittest(void)
 {
 	const unittest_fptr unit_tests[] = {
-		(unittest_fptr)test_ni_assign_device_routes,
-		(unittest_fptr)test_ni_sort_device_routes,
-		(unittest_fptr)test_ni_find_route_set,
-		(unittest_fptr)test_ni_route_set_has_source,
-		(unittest_fptr)test_ni_route_to_register,
-		(unittest_fptr)test_ni_lookup_route_register,
-		(unittest_fptr)test_route_is_valid,
-		(unittest_fptr)test_ni_is_cmd_dest,
-		(unittest_fptr)test_channel_is_pfi,
-		(unittest_fptr)test_channel_is_rtsi,
-		(unittest_fptr)test_ni_count_valid_routes,
-		(unittest_fptr)test_ni_get_valid_routes,
-		(unittest_fptr)test_ni_find_route_source,
-		(unittest_fptr)test_route_register_is_valid,
-		(unittest_fptr)test_ni_check_trigger_arg,
-		(unittest_fptr)test_ni_get_reg_value,
+		test_ni_assign_device_routes,
+		test_ni_sort_device_routes,
+		test_ni_find_route_set,
+		test_ni_route_set_has_source,
+		test_ni_route_to_register,
+		test_ni_lookup_route_register,
+		test_route_is_valid,
+		test_ni_is_cmd_dest,
+		test_channel_is_pfi,
+		test_channel_is_rtsi,
+		test_ni_count_valid_routes,
+		test_ni_get_valid_routes,
+		test_ni_find_route_source,
+		test_route_register_is_valid,
+		test_ni_check_trigger_arg,
+		test_ni_get_reg_value,
 		NULL,
 	};
 
diff --git a/drivers/staging/comedi/drivers/tests/unittest.h b/drivers/staging/comedi/drivers/tests/unittest.h
index b8e622ea1de1..2da3beea2479 100644
--- a/drivers/staging/comedi/drivers/tests/unittest.h
+++ b/drivers/staging/comedi/drivers/tests/unittest.h
@@ -27,7 +27,7 @@ static struct unittest_results {
 	int failed;
 } unittest_results;
 
-typedef void *(*unittest_fptr)(void);
+typedef void (*unittest_fptr)(void);
 
 #define unittest(result, fmt, ...) ({ \
 	bool failed = !(result); \
-- 
2.31.0

