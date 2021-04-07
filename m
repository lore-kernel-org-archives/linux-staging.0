Received: from smtp109.ord1c.emailsrvr.com (smtp109.ord1c.emailsrvr.com [108.166.43.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885FE6D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617819240;
	bh=/n8xlksT0U2kfhS3wyjpfGCKweb+VgR1KUxAlem3A6s=;
	h=From:To:Subject:Date:From;
	b=DZW56nFk50YrwEsVQctNEdvK0W2HHMJys7WTiGjwsJ56YI+hguZeMrMVYHb9XUm3E
	 WX3dPOx3F1SCw9rT1SsQ8UfhrUzfkVsbIDWuZ5MqaSOUavy8JIQIiMqxteIze/lQv5
	 oElEsm9LNiEMRwP+enj24cZHHYfPOi5c6u2ZFVCo=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp14.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id B21C0C021D;
	Wed,  7 Apr 2021 14:13:59 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH v2 4/6] staging: comedi: tests: example_test: Declare functions static
Date: Wed,  7 Apr 2021 19:13:40 +0100
Message-Id: <20210407181342.1117754-5-abbotti@mev.co.uk>
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
X-Classification-ID: a81c9685-f05f-4fba-8531-f3df5c3a4275-5-1

The "example_test" module contains a couple of functions with external
linkage that are not called externally.  Declare them `static`.

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
v2: Unchanged
---
 drivers/staging/comedi/drivers/tests/example_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/comedi/drivers/tests/example_test.c b/drivers/staging/comedi/drivers/tests/example_test.c
index 550784fdac2f..7010f6ef322d 100644
--- a/drivers/staging/comedi/drivers/tests/example_test.c
+++ b/drivers/staging/comedi/drivers/tests/example_test.c
@@ -35,14 +35,14 @@ static struct comedi_device dev = {
 /* *** END fake board data *** */
 
 /* *** BEGIN fake data init *** */
-void init_fake(void)
+static void init_fake(void)
 {
 	dev.item = 10;
 }
 
 /* *** END fake data init *** */
 
-void test0(void)
+static void test0(void)
 {
 	init_fake();
 	unittest(dev.item != 11, "negative result\n");
-- 
2.31.0

