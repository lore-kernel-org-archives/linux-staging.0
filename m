Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9E72CAC
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:00 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWRi7-1mnpax3UPD-00Xx1z; Sun, 23 Jan 2022 21:02:52 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 03/18] staging: vchiq_arm: introduce is_adjacent_block
Date: Sun, 23 Jan 2022 21:02:08 +0100
Message-Id: <1642968143-19281-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:tJA/nCdr+Dz8jBifMJ1WTOJjYSCL4n6utDFSMgLxUgjRV8CEXYR
 9leqFu7ZjPa+NPgkUitJVFgm6ED/QWUlTkYvHzMxZCkQlqxwrrYugp/8UmAixkavh8yBaSL
 l25cBgGBUmQeP+L5+MNL31ndsfo0Y6clNoFNB6z+rotBAgntSO7WYQy/VNu/o6qET0zhFNd
 RI1WWm7xuWNtW8r033wCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5eG5dD2+jP8=:OkYSpk0r+NbWLJzaEmzoEa
 yKjdFl7uct8CaJ5c6MrLRwuX7qIFTxd9xs6rD07kUXnGdVy+9nyo9ztIdX4+hRduSiQfqWAtY
 kY1VEpBxuGAodEFsoY1oFNMuLZ8MgNfWkQuhWuNpvrn0OTXM4Y36f26CQnHc/Wqad8rk5Bai4
 9RMJrR5sHyAjpDJ0yOupYp7Q1+J7k3wYdgLl2tMw47IvAMdgaFSiNa4F6JJ0r6CFIJK0PFwT0
 9o3nJfkOgghWKcVc+GKm26P/lOUw5hkmEuOweIm3SoUu7b9xUPnGnfztFi4fvt/JIlcXoa9l1
 NWoi9sLun4LaswM/IWZHj99uFxYjmnU+ZSQr8NitnY+adj1+K+UuvOfbUdOiLPq7/1qhklIg/
 4EC+gZwYlY0+f+tScGIshxXThMExozuv8T0PgEtkbrlsZcsrjZoiNGe2vOpzeh+FPhSygTd5a
 Gt2+qg1gmvNKbjGpmRdbc3i7JbAH4X5gsuetfr6Eb7TliXqZBW+z1WEum+C10FFs5ysxcShVH
 mff9Wu+mEgQgPStwNNoGtwvzq61xLD/sJ0nL7Vw24j+mn2dAn/pcuOjkUXHBsmpbPvRQUZEJe
 u4vvdY2H/sTgXlOJV0vfPcjGN56KRjj3uHGPITj2UwKGDJFz9AzJJYLkCcm1HUKJgLcutVSiT
 fhNySeOGW1K/cSgpG3QmoRnCUxIuyOC1H0alqgXN2KJkiYAD/gHRHNBpl53Cu14Lhsi6BOk0e
 oIgWYvSdbr6nmIgw
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The check for an adjacent block is hard to read. So move it into a separate
inline function.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c     | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6759a62..9748044 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -189,6 +189,20 @@ cleanup_pagelistinfo(struct vchiq_pagelist_info *pagelistinfo)
 			  pagelistinfo->pagelist, pagelistinfo->dma_addr);
 }
 
+static inline bool
+is_adjacent_block(u32 *addrs, u32 addr, unsigned int k)
+{
+	u32 tmp;
+
+	if (!k)
+		return false;
+
+	tmp = (addrs[k - 1] & PAGE_MASK) +
+	      (((addrs[k - 1] & ~PAGE_MASK) + 1) << PAGE_SHIFT);
+
+	return tmp == (addr & PAGE_MASK);
+}
+
 /* There is a potential problem with partial cache lines (pages?)
  * at the ends of the block when reading. If the CPU accessed anything in
  * the same line (page?) then it may have pulled old data into the cache,
@@ -349,10 +363,7 @@ create_pagelist(char *buf, char __user *ubuf,
 		WARN_ON(len == 0);
 		WARN_ON(i && (i != (dma_buffers - 1)) && (len & ~PAGE_MASK));
 		WARN_ON(i && (addr & ~PAGE_MASK));
-		if (k > 0 &&
-		    ((addrs[k - 1] & PAGE_MASK) +
-		     (((addrs[k - 1] & ~PAGE_MASK) + 1) << PAGE_SHIFT))
-		    == (addr & PAGE_MASK))
+		if (is_adjacent_block(addrs, addr, k))
 			addrs[k - 1] += ((len + PAGE_SIZE - 1) >> PAGE_SHIFT);
 		else
 			addrs[k++] = (addr & PAGE_MASK) |
-- 
2.7.4

