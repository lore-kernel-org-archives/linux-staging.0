Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0F6D0E
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 15:59:38 +0000 (UTC)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m7gXR-0000SM-Ca; Sun, 25 Jul 2021 17:59:37 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 16/18] staging: rtl8188eu: simplify path_adda_on
Date: Sun, 25 Jul 2021 17:59:00 +0200
Message-Id: <20210725155902.32433-16-martin@kaiser.cx>
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

path_adda_on's is2t parameter is always false.
Remove some code that would be called only for is2t == true.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/phy.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/phy.c b/drivers/staging/rtl8188eu/hal/phy.c
index 62f979ceadc6..faa94dc7190c 100644
--- a/drivers/staging/rtl8188eu/hal/phy.c
+++ b/drivers/staging/rtl8188eu/hal/phy.c
@@ -711,19 +711,13 @@ static void reload_mac_registers(struct adapter *adapt, const u32 *mac_reg,
 	usb_write32(adapt, mac_reg[i], backup[i]);
 }
 
-static void path_adda_on(struct adapter *adapt, const u32 *adda_reg,
-			 bool is_path_a_on, bool is2t)
+static void path_adda_on(struct adapter *adapt, const u32 *adda_reg, bool is_path_a_on)
 {
 	u32 path_on;
 	u32 i;
 
-	if (!is2t) {
-		path_on = 0x0bdb25a0;
-		phy_set_bb_reg(adapt, adda_reg[0], bMaskDWord, 0x0b1b25a0);
-	} else {
-		path_on = is_path_a_on ? 0x04db25a4 : 0x0b1b25a4;
-		phy_set_bb_reg(adapt, adda_reg[0], bMaskDWord, path_on);
-	}
+	path_on = 0x0bdb25a0;
+	phy_set_bb_reg(adapt, adda_reg[0], bMaskDWord, 0x0b1b25a0);
 
 	for (i = 1; i < IQK_ADDA_REG_NUM; i++)
 		phy_set_bb_reg(adapt, adda_reg[i], bMaskDWord, path_on);
@@ -870,7 +864,7 @@ static void phy_iq_calibrate(struct adapter *adapt, s32 result[][8],
 				    dm_odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 	}
 
-	path_adda_on(adapt, adda_reg, true, false);
+	path_adda_on(adapt, adda_reg, true);
 	if (t == 0)
 		dm_odm->RFCalibrateInfo.bRfPiEnable = (u8)phy_query_bb_reg(adapt, rFPGA0_XA_HSSIParameter1,
 									   BIT(8));
-- 
2.20.1

