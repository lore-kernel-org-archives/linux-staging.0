Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8693FC3
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 13:40:39 +0000 (UTC)
Received: from dslb-178-004-203-016.178.004.pools.vodafone-ip.de ([178.4.203.16] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mRaa2-0001lQ-0u; Sat, 18 Sep 2021 15:40:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: do not write past the end of an array
Date: Sat, 18 Sep 2021 15:40:24 +0200
Message-Id: <20210918134024.23837-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f7b687d6b67e ("staging: r8188eu: remove NumTotalRFPath from struct
hal_data_8188e") removed a for loop around a block of code that is executed
only once when i == 0. However, without the for loop, i will never be set
to 0 before the code block is executed. i remains at 2, which is the final
value after the previous loop. This results in a write past the end of the
powerlevel and MCSBase arrays.

[   28.480809] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: rtl8188e_PHY_RF6052SetOFDMTxPower+0x124/0x128 [r8188eu]
[   28.493752] ---[ end Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: rtl8188e_PHY_RF6052SetOFDMTxPower+0x124/0x128 [r8188eu] ]---

Fix this by replacing i with 0 in the code block that used to be the body of
the loop. While at it, remove the powerlevel array that was just holding a
temporary value.

Tested with Edimax EW-7811Un V2 on an ARM32 embedded system.

Fixes: f7b687d6b67e ("staging: r8188eu: remove NumTotalRFPath from struct hal_data_8188e")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 2f16c0966973..b334864feffd 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -227,7 +227,7 @@ static void getpowerbase88e(struct adapter *Adapter, u8 *pPowerLevelOFDM,
 {
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
 	u32 powerBase0, powerBase1;
-	u8 i, powerlevel[2];
+	u8 i;
 
 	for (i = 0; i < 2; i++) {
 		powerBase0 = pPowerLevelOFDM[i];
@@ -238,12 +238,11 @@ static void getpowerbase88e(struct adapter *Adapter, u8 *pPowerLevelOFDM,
 
 	/* Check HT20 to HT40 diff */
 	if (pHalData->CurrentChannelBW == HT_CHANNEL_WIDTH_20)
-		powerlevel[i] = pPowerLevelBW20[i];
+		powerBase1 = pPowerLevelBW20[0];
 	else
-		powerlevel[i] = pPowerLevelBW40[i];
-	powerBase1 = powerlevel[i];
+		powerBase1 = pPowerLevelBW40[0];
 	powerBase1 = (powerBase1 << 24) | (powerBase1 << 16) | (powerBase1 << 8) | powerBase1;
-	*(MCSBase + i) = powerBase1;
+	*MCSBase = powerBase1;
 }
 
 static void get_rx_power_val_by_reg(struct adapter *Adapter, u8 Channel,
-- 
2.20.1

