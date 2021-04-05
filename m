Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19145F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 17:13:13 +0000 (UTC)
Received: from dslb-188-096-137-079.188.096.pools.vodafone-ip.de ([188.96.137.79] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lTSWO-0004zD-Kb; Mon, 05 Apr 2021 18:56:16 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: rtl8723bs: remove unused dvobj_priv members
Date: Mon,  5 Apr 2021 18:48:55 +0200
Message-Id: <20210405164855.30264-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

InterfaceNumber und NumInterfaces in struct dvobj_priv are not used.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index a454a6390537..cec8d5ac0e2e 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -295,10 +295,6 @@ struct dvobj_priv {
 	struct cam_ctl_t cam_ctl;
 	struct cam_entry_cache cam_cache[TOTAL_CAM_ENTRY];
 
-	/* For 92D, DMDP have 2 interface. */
-	u8 InterfaceNumber;
-	u8 NumInterfaces;
-
 	/* In /Out Pipe information */
 	int	RtInPipe[2];
 	int	RtOutPipe[4];
-- 
2.20.1

