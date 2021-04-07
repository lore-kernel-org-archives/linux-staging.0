Received: from smtp70.iad3a.emailsrvr.com (smtp70.iad3a.emailsrvr.com [173.203.187.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6AC6D13
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617818001;
	bh=8pad1+4AwXqlnsVrvFyjla0r8ngw9L6EabIPkthIt08=;
	h=From:To:Subject:Date:From;
	b=ATjdN4Qtv9iiHIAfUlIO1H4fhriEHmxri1fpIyySQf7M4ES7GZl6cgm15cQ353Gl/
	 jnvjD7sb6yRJMJ7X4HrT8d0k2aRj1A/iJj/tXaoXuD0u8fMynsSexqni4lOWEPJK6B
	 Uu1skso6PNoOvI0ktBRehG5EqdTahreq4HHbMur8=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp17.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 8787325E8C;
	Wed,  7 Apr 2021 13:53:20 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>,
	SpencerE.Olsonolsonse@umich.edu
Subject: [PATCH 3/6] staging: comedi: tests: example_test: Reduce stack usage
Date: Wed,  7 Apr 2021 18:53:04 +0100
Message-Id: <20210407175307.1114472-4-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407175307.1114472-1-abbotti@mev.co.uk>
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 5feb4b29-2060-4bb6-a8af-5bdb2c2252ce-4-1

Declare the `unit_tests` array in `unittest_enter()` `static` to reduce
stack usage a bit.

Cc: <Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
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

