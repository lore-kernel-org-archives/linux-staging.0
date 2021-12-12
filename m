Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E73068
	for <linux-staging@lists.linux.dev>; Sun, 12 Dec 2021 18:58:55 +0000 (UTC)
Received: from dslb-188-104-058-180.188.104.pools.vodafone-ip.de ([188.104.58.180] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mwU3a-0001zY-T0; Sun, 12 Dec 2021 19:58:46 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/3] staging: r8188eu: clean up rtl8188e_sreset_linked_status_check
Date: Sun, 12 Dec 2021 19:58:33 +0100
Message-Id: <20211212185833.22000-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211212185833.22000-1-martin@kaiser.cx>
References: <20211212185833.22000-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the rtl8188e_sreset_linked_status_check, which has just
been moved to rtw_mlme_ext.

Don't initialise variables to 0 if the first access sets a new value.

Check the value of fw_status only once.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 15a443b9bc6d..8e04238fb5fc 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -7161,20 +7161,19 @@ static u8 chk_ap_is_alive(struct adapter *padapter, struct sta_info *psta)
 
 static void rtl8188e_sreset_linked_status_check(struct adapter *padapter)
 {
-	u32 rx_dma_status = 0;
-	u8 fw_status = 0;
-	rx_dma_status = rtw_read32(padapter, REG_RXDMA_STATUS);
+	u32 rx_dma_status =  rtw_read32(padapter, REG_RXDMA_STATUS);
+	u8 fw_status;
+
 	if (rx_dma_status != 0x00) {
 		DBG_88E("%s REG_RXDMA_STATUS:0x%08x\n", __func__, rx_dma_status);
 		rtw_write32(padapter, REG_RXDMA_STATUS, rx_dma_status);
 	}
+
 	fw_status = rtw_read8(padapter, REG_FMETHR);
-	if (fw_status != 0x00) {
-		if (fw_status == 1)
-			DBG_88E("%s REG_FW_STATUS (0x%02x), Read_Efuse_Fail !!\n", __func__, fw_status);
-		else if (fw_status == 2)
-			DBG_88E("%s REG_FW_STATUS (0x%02x), Condition_No_Match !!\n", __func__, fw_status);
-	}
+	if (fw_status == 1)
+		DBG_88E("%s REG_FW_STATUS (0x%02x), Read_Efuse_Fail !!\n", __func__, fw_status);
+	else if (fw_status == 2)
+		DBG_88E("%s REG_FW_STATUS (0x%02x), Condition_No_Match !!\n", __func__, fw_status);
 }
 
 void linked_status_chk(struct adapter *padapter)
-- 
2.20.1

