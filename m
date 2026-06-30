Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA2397E73
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837227; cv=none; b=LnrdgNPexeY5ubKjlmd9ZBv9zTGA5mZmvo5at7BCEcXvCtgPosvUwuU8oshNklgzSu5OWNjkHqGpfIJnU7C+IinyDEMmraPwpPUBdsmkIZg+dDj+COo44efAtwUubcDvQZdnQCu5tm0C9XaINh3dSKYwNjiO0I2brdxdOFBOzGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837227; c=relaxed/simple;
	bh=2KYkBx9qqadEAFaTlLoa47VkYHp2OrKnsWYmUszc+io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUBNB/agae1XeNYP0HGdJRXx9uuY4OCMfCMGX7UaVM2QF+lGTYDAtdcHxLGuG4KTnAH/G93+jeFAmi4NhFhdJDDO5QJEiOrI3yKy2nGxc3BmP5BdV6qtHz9ms9kaba4WStOkHIpO+4ttByO+oc1xJb0/8kmHV0YxgzxfdrkQxbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=iYtz/KrK; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="iYtz/KrK"
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4gqTHF5sTGz9sqg;
	Tue, 30 Jun 2026 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1782837225; bh=UsUOBBgFai+emsxUhoUH8+FBjzL+1GuzIJDIKnGySAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iYtz/KrKyl2INIzqK0urCy+N1zI8e8aBd2dfYbk+hzoQVlKxRGpzyCif6bOQoDvtr
	 MKqpHJohZKoMuQPSlii8DNlE4XOSGEJzPK8RQCkYQSPyULbCEd42g7LiqffQ5lQare
	 PXbcI39ZYByiWUQt7dfq4C582WZwxZqTVVDTvKco=
X-Riseup-User-ID: 2542D3FC469774BFF79E84FEC2A33B337E81472702F48C9CB5F7B34CBFDB68D5
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4gqTHF1qNpz5vZJ;
	Tue, 30 Jun 2026 16:33:45 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH 2/6] staging: rtl8723bs: correct binary operator style in rtl8723bs_cmd.c
Date: Tue, 30 Jun 2026 17:33:12 +0100
Message-ID: <20260630163316.1128319-3-agarrigues@riseup.net>
In-Reply-To: <20260630163316.1128319-1-agarrigues@riseup.net>
References: <20260630163316.1128319-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spaces around binary operators to improve readability.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 84 ++++++++++----------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 13d6052a7347..b99a6a384495 100644
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
+			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, 3);
+			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer + 3, CmdLen - 3);
 /* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
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
@@ -485,7 +485,7 @@ static void rtl8723b_set_FwRsvdPagePkt(
 	pmlmeinfo = &pmlmeext->mlmext_info;
 
 	RsvdPageNum = BCNQ_PAGE_NUM_8723B + WOWLAN_PAGE_NUM_8723B;
-	MaxRsvdPageBufSize = RsvdPageNum*PageSize;
+	MaxRsvdPageBufSize = RsvdPageNum * PageSize;
 
 	pcmdframe = rtw_alloc_cmdxmitframe(pxmitpriv);
 	if (!pcmdframe)
@@ -507,18 +507,18 @@ static void rtl8723b_set_FwRsvdPagePkt(
 
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
@@ -529,13 +529,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
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
@@ -546,13 +546,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
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
@@ -563,13 +563,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
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
 
@@ -610,12 +610,12 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 
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
@@ -630,7 +630,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 			bRecover = true;
 
 		/*  To tell Hw the packet is not a real beacon frame. */
-		rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl & ~BIT(6));
+		rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl & ~BIT(6));
 		pHalData->RegFwHwTxQCtrl &= ~BIT(6);
 
 		/*  Clear beacon valid check bit. */
@@ -649,7 +649,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
@@ -672,14 +672,14 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
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
 
@@ -708,7 +708,7 @@ void rtl8723b_Add_RateATid(
 	u8 raid = arg[1];
 	u8 shortGI = arg[2];
 	u8 bw;
-	u32 mask = bitmap&0x0FFFFFFF;
+	u32 mask = bitmap & 0x0FFFFFFF;
 
 	psta = pmlmeinfo->FW_sta_info[mac_id].psta;
 	if (!psta)
@@ -797,7 +797,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 	PageSize = PAGE_SIZE_TX_8723B;
 
 	RsvdPageNum = BCNQ_PAGE_NUM_8723B;
-	MaxRsvdPageBufSize = RsvdPageNum*PageSize;
+	MaxRsvdPageBufSize = RsvdPageNum * PageSize;
 
 	pcmdframe = rtw_alloc_cmdxmitframe(pxmitpriv);
 	if (!pcmdframe)
@@ -818,7 +818,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		CurtPktPageNum += 1;
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/*  Jump to lastest page */
 	if (BufIndex < (MaxRsvdPageBufSize - PageSize)) {
@@ -835,7 +835,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		NULL,
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], BTQosNullLength, false, true, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
@@ -877,12 +877,12 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
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
@@ -898,7 +898,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
 	/*  To tell Hw the packet is not a real beacon frame. */
 	pHalData->RegFwHwTxQCtrl &= ~BIT(6);
-	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
+	rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
 
 	/*  Clear beacon valid check bit. */
 	rtw_hal_set_hwreg(padapter, HW_VAR_BCN_VALID, NULL);
@@ -915,7 +915,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 	if (bcn_valid) {
@@ -937,11 +937,11 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
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

