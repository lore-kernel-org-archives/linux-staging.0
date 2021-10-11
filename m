Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C682C96
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 20:12:30 +0000 (UTC)
Received: from dslb-188-097-046-226.188.097.pools.vodafone-ip.de ([188.97.46.226] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ma1eo-0004mk-2E; Mon, 11 Oct 2021 22:12:22 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/8] staging: r8188eu: remove dm_CheckStatistics
Date: Mon, 11 Oct 2021 22:11:52 +0200
Message-Id: <20211011201159.10252-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011201159.10252-1-martin@kaiser.cx>
References: <20211011201159.10252-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dm_CheckStatistics function is empty. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index f99a8526fe18..af8b2752b664 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -8,10 +8,6 @@
 #include "../include/drv_types.h"
 #include "../include/rtl8188e_hal.h"
 
-static void dm_CheckStatistics(struct adapter *Adapter)
-{
-}
-
 /*  Initialize GPIO setting registers */
 static void dm_InitGPIOSetting(struct adapter *Adapter)
 {
@@ -136,13 +132,6 @@ void rtl8188e_HalDmWatchDog(struct adapter *Adapter)
 	if (Adapter->wdinfo.p2p_ps_mode)
 		fw_ps_awake = false;
 
-	if (hw_init_completed && ((!fw_cur_in_ps) && fw_ps_awake)) {
-		/*  Calculate Tx/Rx statistics. */
-		dm_CheckStatistics(Adapter);
-
-
-	}
-
 	/* ODM */
 	if (hw_init_completed) {
 		struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
-- 
2.20.1

