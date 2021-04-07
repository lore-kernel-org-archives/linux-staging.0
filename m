Received: from smtp104.ord1c.emailsrvr.com (smtp104.ord1c.emailsrvr.com [108.166.43.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263776D12
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617819242;
	bh=gsrnrtPOji4n+EPnHsi3T2RzScw2a7Ygvmct/z2P//s=;
	h=From:To:Subject:Date:From;
	b=Y4WWjLZLrf9VHMag8fCJRvXcY7B1qb84vbyLS4kNNFS5MUFL1/3MMoLYGEMWp4O0z
	 X6DOIuL+QaeEDLO4ZPnioWYIB/3lHFJS3T9ZSLIdMTu09viWl/SXkdHhJnjdvCLX02
	 kmfZJQmbJulZtN2RZuYlB7qocuEV2NHhHd2S8+6Q=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp14.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 59B0EC01F3;
	Wed,  7 Apr 2021 14:14:01 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH v2 5/6] staging: comedi: tests: example_test: Rename to 'comedi_example_test'
Date: Wed,  7 Apr 2021 19:13:41 +0100
Message-Id: <20210407181342.1117754-6-abbotti@mev.co.uk>
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
X-Classification-ID: a81c9685-f05f-4fba-8531-f3df5c3a4275-6-1

Rename the "example_test" module to "comedi_example_test" to make the
name more relevant to Comedi.

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
v2: Unchanged
---
 drivers/staging/comedi/drivers/tests/Makefile                  | 3 ++-
 .../drivers/tests/{example_test.c => comedi_example_test.c}    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename drivers/staging/comedi/drivers/tests/{example_test.c => comedi_example_test.c} (97%)

diff --git a/drivers/staging/comedi/drivers/tests/Makefile b/drivers/staging/comedi/drivers/tests/Makefile
index b5d8e13d4162..a7883e406c43 100644
--- a/drivers/staging/comedi/drivers/tests/Makefile
+++ b/drivers/staging/comedi/drivers/tests/Makefile
@@ -3,5 +3,6 @@
 #
 ccflags-$(CONFIG_COMEDI_DEBUG)		:= -DDEBUG
 
-obj-$(CONFIG_COMEDI_TESTS)		+= example_test.o ni_routes_test.o
+obj-$(CONFIG_COMEDI_TESTS)		+= comedi_example_test.o
+obj-$(CONFIG_COMEDI_TESTS)		+= ni_routes_test.o
 CFLAGS_ni_routes_test.o			:= -DDEBUG
diff --git a/drivers/staging/comedi/drivers/tests/example_test.c b/drivers/staging/comedi/drivers/tests/comedi_example_test.c
similarity index 97%
rename from drivers/staging/comedi/drivers/tests/example_test.c
rename to drivers/staging/comedi/drivers/tests/comedi_example_test.c
index 7010f6ef322d..e5aaaeab7bdd 100644
--- a/drivers/staging/comedi/drivers/tests/example_test.c
+++ b/drivers/staging/comedi/drivers/tests/comedi_example_test.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /* vim: set ts=8 sw=8 noet tw=80 nowrap: */
 /*
- *  comedi/drivers/tests/example_test.c
+ *  comedi/drivers/tests/comedi_example_test.c
  *  Example set of unit tests.
  *
  *  COMEDI - Linux Control and Measurement Device Interface
-- 
2.31.0

