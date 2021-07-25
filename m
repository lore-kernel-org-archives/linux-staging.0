Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA90B6D0E
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 15:59:34 +0000 (UTC)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m7gXN-0000SM-56; Sun, 25 Jul 2021 17:59:33 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/18] staging: rtl8188eu: remove two write-only hal components
Date: Sun, 25 Jul 2021 17:58:55 +0200
Message-Id: <20210725155902.32433-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725155902.32433-1-martin@kaiser.cx>
References: <20210725155902.32433-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RegTxPause and RegBcnCtrlVal from struct hal_data_8188e are set but
never read. Remove them.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c      | 2 --
 drivers/staging/rtl8188eu/include/rtl8188e_hal.h | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 6af411e0c28e..62013999c569 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -563,8 +563,6 @@ static void _InitBeaconParameters(struct adapter *Adapter)
 	/*  beacause test chip does not contension before sending beacon. by tynli. 2009.11.03 */
 	usb_write16(Adapter, REG_BCNTCFG, 0x660F);
 
-	haldata->RegBcnCtrlVal = usb_read8(Adapter, REG_BCN_CTRL);
-	haldata->RegTxPause = usb_read8(Adapter, REG_TXPAUSE);
 	haldata->RegFwHwTxQCtrl = usb_read8(Adapter, REG_FWHW_TXQ_CTRL + 2);
 	haldata->RegReg542 = usb_read8(Adapter, REG_TBTT_PROHIBIT + 2);
 	haldata->RegCR_1 = usb_read8(Adapter, REG_CR + 1);
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
index e508b4b9ef7f..9aba67233c24 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
@@ -230,9 +230,6 @@ struct hal_data_8188e {
 	/* for host message to fw */
 	u8	LastHMEBoxNum;
 
-	u8	RegTxPause;
-	/*  Beacon function related global variable. */
-	u32	RegBcnCtrlVal;
 	u8	RegFwHwTxQCtrl;
 	u8	RegReg542;
 	u8	RegCR_1;
-- 
2.20.1

