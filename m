Received: from smtp110.ord1c.emailsrvr.com (smtp110.ord1c.emailsrvr.com [108.166.43.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E229CA
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617819239;
	bh=LXUefLkKvaz6hWw5u9LBoJ/BafhDoPdnK49aarPrhRM=;
	h=From:To:Subject:Date:From;
	b=BHi57+eFDIsGNWixCA7+soAu8fRWJVQPBIOjRm2haqCb0tfVSYFEas/DMCpELQCeW
	 qAxG2EpcPF0RkcfqvINQ2ePkYRvm/FDsu7Dt58ge5j5M1tQstxxU/AFOtdPEtifUL7
	 zaNYsKaPzcRXRNs21GAoCweAiksUsiKzNNzr736Y=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp14.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 94D5AC01F8;
	Wed,  7 Apr 2021 14:13:58 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH v2 3/6] staging: comedi: tests: example_test: Reduce stack usage
Date: Wed,  7 Apr 2021 19:13:39 +0100
Message-Id: <20210407181342.1117754-4-abbotti@mev.co.uk>
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
X-Classification-ID: a81c9685-f05f-4fba-8531-f3df5c3a4275-4-1

Declare the `unit_tests` array in `unittest_enter()` `static` to reduce
stack usage a bit.

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
v2: Fix email address in Cc: line
---
 drivers/staging/comedi/drivers/tests/example_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/tests/example_test.c b/drivers/staging/comedi/drivers/tests/example_test.c
index 4d1ab130339d..550784fdac2f 100644
--- a/drivers/staging/comedi/drivers/tests/example_test.c
+++ b/drivers/staging/comedi/drivers/tests/example_test.c
@@ -52,7 +52,7 @@ void test0(void)
 /* **** BEGIN simple module entry/exit functions **** */
 static int __init unittest_enter(void)
 {
-	const unittest_fptr unit_tests[] = {
+	static const unittest_fptr unit_tests[] = {
 		test0,
 		NULL,
 	};
-- 
2.31.0

