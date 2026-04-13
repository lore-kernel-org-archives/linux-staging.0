Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAE73AE6E6
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075342; cv=none; b=lvyqw6JWp3mqk0mAhO92YGcvdz61YTOycJfl2DIBZXJ7V6yE9nJObboQ6zOG+xC+HYY+gRP0ptg5HzVvRd9TM7DKqpXIsemGqFovC+gx0rsivcI1dUh/3eo9hDhPvADbyYwFAxOyuBBPQ3eVh6m8hOJ9w8QlUOiOdAuFxpASEwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075342; c=relaxed/simple;
	bh=Lzy2UR7ragNrQgLJzLOFmbn+JRYcXrQ+80bKxfMzsWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DH7/cW8yJbXuia5DBEBHAVnfWCfq67krPkcCmatgBC+gg0FQT2vUTwcX4rfX4DV25aC5L4RVt4nWb6TItqPebiW9Ee6pYAbPehSfJXqYTvx05ZqpIt6SivRITaEZBT63m4I1AJj88YywF78M0GT5LjLhWiAMtc6WiC+0LKGS3WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m8f9mjYa; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m8f9mjYa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWFnbz3PXC8UikRqW7mpw27Jr+/URZ48PwSZbTVVfLY=;
	b=m8f9mjYaBS0FXE5JCd9jH/oGZABAgeEpFrgSdajSVrFCRI2Rn7elcv05DN8QHmZdCxDRhW
	1XFu+0GcrXKIWb+IckXMeeEDQ6PBvR+UkO6muP2GOvNx3hH1IqCzaPYHTI1NdmPJEFTqSr
	I5wXQLOssJOM3CiHaCWNG/8iXi9g758=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 05/11] staging: rtl8723bs: hal: align parameters with open parenthesis
Date: Mon, 13 Apr 2026 12:14:26 +0200
Message-ID: <20260413101432.158925-6-luka.gejak@linux.dev>
In-Reply-To: <20260413101432.158925-1-luka.gejak@linux.dev>
References: <20260413101432.158925-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Align function parameters with the open parenthesis in the hal directory
to adhere to the Linux kernel coding style. This resolves "Alignment
should match open parenthesis" warnings reported by checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 2 +-
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 2 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c  | 8 ++++----
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c  | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c  | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c  | 2 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c    | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3e34f97cfc6..87b07187efaf 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -1870,7 +1870,7 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
 			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 		) {
 			halbtc8723b1ant_ActionBtScoHidOnlyBusy(pBtCoexist,
-				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE);
+							       BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE);
 		} else {
 			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
 
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..9d82ccf6e138 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -566,7 +566,7 @@ static void halbtc8723b2ant_DacSwing(
 
 	if (!bForceExec) {
 		if ((pCoexDm->bPreDacSwingOn == pCoexDm->bCurDacSwingOn) &&
-			(pCoexDm->preDacSwingLvl == pCoexDm->curDacSwingLvl))
+		    (pCoexDm->preDacSwingLvl == pCoexDm->curDacSwingLvl))
 			return;
 	}
 	mdelay(30);
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 5a08a5e3be63..16006c74a4c3 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -222,7 +222,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
 			Final_CCK_Swing_Index = 0;
 
 		setIqkMatrix_8723B(pDM_Odm, Final_OFDM_Swing_Index, RFPath,
-			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
+				   pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
 			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
 
 		setCCKFilterCoefficient(pDM_Odm, Final_CCK_Swing_Index);
@@ -235,7 +235,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
 			pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = Final_OFDM_Swing_Index - PwrTrackingLimit_OFDM;
 
 			setIqkMatrix_8723B(pDM_Odm, PwrTrackingLimit_OFDM, RFPath,
-				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
+					   pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
 				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
 
 			pDM_Odm->Modify_TxAGC_Flag_PathA = true;
@@ -245,7 +245,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
 			pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = Final_OFDM_Swing_Index;
 
 			setIqkMatrix_8723B(pDM_Odm, 0, RFPath,
-				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
+					   pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
 				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
 
 			pDM_Odm->Modify_TxAGC_Flag_PathA = true;
@@ -253,7 +253,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
 			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, HT_MCS0_MCS7);
 		} else {
 			setIqkMatrix_8723B(pDM_Odm, Final_OFDM_Swing_Index, RFPath,
-				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
+					   pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
 				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
 
 			if (pDM_Odm->Modify_TxAGC_Flag_PathA) { /* If TxAGC has changed, reset TxAGC again */
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index a67a49288f4a..dd91ce3a8e37 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -426,7 +426,7 @@ void PHY_SetTxPowerIndexByRateSection(
 		u8 cckRates[]   = {MGN_1M, MGN_2M, MGN_5_5M, MGN_11M};
 
 		PHY_SetTxPowerIndexByRateArray(padapter, RFPath,
-					     pHalData->CurrentChannelBW,
+					       pHalData->CurrentChannelBW,
 					     Channel, cckRates,
 					     ARRAY_SIZE(cckRates));
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 0204a454c954..da87d2af8500 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -128,7 +128,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 	/* rtl8723b_query_rx_phy_status(precvframe, pphy_status); */
 	/* spin_lock_bh(&p_hal_data->odm_stainfo_lock); */
 	odm_phy_status_query(&p_hal_data->odmpriv, p_phy_info,
-			   (u8 *)pphy_status, &(pkt_info));
+			     (u8 *)pphy_status, &(pkt_info));
 	if (psta)
 		psta->rssi = pattrib->phy_info.RecvSignalPower;
 	/* spin_unlock_bh(&p_hal_data->odm_stainfo_lock); */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index f50726d2ed0c..fc075a4e146f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -232,7 +232,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 				/*  check xmit_buf size enough or not */
 				txlen = txdesc_size + rtw_wlan_pkt_size(pxmitframe);
 				if (!pxmitbuf ||
-					((_RND(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
+				    ((_RND(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
 					(k >= (rtw_hal_sdio_max_txoqt_free_space(padapter) - 1))
 				) {
 					if (pxmitbuf) {
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..3b4d036d2caa 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -743,7 +743,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	invalidate_cam_all(padapter);
 
 	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv.channel,
-		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSET_DONT_CARE);
+			    CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSET_DONT_CARE);
 
 	/*  Record original value for template. This is arough data, we can only use the data */
 	/*  for power adjust. The value can not be adjustde according to different power!!! */
-- 
2.53.0

