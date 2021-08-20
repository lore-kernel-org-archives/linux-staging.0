Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F2C72
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 09:08:58 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UkJj5EK_1629450521;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UkJj5EK_1629450521)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 20 Aug 2021 17:08:42 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH linux-next] staging: r8188eu: remove unneeded semicolon
Date: Fri, 20 Aug 2021 17:08:25 +0800
Message-Id: <1629450505-28247-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Eliminate the following coccicheck warning:
./drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c:73:66-67: Unneeded
semicolon
./drivers/staging/r8188eu/hal/rtl8188e_hal_init.c:2225:68-69: Unneeded
semicolon
./drivers/staging/r8188eu/core/rtw_xmit.c:615:75-76: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c         | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 4172352..8693c7c 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -612,7 +612,7 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	else
 		stainfo = rtw_get_stainfo(&padapter->stapriv, &pattrib->ra[0]);
 
-	hw_hdr_offset = TXDESC_SIZE + (pxmitframe->pkt_offset * PACKET_OFFSET_SZ);;
+	hw_hdr_offset = TXDESC_SIZE + (pxmitframe->pkt_offset * PACKET_OFFSET_SZ);
 
 	if (pattrib->encrypt == _TKIP_) {/* if (psecuritypriv->dot11PrivacyAlgrthm == _TKIP_PRIVACY_) */
 		/* encode mic code */
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index e27d896..d225858 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -2222,7 +2222,7 @@ void Hal_ReadAntennaDiversity88E(struct adapter *pAdapter, u8 *PROMContent, bool
 		if (registry_par->antdiv_cfg == 2) { /*  2:By EFUSE */
 			pHalData->AntDivCfg = (PROMContent[EEPROM_RF_BOARD_OPTION_88E] & 0x18) >> 3;
 			if (PROMContent[EEPROM_RF_BOARD_OPTION_88E] == 0xFF)
-				pHalData->AntDivCfg = (EEPROM_DEFAULT_BOARD_OPTION & 0x18) >> 3;;
+				pHalData->AntDivCfg = (EEPROM_DEFAULT_BOARD_OPTION & 0x18) >> 3;
 		} else {
 			pHalData->AntDivCfg = registry_par->antdiv_cfg;  /*  0:OFF , 1:ON, 2:By EFUSE */
 		}
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index b4b3c02..2442867 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -70,7 +70,7 @@ void update_recvframe_attrib_88e(struct recv_frame *precvframe, struct recv_stat
 	pattrib = &precvframe->attrib;
 	memset(pattrib, 0, sizeof(struct rx_pkt_attrib));
 
-	pattrib->crc_err = (u8)((le32_to_cpu(report.rxdw0) >> 14) & 0x1);;/* u8)prxreport->crc32; */
+	pattrib->crc_err = (u8)((le32_to_cpu(report.rxdw0) >> 14) & 0x1);/* u8)prxreport->crc32; */
 
 	/*  update rx report to recv_frame attribute */
 	pattrib->pkt_rpt_type = (u8)((le32_to_cpu(report.rxdw3) >> 14) & 0x3);/* prxreport->rpt_sel; */
-- 
1.8.3.1

