Received: from smtp66.iad3a.emailsrvr.com (smtp66.iad3a.emailsrvr.com [173.203.187.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C180C6D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617818002;
	bh=ERULzAyhgwB4xtCIhct9PGmeUSmt6seI4zs5bLNY5Q8=;
	h=From:To:Subject:Date:From;
	b=fGcQHVsu0XkDf9K2WaxI7q30er5UEWOb5q4AW71YWd6nStRnxFPLG0rxC1Aan1PG9
	 8zdTMtfbhOlChl58Tn7BNquU1OMsoI99p2QR6na9iYHxiFQKqzgwmgKqWw4ObwEQGy
	 kFJf4nVnZ6uSCz39Z6jaQZoWLgtoDrGL6FOC/0rk=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp17.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 9DF2625E81;
	Wed,  7 Apr 2021 13:53:21 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 4/6] staging: comedi: tests: example_test: Declare functions static
Date: Wed,  7 Apr 2021 18:53:05 +0100
Message-Id: <20210407175307.1114472-5-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407175307.1114472-1-abbotti@mev.co.uk>
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 5feb4b29-2060-4bb6-a8af-5bdb2c2252ce-5-1

The "example_test" module contains a couple of functions with external
linkage that are not called externally.  Declare them `static`.

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
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

