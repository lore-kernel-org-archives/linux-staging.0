Received: from smtp110.ord1c.emailsrvr.com (smtp110.ord1c.emailsrvr.com [108.166.43.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CDC6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617819235;
	bh=Bf9Isj11TsIRmD3tuMzW+BtstFCCdRPAvUfzrECbDzw=;
	h=From:To:Subject:Date:From;
	b=lSL7tWogfR62SviOanwGSgQaacU6+Vp454JW6hxjIWKhX62TQBN5tHnKBncQrxXHP
	 mPZfttb8MNQZLzIMFZl4DvwCoag1Cuws/5rLE9iNlDtJStZea2437oCHKdomJ5Jbw3
	 QkID7T7JDU8Q2T13uxFBkOS/FwFF4ypSSht0Y9e8=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp14.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 20641C01DA;
	Wed,  7 Apr 2021 14:13:55 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH v2 0/6] staging: comedi: tests: Fix a few more issues
Date: Wed,  7 Apr 2021 19:13:36 +0100
Message-Id: <20210407181342.1117754-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407175307.1114472-1-abbotti@mev.co.uk>
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: a81c9685-f05f-4fba-8531-f3df5c3a4275-1-1

Fix a few more issues with the "drivers/staging/comedi/drivers/test/"
code, including reducing stack usage, declaring more stuff as 'static'
and adding Kconfig code to allow the unit-test modules to be selected to
be built individually.

v2: Correct faulty Cc: lines in patches 1 and 3.

1) staging: comedi: tests: ni_routes_test: Reduce stack usage
2) staging: comedi: tests: ni_route_tests: Declare functions static
3) staging: comedi: tests: example_test: Reduce stack usage
4) staging: comedi: tests: example_test: Declare functions static
5) staging: comedi: tests: example_test: Rename to 'comedi_example_test'
6) staging: comedi: Add Kconfig options to build unit test modules

 drivers/staging/comedi/Kconfig                     | 33 ++++++++++++++++++++
 drivers/staging/comedi/drivers/tests/Makefile      |  3 +-
 .../{example_test.c => comedi_example_test.c}      |  8 ++---
 .../staging/comedi/drivers/tests/ni_routes_test.c  | 36 +++++++++++-----------
 4 files changed, 57 insertions(+), 23 deletions(-)

