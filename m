Received: from smtp65.iad3a.emailsrvr.com (smtp65.iad3a.emailsrvr.com [173.203.187.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3629CA
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617817998;
	bh=OqVIdfcFshfPgLj8ym9liPTB8r4xATJudDKkfF20wHg=;
	h=From:To:Subject:Date:From;
	b=EKzBrPWboCM/7MNgd6gngGKd5GY5Mb9tIsLgJXQf9NqWXGZ0n3SB4BZXivIflX38b
	 Y3fdPXNRjprdjyZP8fCehu6m8OALu8pltAYVqoJnBZOKqxV0IjyjHDc/y8d04zeCQg
	 5MR6HfGlF1glFb1w4kvRpWLTilOOgdk/M+eZCaaM=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp17.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 72D6A25E5C;
	Wed,  7 Apr 2021 13:53:17 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 0/6] staging: comedi: tests: Fix a few more issues
Date: Wed,  7 Apr 2021 18:53:01 +0100
Message-Id: <20210407175307.1114472-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 5feb4b29-2060-4bb6-a8af-5bdb2c2252ce-1-1

Fix a few more issues with the "drivers/staging/comedi/drivers/test/"
code, including reducing stack usage, declaring more stuff as 'static'
and adding Kconfig code to allow the unit-test modules to be selected to
be built individually.

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

