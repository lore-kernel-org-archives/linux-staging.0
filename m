Received: from smtp67.iad3b.emailsrvr.com (smtp67.iad3b.emailsrvr.com [146.20.161.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DBC6D13
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617804127;
	bh=bRy3/0PBd8Gndksl05srFfXmozKflTF0JCGKNISAt68=;
	h=From:To:Subject:Date:From;
	b=Q2pKJ71zbk3Z3Xv9xgGg9iH/VIF+FjbUIuVLVhZn85AKInhLt3mxFaMofAxMHDBQQ
	 DOcP8BLkDmRMNjFs084qLw35/hIehBt2BY1gE7VLhs8kra6lkM4rjrpme+NypbboVc
	 VH7Ukn83gVBuRjOH6UeLqbNC7EnNY3mVieaAWDlU=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp1.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 8267B600A9;
	Wed,  7 Apr 2021 10:02:06 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: [PATCH 2/5] staging: comedi: tests: ni_routes_test: Put complex values in parentheses
Date: Wed,  7 Apr 2021 15:01:39 +0100
Message-Id: <20210407140142.447250-3-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210407140142.447250-1-abbotti@mev.co.uk>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 6de28929-b89a-445d-9861-df15a58200d7-3-1

Fix checkpatch.pl errors such as:

ERROR: Macros with complex values should be enclosed in parentheses
+#define I1(x1)	\
+	(int[]){ \
+		x1, 0 \
+	}

Also, wrap that `x1` in parentheses.

Cc: Spencer E. Olson <olsonse@umich.edu>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 .../comedi/drivers/tests/ni_routes_test.c      | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
index 68defeb53de4..696e610f1822 100644
--- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
+++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
@@ -63,24 +63,24 @@ static const int no_val_dest = O(7), no_val_index = 4;
 
 /* I1 and I2 should not call O(...).  Mostly here to shut checkpatch.pl up */
 #define I1(x1)	\
-	(int[]){ \
-		x1, 0 \
-	}
+	((int[]){ \
+		(x1), 0 \
+	 })
 #define I2(x1, x2)	\
-	(int[]){ \
+	((int[]){ \
 		(x1), (x2), 0 \
-	}
+	 })
 #define I3(x1, x2, x3)	\
-	(int[]){ \
+	((int[]){ \
 		(x1), (x2), (x3), 0 \
-	}
+	 })
 
 /* O9 is build to call O(...) for each arg */
 #define O9(x1, x2, x3, x4, x5, x6, x7, x8, x9)	\
-	(int[]){ \
+	((int[]){ \
 		O(x1), O(x2), O(x3), O(x4), O(x5), O(x6), O(x7), O(x8), O(x9), \
 		0 \
-	}
+	 })
 
 static struct ni_device_routes DR = {
 	.device = "testdev",
-- 
2.31.0

