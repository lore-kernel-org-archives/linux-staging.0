Received: from smtp66.iad3a.emailsrvr.com (smtp66.iad3a.emailsrvr.com [173.203.187.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB686D12
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617818004;
	bh=QpmJhOwPi/lCFmsBDKnWYm0cJKBWvZ7JOYcKZO16/ok=;
	h=From:To:Subject:Date:From;
	b=gb8WZsr+5bMZRNp1g+AsyBSri9/fYiapG7gswhh8tk45sh4Q+HIgq5f+IKuOrWkjX
	 W7Y/FAXT2zKZKdtIJUTDKtR21z6b5co2w0jj6XFPHWKK3vKc5730MywIPdwqAM678k
	 Hiq3MZlzbxpNfMpn5T6pI3x3SThlOGEmjFYWunq8=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp17.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id A38FB25E1A;
	Wed,  7 Apr 2021 13:53:23 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 6/6] staging: comedi: Add Kconfig options to build unit test modules
Date: Wed,  7 Apr 2021 18:53:07 +0100
Message-Id: <20210407175307.1114472-7-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407175307.1114472-1-abbotti@mev.co.uk>
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 5feb4b29-2060-4bb6-a8af-5bdb2c2252ce-7-1

The comedi unit-test modules in "drivers/staging/comedi/drivers/tests/"
are built if the `CONFIG_COMEDI_TESTS` option is enabled, but the comedi
Kconfig file contains no code to enable the option.  Add config options
to allow each of the unit-test modules to be enabled individually.  The
"ni_route_tests" module depends on the "ni_routing" module, so select it
if the "ni_route_tests" module is configured to be built.

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/staging/comedi/Kconfig                | 33 +++++++++++++++++++
 drivers/staging/comedi/drivers/tests/Makefile |  4 +--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/comedi/Kconfig b/drivers/staging/comedi/Kconfig
index 049b659fa6ad..1fbc517f4276 100644
--- a/drivers/staging/comedi/Kconfig
+++ b/drivers/staging/comedi/Kconfig
@@ -1319,4 +1319,37 @@ config COMEDI_NI_TIO
 config COMEDI_NI_ROUTING
 	tristate
 
+config COMEDI_TESTS
+	tristate "Comedi unit tests"
+	help
+	  Enable comedi unit-test modules to be built.
+
+	  Note that the answer to this question won't directly affect the
+	  kernel: saying N will just cause the configurator to skip all
+	  the questions about comedi unit-test modules.
+
+if COMEDI_TESTS
+
+config COMEDI_TESTS_EXAMPLE
+	tristate "Comedi example unit-test module"
+	help
+	  Enable support for an example unit-test module.  This is just a
+	  silly example to be used as a basis for writing other unit-test
+	  modules.
+
+	  To compile this as a module, choose M here: the module will be called
+	  comedi_example_test.
+
+config COMEDI_TESTS_NI_ROUTES
+	tristate "NI routing unit-test module"
+	select NI_ROUTING
+	help
+	  Enable support for a unit-test module to test the signal routing
+	  code used by comedi drivers for various National Instruments cards.
+
+	  To compile this as a module, choose M here: the module will be called
+	  ni_routes_test.
+
+endif # COMEDI_TESTS
+
 endif # COMEDI
diff --git a/drivers/staging/comedi/drivers/tests/Makefile b/drivers/staging/comedi/drivers/tests/Makefile
index a7883e406c43..5ff7cdc32a32 100644
--- a/drivers/staging/comedi/drivers/tests/Makefile
+++ b/drivers/staging/comedi/drivers/tests/Makefile
@@ -3,6 +3,6 @@
 #
 ccflags-$(CONFIG_COMEDI_DEBUG)		:= -DDEBUG
 
-obj-$(CONFIG_COMEDI_TESTS)		+= comedi_example_test.o
-obj-$(CONFIG_COMEDI_TESTS)		+= ni_routes_test.o
+obj-$(CONFIG_COMEDI_TESTS_EXAMPLE)	+= comedi_example_test.o
+obj-$(CONFIG_COMEDI_TESTS_NI_ROUTES)	+= ni_routes_test.o
 CFLAGS_ni_routes_test.o			:= -DDEBUG
-- 
2.31.0

