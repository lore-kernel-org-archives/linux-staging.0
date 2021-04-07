Received: from smtp68.iad3a.emailsrvr.com (smtp68.iad3a.emailsrvr.com [173.203.187.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BF16D12
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617817999;
	bh=IY16YFesfe8PsOaFmI+W8xW4WnJqNWzcRvcaWWLaDP8=;
	h=From:To:Subject:Date:From;
	b=KvOUw1QXZs8rQuwSrB2p+BHhF2WJIG2W9jSScngXrTjDdE61UagxhUKa7vMWJhWkK
	 xsE/rQtXDEz4B7O1R5kq8L4tI6lpULxdKpYJSpRken8hCvCD4p0BYqkGA9euLGApyI
	 RKQDzK43xmvZ71A39bYXfL7FLhau54bcYXPXE8eM=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp17.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 6D1D025E4A;
	Wed,  7 Apr 2021 13:53:18 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>,
	SpencerE.Olsonolsonse@umich.edu
Subject: [PATCH 1/6] staging: comedi: tests: ni_routes_test: Reduce stack usage
Date: Wed,  7 Apr 2021 18:53:02 +0100
Message-Id: <20210407175307.1114472-2-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407175307.1114472-1-abbotti@mev.co.uk>
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 5feb4b29-2060-4bb6-a8af-5bdb2c2252ce-2-1

Declare the `unit_tests` array in `ni_routes_unittest()` `static` to
reduce stack usage.

Cc: <Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
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

