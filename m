Received: from smtp64.iad3b.emailsrvr.com (smtp64.iad3b.emailsrvr.com [146.20.161.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733A6D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617804125;
	bh=ET50cCaY7BSrWD8k2L6LYMTROOk8LtaWI83CTwrrlBc=;
	h=From:To:Subject:Date:From;
	b=M8uuXC88GVcE//esBnSveu64z+4lDQiPpy2oTSukF7+TxRRyaHFBbgrb3DL2lknXM
	 2eHHFvBmRc+RIUa3RkQG3hLuNqpvKB/7CHDVvROF9pf6msMBX7pCtP200RzovZZoO5
	 mOnH9hclW/cGxUoYmVT+KYEjRFzaZqFcJcHv6/g4=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp1.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 460F86017E;
	Wed,  7 Apr 2021 10:02:04 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 0/5] staging: comedi: tests: Fix various issues
Date: Wed,  7 Apr 2021 15:01:37 +0100
Message-Id: <20210407140142.447250-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 6de28929-b89a-445d-9861-df15a58200d7-1-1

The code under "drivers/staging/comedi/drivers/tests/" is built when the
CONFIG_COMEDI_TESTS option is enabled.  That currently needs to be done
on the "make" command line since the option does not appear in the
Kconfig files.

This patch series fixes a compilation error and various other niggles
including checkpatch.pl stuff.

1) staging: comedi: tests: ni_routes_test: Fix compilation error
2) staging: comedi: tests: ni_routes_test: Put complex values in parentheses
3) staging: comedi: tests: ni_routes_test: Avoid CamelCase: <RVi>
4) staging: comedi: tests: ni_routes_test: Lines should not end with a '('
5) staging: comedi: tests: Correct unittest_fptr

 .../staging/comedi/drivers/tests/example_test.c    |  2 +-
 .../staging/comedi/drivers/tests/ni_routes_test.c  | 81 +++++++++++-----------
 drivers/staging/comedi/drivers/tests/unittest.h    |  2 +-
 3 files changed, 42 insertions(+), 43 deletions(-)

