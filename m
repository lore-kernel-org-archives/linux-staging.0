Received: from k52.kb8c70eb.use4.send.mailgun.net (k52.kb8c70eb.use4.send.mailgun.net [204.220.184.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F76C35959
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 00:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.220.184.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781828773; cv=none; b=ZZPlsDAxUTH/y2hFgG0ub6Yw/igS/e8M1nwnPvh5ROe0lwVj80yiWjwL28RZrk9K7epT+QqQYtfABnz3YffDJNoHgh4l9wg0iiz9d+7TU0uvWw27o77Jhz9gM7eGn33UACttrtClm9cwWbumKsPC+IWDE6/cifOCnQHqWXfY8rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781828773; c=relaxed/simple;
	bh=ue9jcmm26RFno8pPz2xKt0tuWcLeHQKQHEsS8cfgVqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPAkzlkxMQyFXelmoejB+xxifbTXMxo4OD0qjogXr1Rsqb7JUsb5KBjyKI53cS1PLJzWnc8JD/dcoAsJFhnX4/mi/ily0mTlModOCXqDuskCUyVIhmbPj/MKDNdHbMdjg6qCtkPuSYVh9ygCL3yRg+HRokWiMaQScszz0npBCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kylejin.com; spf=pass smtp.mailfrom=kylejin.com; dkim=pass (1024-bit key) header.d=kylejin.com header.i=@kylejin.com header.b=QCe1PjYF; arc=none smtp.client-ip=204.220.184.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kylejin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylejin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kylejin.com header.i=@kylejin.com header.b="QCe1PjYF"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=kylejin.com; q=dns/txt; s=pic; t=1781828770; x=1781835970;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=W0Gmwj+PFEPMikxn15lOCTwDU7HAy7IPRFgndhL5JVc=;
 b=QCe1PjYF4iLm4kzMrCixYlAdyDgxiwlt7XPbOiRK+/cA0/uam0rchfF14c2q3W+zTmK1uVKN5ZPIX/L/o5Mx0QSLWULfJoh99wenGn7Ipo2FK5ehEkYaKNiJF7LTCfEClB19iZ9orGn2NTlKqcgW0I7pbtuopN30o5ry6lVZtX0=
X-Mailgun-Sid: WyIzZGNmMCIsImxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2IiwiZmYyZGE4ZSJd
Received: from ampere-a1.vcn05022301.oraclevcn.com (unknown [147.224.12.124]) by
 c78aea662c08e8b333a660c0c4a8455be1b9332f0f531d795c482dedefcd0866 with SMTP id
 6a348ca2df91a8deb18f0597 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 19 Jun 2026 00:26:10 GMT
X-Mailgun-Sending-Ip: 204.220.184.52
Sender: kj@kylejin.com
From: Kai Cheng Jin <kj@kylejin.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kai Cheng Jin <kj@kylejin.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in rtl8723b_cmd.c
Date: Thu, 18 Jun 2026 17:25:43 -0700
Message-ID: <20260619002543.992270-1-kj@kylejin.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces around arithmetic and bitwise operators,
remove unnecessary parentheses after address-of operators, and
clean up extra blank lines, as reported by checkpatch.pl.

Signed-off-by: Kai Cheng Jin <kj@kylejin.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 137 +++++++++----------
 1 file changed, 66 insertions(+), 71 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index c35c7f1c38ef..6589d0a20122 100644
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
 
@@ -103,17 +103,17 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	u32 rate_len, pktlen;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
-	fctrl = &(pwlanhdr->frame_control);
+	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;
 
 	eth_broadcast_addr(pwlanhdr->addr1);
-	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 	ether_addr_copy(pwlanhdr->addr3, get_my_bssid(cur_network));
 
 	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
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
@@ -156,9 +156,9 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pktlen);
 
 	/*  DS parameter set */
-	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pktlen);
+	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&cur_network->configuration.ds_config, &pktlen);
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 		u32 ATIMWindow;
 		/*  IBSS Parameter Set... */
 		/* ATIMWindow = cur->configuration.ATIMWindow; */
@@ -180,20 +180,19 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 		return;
 
 	*pLength = pktlen;
-
 }
 
 static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 {
 	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
 	/*  Frame control. */
-	fctrl = &(pwlanhdr->frame_control);
+	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;
 	SetPwrMgt(fctrl);
 	SetFrameSubType(pframe, WIFI_PSPOLL);
@@ -202,10 +201,10 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	SetDuration(pframe, (pmlmeinfo->aid | 0xc000));
 
 	/*  BSSID. */
-	ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
+	ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network));
 
 	/*  TA. */
-	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 
 	*pLength = 16;
 }
@@ -226,8 +225,8 @@ static void ConstructNullFunctionData(
 	u32 pktlen;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
@@ -239,21 +238,21 @@ static void ConstructNullFunctionData(
 	switch (cur_network->network.infrastructure_mode) {
 	case Ndis802_11Infrastructure:
 		SetToDs(fctrl);
-		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
-		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network));
+		ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 		ether_addr_copy(pwlanhdr->addr3, StaAddr);
 		break;
 	case Ndis802_11APMode:
 		SetFrDs(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
-		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)));
-		ether_addr_copy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)));
+		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&pmlmeinfo->network));
+		ether_addr_copy(pwlanhdr->addr3, myid(&padapter->eeprompriv));
 		break;
 	case Ndis802_11IBSS:
 	default:
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
-		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
-		ether_addr_copy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)));
+		ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
+		ether_addr_copy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network));
 		break;
 	}
 
@@ -324,7 +323,7 @@ void rtl8723b_set_rssi_cmd(struct adapter *padapter, u8 *param)
 {
 	u8 u1H2CRssiSettingParm[H2C_RSSI_SETTING_LEN] = {0};
 	u8 mac_id = *param;
-	u8 rssi = *(param+2);
+	u8 rssi = *(param + 2);
 	u8 uldl_state = 0;
 
 	SET_8723B_H2CCMD_RSSI_SETTING_MACID(u1H2CRssiSettingParm, mac_id);
@@ -343,7 +342,7 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	u8 PowerState = 0, awake_intvl = 1, byte5 = 0, rlbm = 0;
 
 	if (pwrpriv->dtim > 0 && pwrpriv->dtim < 16)
-		awake_intvl = pwrpriv->dtim+1;/* DTIM = (awake_intvl - 1) */
+		awake_intvl = pwrpriv->dtim + 1;/* DTIM = (awake_intvl - 1) */
 	else
 		awake_intvl = 3;/* DTIM =2 */
 
@@ -394,7 +393,7 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 			pmlmeext->DrvBcnTimeOut = 0xff;
 
 			for (i = 0; i < 9; i++) {
-				pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i]*100)/pmlmeext->bcn_cnt;
+				pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i] * 100) / pmlmeext->bcn_cnt;
 
 				ratio_20_delay += pmlmeext->bcn_delay_ratio[i];
 				ratio_80_delay += pmlmeext->bcn_delay_ratio[i];
@@ -408,12 +407,10 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 				/* reset adaptive_early_32k cnt */
 				pmlmeext->bcn_delay_cnt[i] = 0;
 				pmlmeext->bcn_delay_ratio[i] = 0;
-
 			}
 
 			pmlmeext->bcn_cnt = 0;
 			pmlmeext->adaptive_tsf_done = true;
-
 		}
 
 /* offload to FW if fw version > v15.10
@@ -423,7 +420,6 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
 			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
 */
-
 	}
 
 	hal_btcoex_RecordPwrMode(padapter, u1H2CPwrModeParm, H2C_PWRMODE_LEN);
@@ -450,7 +446,6 @@ void rtl8723b_set_FwPsTuneParam_cmd(struct adapter *padapter)
 
 void rtl8723b_set_FwPwrModeInIPS_cmd(struct adapter *padapter, u8 cmd_param)
 {
-
 	FillH2CCmd8723B(padapter, H2C_8723B_FWLPS_IN_IPS_, 1, &cmd_param);
 }
 
@@ -493,7 +488,7 @@ static void rtl8723b_set_FwRsvdPagePkt(
 	pmlmeinfo = &pmlmeext->mlmext_info;
 
 	RsvdPageNum = BCNQ_PAGE_NUM_8723B + WOWLAN_PAGE_NUM_8723B;
-	MaxRsvdPageBufSize = RsvdPageNum*PageSize;
+	MaxRsvdPageBufSize = RsvdPageNum * PageSize;
 
 	pcmdframe = rtw_alloc_cmdxmitframe(pxmitpriv);
 	if (!pcmdframe)
@@ -515,18 +510,18 @@ static void rtl8723b_set_FwRsvdPagePkt(
 
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
@@ -537,13 +532,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
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
@@ -554,13 +549,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
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
@@ -571,13 +566,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
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
 
@@ -605,8 +600,8 @@ static void rtl8723b_set_FwRsvdPagePkt(
 void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	bool bcn_valid = false;
 	u8 DLBcnCount = 0;
 	u32 poll = 0;
@@ -618,12 +613,12 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 
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
@@ -638,7 +633,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 			bRecover = true;
 
 		/*  To tell Hw the packet is not a real beacon frame. */
-		rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl & ~BIT(6));
+		rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl & ~BIT(6));
 		pHalData->RegFwHwTxQCtrl &= ~BIT(6);
 
 		/*  Clear beacon valid check bit. */
@@ -657,7 +652,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
@@ -680,14 +675,14 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
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
 
@@ -710,13 +705,13 @@ void rtl8723b_Add_RateATid(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct sta_info *psta;
 	u8 mac_id = arg[0];
 	u8 raid = arg[1];
 	u8 shortGI = arg[2];
 	u8 bw;
-	u32 mask = bitmap&0x0FFFFFFF;
+	u32 mask = bitmap & 0x0FFFFFFF;
 
 	psta = pmlmeinfo->FW_sta_info[mac_id].psta;
 	if (!psta)
@@ -805,7 +800,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 	PageSize = PAGE_SIZE_TX_8723B;
 
 	RsvdPageNum = BCNQ_PAGE_NUM_8723B;
-	MaxRsvdPageBufSize = RsvdPageNum*PageSize;
+	MaxRsvdPageBufSize = RsvdPageNum * PageSize;
 
 	pcmdframe = rtw_alloc_cmdxmitframe(pxmitpriv);
 	if (!pcmdframe)
@@ -826,7 +821,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		CurtPktPageNum += 1;
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/*  Jump to lastest page */
 	if (BufIndex < (MaxRsvdPageBufSize - PageSize)) {
@@ -843,7 +838,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		NULL,
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], BTQosNullLength, false, true, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
@@ -885,12 +880,12 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
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
@@ -906,7 +901,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
 	/*  To tell Hw the packet is not a real beacon frame. */
 	pHalData->RegFwHwTxQCtrl &= ~BIT(6);
-	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
+	rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
 
 	/*  Clear beacon valid check bit. */
 	rtw_hal_set_hwreg(padapter, HW_VAR_BCN_VALID, NULL);
@@ -919,11 +914,11 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
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
@@ -945,11 +940,11 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
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

