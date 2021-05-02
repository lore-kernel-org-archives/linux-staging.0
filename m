Received: from h04.kommunity.net (h04.kommunity.net [138.201.86.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B1572
	for <linux-staging@lists.linux.dev>; Sun,  2 May 2021 21:09:17 +0000 (UTC)
Received: from notebook.fritz.box (p4fc26c70.dip0.t-ipconnect.de [79.194.108.112])
	by h04.kommunity.net (Postfix) with ESMTPSA id 86AC5F804E1;
	Sun,  2 May 2021 23:09:15 +0200 (CEST)
Authentication-Results: h04.kommunity.net;
	spf=pass (sender IP is 79.194.108.112) smtp.mailfrom=alec@vc-celle.de smtp.helo=notebook.fritz.box
Received-SPF: pass (h04.kommunity.net: connection is authenticated)
From: Alexander Vorwerk <alec@vc-celle.de>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexander Vorwerk <alec@vc-celle.de>
Subject: [PATCH 2/2] staging: vt6655: remove multiple assignment
Date: Sun,  2 May 2021 23:08:26 +0200
Message-Id: <20210502210826.10323-3-alec@vc-celle.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210502210826.10323-1-alec@vc-celle.de>
References: <20210502210826.10323-1-alec@vc-celle.de>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

removing a multiple assignment coding style issue
reported by checkpatch.pl.

Signed-off-by: Alexander Vorwerk <alec@vc-celle.de>
---
 drivers/staging/vt6655/device_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 2e768181fa6a..3d664b87a3cc 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -715,7 +715,9 @@ static int device_init_td1_ring(struct vnt_private *priv)
 
 	if (i > 0)
 		priv->apTD1Rings[i - 1].next_desc = cpu_to_le32(priv->td1_pool_dma);
-	priv->apTailTD[1] = priv->apCurrTD[1] = &priv->apTD1Rings[0];
+
+	priv->apTailTD[1] = &priv->apTD1Rings[0];
+	priv->apCurrTD[1] = &priv->apTD1Rings[0];
 
 	return 0;
 
-- 
2.17.1

