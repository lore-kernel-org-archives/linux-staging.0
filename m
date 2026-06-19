Received: from v57.v51e342bd.use4.send.mailgun.net (v57.v51e342bd.use4.send.mailgun.net [69.72.42.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5363BE645
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.72.42.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781900199; cv=none; b=YTcFUA9yFMt56V1d5ZOsf5Cw26656OblSS/+vx3gV8UzsxFKPtSKlGcHzvgaPQEpU1mIEqxB4yznhI3uLv92RwC2wR3Ia5TWVlJJKYraBjoWc1KhMlO0ViV8RyoHweW/Y9mnD67RStpo9noS89PUFk/cjpA6Z6C+T++0Z91WSMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781900199; c=relaxed/simple;
	bh=yZ34Clu1gPuvFtThFDxA5Y2yOVyPqeiqBm+g9a39c9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWB5xZ/ujRx289A3QDUU5mTxTbUbz8FMOX9Aux50jkF9vRNtqe31YS7k9mkpeKhCZe/1Hvl6AKMfTeocioW3XBXuA5+ABzboigpoIej5mH8DtvbUnLdQ9lHe68onBvIobjOMwuENCme/JQ8iQnrQx/wzSf+pQPSD3GF9EdE1eGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kylejin.com; spf=pass smtp.mailfrom=kylejin.com; dkim=pass (1024-bit key) header.d=kylejin.com header.i=@kylejin.com header.b=mTMGiqTU; arc=none smtp.client-ip=69.72.42.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kylejin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylejin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kylejin.com header.i=@kylejin.com header.b="mTMGiqTU"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=kylejin.com; q=dns/txt; s=pic; t=1781900194; x=1781907394;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=Hciroa42oaoHKMBgBhwRzJXt9+6Y5u1eed/7vMr9NWo=;
 b=mTMGiqTU7GbvjeKUHxRK2CJTkjbQSCgXXT/K9skCbarEk1h+K8EghCdWtpFU6XZj1UhI/TP1yIYcz1DYKh1vyzXcf+jnvfLs3tFEpgmP/5MjOkelLndJ9IDnEgcOEz+e1LfSsGmf2gTD49OLyNewv/7Y3+6gtlavlIoGi36Vv8k=
X-Mailgun-Sid: WyIzZGNmMCIsImxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2IiwiZmYyZGE4ZSJd
Received: from ampere-a1.vcn05022301.oraclevcn.com (unknown [147.224.12.124]) by
 e3d870b472b01418d57d40ffe2a2b89346762891e9115f87a6bcaf4a979c433f with SMTP id
 6a35a3a2c1220a70ba8bc2e9 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 19 Jun 2026 20:16:34 GMT
X-Mailgun-Sending-Ip: 69.72.42.7
Sender: kj@kylejin.com
From: Kai Cheng Jin <kj@kylejin.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Kai Cheng Jin <kj@kylejin.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: add spaces around operators in rtl8723b_cmd.c
Date: Fri, 19 Jun 2026 13:15:58 -0700
Message-ID: <20260619201600.973619-1-kj@kylejin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajT4n4p7CKiApCPF@stanley.mountain>
References: <ajT4n4p7CKiApCPF@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces around arithmetic and bitwise operators to
follow kernel coding style, as reported by checkpatch.pl.

Signed-off-by: Kai Cheng Jin <kj@kylejin.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 88 ++++++++++----------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index c35c7f1c38ef..d92dde57b720 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -70,23 +70,23 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 			goto exit;
 
 		if (CmdLen <= 3)
-			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, CmdLen);
+			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, CmdLen);
 		else {
-			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
-			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
-/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
+			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, 3);
+			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer + 3, CmdLen - 3);
+/*			*(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
 		*(u8 *)(&h2c_cmd) |= ElementID;
 
 		if (CmdLen > 3) {
-			msgbox_ex_addr = REG_HMEBOX_EXT0_8723B + (h2c_box_num*RTL8723B_EX_MESSAGE_BOX_SIZE);
+			msgbox_ex_addr = REG_HMEBOX_EXT0_8723B + (h2c_box_num * RTL8723B_EX_MESSAGE_BOX_SIZE);
 			rtw_write32(padapter, msgbox_ex_addr, h2c_cmd_ex);
 		}
-		msgbox_addr = REG_HMEBOX_0 + (h2c_box_num*MESSAGE_BOX_SIZE);
+		msgbox_addr = REG_HMEBOX_0 + (h2c_box_num * MESSAGE_BOX_SIZE);
 		rtw_write32(padapter, msgbox_addr, h2c_cmd);
 
-		pHalData->LastHMEBoxNum = (h2c_box_num+1) % MAX_H2C_BOX_NUMS;
+		pHalData->LastHMEBoxNum = (h2c_box_num + 1) % MAX_H2C_BOX_NUMS;
 
 	} while (0);
 
@@ -139,9 +139,9 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	pframe += 2;
 	pktlen += 2;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
 		pktlen += cur_network->ie_length - sizeof(struct ndis_802_11_fix_ie);
-		memcpy(pframe, cur_network->ies+sizeof(struct ndis_802_11_fix_ie), pktlen);
+		memcpy(pframe, cur_network->ies + sizeof(struct ndis_802_11_fix_ie), pktlen);
 
 		goto _ConstructBeacon;
 	}
@@ -158,7 +158,7 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	/*  DS parameter set */
 	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pktlen);
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 		u32 ATIMWindow;
 		/*  IBSS Parameter Set... */
 		/* ATIMWindow = cur->configuration.ATIMWindow; */
@@ -324,7 +324,7 @@ void rtl8723b_set_rssi_cmd(struct adapter *padapter, u8 *param)
 {
 	u8 u1H2CRssiSettingParm[H2C_RSSI_SETTING_LEN] = {0};
 	u8 mac_id = *param;
-	u8 rssi = *(param+2);
+	u8 rssi = *(param + 2);
 	u8 uldl_state = 0;
 
 	SET_8723B_H2CCMD_RSSI_SETTING_MACID(u1H2CRssiSettingParm, mac_id);
@@ -343,7 +343,7 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	u8 PowerState = 0, awake_intvl = 1, byte5 = 0, rlbm = 0;
 
 	if (pwrpriv->dtim > 0 && pwrpriv->dtim < 16)
-		awake_intvl = pwrpriv->dtim+1;/* DTIM = (awake_intvl - 1) */
+		awake_intvl = pwrpriv->dtim + 1;/* DTIM = (awake_intvl - 1) */
 	else
 		awake_intvl = 3;/* DTIM =2 */
 
@@ -394,7 +394,7 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 			pmlmeext->DrvBcnTimeOut = 0xff;
 
 			for (i = 0; i < 9; i++) {
-				pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i]*100)/pmlmeext->bcn_cnt;
+				pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i] * 100) / pmlmeext->bcn_cnt;
 
 				ratio_20_delay += pmlmeext->bcn_delay_ratio[i];
 				ratio_80_delay += pmlmeext->bcn_delay_ratio[i];
@@ -493,7 +493,7 @@ static void rtl8723b_set_FwRsvdPagePkt(
 	pmlmeinfo = &pmlmeext->mlmext_info;
 
 	RsvdPageNum = BCNQ_PAGE_NUM_8723B + WOWLAN_PAGE_NUM_8723B;
-	MaxRsvdPageBufSize = RsvdPageNum*PageSize;
+	MaxRsvdPageBufSize = RsvdPageNum * PageSize;
 
 	pcmdframe = rtw_alloc_cmdxmitframe(pxmitpriv);
 	if (!pcmdframe)
@@ -515,18 +515,18 @@ static void rtl8723b_set_FwRsvdPagePkt(
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/* 3 (2) ps-poll */
 	RsvdPageLoc.LocPsPoll = TotalPageNum;
 	ConstructPSPoll(padapter, &ReservedPagePacket[BufIndex], &PSPollLength);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], PSPollLength, true, false, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], PSPollLength, true, false, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + PSPollLength);
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/* 3 (3) null data */
 	RsvdPageLoc.LocNullData = TotalPageNum;
@@ -537,13 +537,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		false, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], NullDataLength, false, false, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], NullDataLength, false, false, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + NullDataLength);
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/* 3 (5) Qos null data */
 	RsvdPageLoc.LocQosNull = TotalPageNum;
@@ -554,13 +554,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], QosNullLength, false, false, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], QosNullLength, false, false, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + QosNullLength);
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/* 3 (6) BT Qos null data */
 	RsvdPageLoc.LocBTQosNull = TotalPageNum;
@@ -571,13 +571,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], BTQosNullLength, false, true, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	TotalPacketLen = BufIndex + BTQosNullLength;
 
@@ -618,12 +618,12 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 
 		/*  We should set AID, correct TSF, HW seq enable before set JoinBssReport to Fw in 88/92C. */
 		/*  Suggested by filen. Added by tynli. */
-		rtw_write16(padapter, REG_BCN_PSR_RPT, (0xC000|pmlmeinfo->aid));
+		rtw_write16(padapter, REG_BCN_PSR_RPT, (0xC000 | pmlmeinfo->aid));
 
 		/*  set REG_CR bit 8 */
-		v8 = rtw_read8(padapter, REG_CR+1);
+		v8 = rtw_read8(padapter, REG_CR + 1);
 		v8 |= BIT(0); /*  ENSWBCN */
-		rtw_write8(padapter, REG_CR+1, v8);
+		rtw_write8(padapter, REG_CR + 1, v8);
 
 		/*  Disable Hw protection for a time which revserd for Hw sending beacon. */
 		/*  Fix download reserved page packet fail that access collision with the protection time. */
@@ -638,7 +638,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 			bRecover = true;
 
 		/*  To tell Hw the packet is not a real beacon frame. */
-		rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl & ~BIT(6));
+		rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl & ~BIT(6));
 		pHalData->RegFwHwTxQCtrl &= ~BIT(6);
 
 		/*  Clear beacon valid check bit. */
@@ -657,7 +657,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
@@ -680,14 +680,14 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 		/*  the beacon cannot be sent by HW. */
 		/*  2010.06.23. Added by tynli. */
 		if (bRecover) {
-			rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl | BIT(6));
+			rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl | BIT(6));
 			pHalData->RegFwHwTxQCtrl |= BIT(6);
 		}
 
 		/*  Clear CR[8] or beacon packet will not be send to TxBuf anymore. */
-		v8 = rtw_read8(padapter, REG_CR+1);
+		v8 = rtw_read8(padapter, REG_CR + 1);
 		v8 &= ~BIT(0); /*  ~ENSWBCN */
-		rtw_write8(padapter, REG_CR+1, v8);
+		rtw_write8(padapter, REG_CR + 1, v8);
 	}
 }
 
@@ -716,7 +716,7 @@ void rtl8723b_Add_RateATid(
 	u8 raid = arg[1];
 	u8 shortGI = arg[2];
 	u8 bw;
-	u32 mask = bitmap&0x0FFFFFFF;
+	u32 mask = bitmap & 0x0FFFFFFF;
 
 	psta = pmlmeinfo->FW_sta_info[mac_id].psta;
 	if (!psta)
@@ -805,7 +805,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 	PageSize = PAGE_SIZE_TX_8723B;
 
 	RsvdPageNum = BCNQ_PAGE_NUM_8723B;
-	MaxRsvdPageBufSize = RsvdPageNum*PageSize;
+	MaxRsvdPageBufSize = RsvdPageNum * PageSize;
 
 	pcmdframe = rtw_alloc_cmdxmitframe(pxmitpriv);
 	if (!pcmdframe)
@@ -826,7 +826,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		CurtPktPageNum += 1;
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/*  Jump to lastest page */
 	if (BufIndex < (MaxRsvdPageBufSize - PageSize)) {
@@ -843,7 +843,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		NULL,
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], BTQosNullLength, false, true, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
@@ -885,12 +885,12 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
 	/*  We should set AID, correct TSF, HW seq enable before set JoinBssReport to Fw in 88/92C. */
 	/*  Suggested by filen. Added by tynli. */
-	rtw_write16(padapter, REG_BCN_PSR_RPT, (0xC000|pmlmeinfo->aid));
+	rtw_write16(padapter, REG_BCN_PSR_RPT, (0xC000 | pmlmeinfo->aid));
 
 	/*  set REG_CR bit 8 */
-	val8 = rtw_read8(padapter, REG_CR+1);
+	val8 = rtw_read8(padapter, REG_CR + 1);
 	val8 |= BIT(0); /*  ENSWBCN */
-	rtw_write8(padapter,  REG_CR+1, val8);
+	rtw_write8(padapter,  REG_CR + 1, val8);
 
 	/*  Disable Hw protection for a time which revserd for Hw sending beacon. */
 	/*  Fix download reserved page packet fail that access collision with the protection time. */
@@ -906,7 +906,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
 	/*  To tell Hw the packet is not a real beacon frame. */
 	pHalData->RegFwHwTxQCtrl &= ~BIT(6);
-	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
+	rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
 
 	/*  Clear beacon valid check bit. */
 	rtw_hal_set_hwreg(padapter, HW_VAR_BCN_VALID, NULL);
@@ -919,11 +919,11 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 		DLBcnCount++;
 		do {
 			yield();
-/* 			mdelay(10); */
+/*			mdelay(10); */
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 	if (bcn_valid) {
@@ -945,11 +945,11 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 	/*  2010.06.23. Added by tynli. */
 	if (bRecover) {
 		pHalData->RegFwHwTxQCtrl |= BIT(6);
-		rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
+		rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
 	}
 
 	/*  Clear CR[8] or beacon packet will not be send to TxBuf anymore. */
-	val8 = rtw_read8(padapter, REG_CR+1);
+	val8 = rtw_read8(padapter, REG_CR + 1);
 	val8 &= ~BIT(0); /*  ~ENSWBCN */
-	rtw_write8(padapter, REG_CR+1, val8);
+	rtw_write8(padapter, REG_CR + 1, val8);
 }
-- 
2.54.0

