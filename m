Received: from smtp104.ord1c.emailsrvr.com (smtp104.ord1c.emailsrvr.com [108.166.43.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D1A29CA
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617819237;
	bh=RAOPnsWma9Hl9BGxR17O3QGEGqebnvr9zo10YznlKQo=;
	h=From:To:Subject:Date:From;
	b=GvRcftKrw0O7ZuEsoeK4qenXAVxhn3oVJUVKlVf5mYhFcntovAUnp0vmJ2aea7jC9
	 Zx7sXkGRpUP3vF3fLgbffVQ3BWiAc8/EfI2wGwn8tNThzxAmfmMSGKUynLji2VPKw5
	 BYdtCo18Qah7xCp/a4pCnrvTdFQpCaWxKWQKmlQM=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp14.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 4A7CCC0226;
	Wed,  7 Apr 2021 14:13:56 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH v2 1/6] staging: comedi: tests: ni_routes_test: Reduce stack usage
Date: Wed,  7 Apr 2021 19:13:37 +0100
Message-Id: <20210407181342.1117754-2-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407181342.1117754-1-abbotti@mev.co.uk>
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
 <20210407181342.1117754-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: a81c9685-f05f-4fba-8531-f3df5c3a4275-2-1

Declare the `unit_tests` array in `ni_routes_unittest()` `static` to
reduce stack usage.

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
v2: Fix email address in Cc: line
---
 drivers/staging/comedi/drivers/tests/ni_routes_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
index 777d9b5d96d4..cdfbb054d537 100644
--- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
+++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
@@ -577,7 +577,7 @@ void test_ni_get_reg_value(void)
 /* **** BEGIN simple module entry/exit functions **** */
 static int __init ni_routes_unittest(void)
 {
-	const unittest_fptr unit_tests[] = {
+	static const unittest_fptr unit_tests[] = {
 		test_ni_assign_device_routes,
 		test_ni_sort_device_routes,
 		test_ni_find_route_set,
-- 
2.31.0

