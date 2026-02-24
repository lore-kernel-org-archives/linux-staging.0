Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5373A0B21
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939701; cv=none; b=odXM16VZyi0FwRv/b+zyY64ehdzdrrH1IjT5iVLdapvfmgcCjO0R+NWFWlqD3TxTej1idAIClqF8yIm2L39Vw5ZseDP13Wc8ND/GplR3+YGMUAZda0UfQgoFBRf8hkYYPC/rmwaVEkiYImjzwEooGSsE8kwL75c9YLKTv1wY9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939701; c=relaxed/simple;
	bh=yU50tRxsXuNbm4x/I13rcnog05Codnrx8SE4sLSOtvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbpLkFD5DawsVWKjt006/eAbJm3fQ34ibJ9e1pBNuAODgfFV8mMgDUQPqrU3N1p/pwfD5SFM/cmB3fzChYxyV4SxlirBLjGrgEn+qUl5b2veZrZ6svDq8wbwFgM5902Ae90cvWHY7S+HR3U88aX4nqKONGDK2jNIl9R1hFCrtG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oVuKvpJ5; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oVuKvpJ5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpL9fU4jhvAueQMoCa7CSDm2DBMkzE+QwIwUbe3o5Ks=;
	b=oVuKvpJ57iFMx+FBuBsRN/mEkSi26piRLrQag7i7734CNXFEn0M6DBquo+Lov2acEMu1y2
	/wsXI3qYp6gAJBq3js4EJnAARvruVoOf1o4Z0r732XsySQXhnxSWEkwnbi1LLrG2GsLyfE
	vvCoQ00d2wix/rG6SQYyClJA2pDVtto=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 11/21] staging: rtl8723bs: hal: fix line lengths in rtl8723b_cmd.c
Date: Tue, 24 Feb 2026 14:27:38 +0100
Message-ID: <20260224132748.12336-12-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 103 +++++++++++++++----
 1 file changed, 83 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..92951ba4561e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -154,14 +154,28 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	/* below for ad-hoc mode */
 
 	/*  SSID */
-	pframe = rtw_set_ie(pframe, WLAN_EID_SSID, cur_network->ssid.ssid_length, cur_network->ssid.ssid, &pktlen);
+	{
+		uint ssid_len = cur_network->ssid.ssid_length;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, ssid_len,
+				    cur_network->ssid.ssid, &pktlen);
+	}
 
 	/*  supported rates... */
 	rate_len = rtw_get_rateset_len(cur_network->supported_rates);
-	pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pktlen);
+	{
+		uint len = (rate_len > 8) ? 8 : rate_len;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, len,
+				    cur_network->supported_rates, &pktlen);
+	}
 
 	/*  DS parameter set */
-	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pktlen);
+	{
+		unsigned char *ds = (unsigned char *)&cur_network->configuration.ds_config;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, ds, &pktlen);
+	}
 
 	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
 		u32 ATIMWindow;
@@ -176,8 +190,12 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 
 
 	/*  EXTERNDED SUPPORTED RATE */
-	if (rate_len > 8)
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pktlen);
+	if (rate_len > 8) {
+		u8 *ext_rates = cur_network->supported_rates + 8;
+
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    rate_len - 8, ext_rates, &pktlen);
+	}
 
 
 	/* todo:HT for adhoc */
@@ -309,10 +327,12 @@ void rtl8723b_set_FwMediaStatusRpt_cmd(struct adapter *padapter, u8 mstatus, u8
 	SET_8723B_H2CCMD_MSRRPT_PARM_MACID(u1H2CMediaStatusRptParm, macid);
 	SET_8723B_H2CCMD_MSRRPT_PARM_MACID_END(u1H2CMediaStatusRptParm, macid_end);
 
-	FillH2CCmd8723B(padapter, H2C_8723B_MEDIA_STATUS_RPT, H2C_MEDIA_STATUS_RPT_LEN, u1H2CMediaStatusRptParm);
+	FillH2CCmd8723B(padapter, H2C_8723B_MEDIA_STATUS_RPT,
+			H2C_MEDIA_STATUS_RPT_LEN, u1H2CMediaStatusRptParm);
 }
 
-void rtl8723b_set_FwMacIdConfig_cmd(struct adapter *padapter, u8 mac_id, u8 raid, u8 bw, u8 sgi, u32 mask)
+void rtl8723b_set_FwMacIdConfig_cmd(struct adapter *padapter, u8 mac_id,
+					u8 raid, u8 bw, u8 sgi, u32 mask)
 {
 	u8 u1H2CMacIdConfigParm[H2C_MACID_CFG_LEN] = {0};
 
@@ -386,7 +406,8 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	SET_8723B_H2CCMD_PWRMODE_PARM_SMART_PS(u1H2CPwrModeParm, pwrpriv->smart_ps);
 	SET_8723B_H2CCMD_PWRMODE_PARM_RLBM(u1H2CPwrModeParm, rlbm);
 	SET_8723B_H2CCMD_PWRMODE_PARM_BCN_PASS_TIME(u1H2CPwrModeParm, awake_intvl);
-	SET_8723B_H2CCMD_PWRMODE_PARM_ALL_QUEUE_UAPSD(u1H2CPwrModeParm, padapter->registrypriv.uapsd_enable);
+	SET_8723B_H2CCMD_PWRMODE_PARM_ALL_QUEUE_UAPSD(u1H2CPwrModeParm,
+						      padapter->registrypriv.uapsd_enable);
 	SET_8723B_H2CCMD_PWRMODE_PARM_PWR_STATE(u1H2CPwrModeParm, PowerState);
 	SET_8723B_H2CCMD_PWRMODE_PARM_BYTE5(u1H2CPwrModeParm, byte5);
 	if (psmode != PS_MODE_ACTIVE) {
@@ -402,7 +423,9 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 			pmlmeext->DrvBcnTimeOut = 0xff;
 
 			for (i = 0; i < 9; i++) {
-				pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i]*100)/pmlmeext->bcn_cnt;
+				u32 cnt = pmlmeext->bcn_delay_cnt[i];
+
+				pmlmeext->bcn_delay_ratio[i] = (cnt * 100) / pmlmeext->bcn_cnt;
 
 				ratio_20_delay += pmlmeext->bcn_delay_ratio[i];
 				ratio_80_delay += pmlmeext->bcn_delay_ratio[i];
@@ -429,7 +452,9 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 		pmlmeext->DrvBcnTimeOut =7;
 
 		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
-			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
+			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] =
+				BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |
+				((pmlmeext->DrvBcnTimeOut<<4)&0xf0);
 */
 
 	}
@@ -528,7 +553,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 	/* 3 (2) ps-poll */
 	RsvdPageLoc.LocPsPoll = TotalPageNum;
 	ConstructPSPoll(padapter, &ReservedPagePacket[BufIndex], &PSPollLength);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], PSPollLength, true, false, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, PSPollLength,
+					  true, false, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + PSPollLength);
 
@@ -545,7 +575,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		false, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], NullDataLength, false, false, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, NullDataLength,
+					  false, false, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + NullDataLength);
 
@@ -562,7 +597,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], QosNullLength, false, false, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, QosNullLength,
+					  false, false, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + QosNullLength);
 
@@ -579,7 +619,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, BTQosNullLength,
+					  false, true, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
@@ -656,6 +701,8 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 		DLBcnCount = 0;
 		poll = 0;
 		do {
+			bool stop;
+
 			/*  download rsvd page. */
 			rtl8723b_set_FwRsvdPagePkt(padapter, 0);
 			DLBcnCount++;
@@ -663,11 +710,16 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				yield();
 				/* mdelay(10); */
 				/*  check rsvd page download OK. */
-				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
+				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID,
+						  (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+				stop = padapter->bSurpriseRemoved ||
+				       padapter->bDriverStopped;
+			} while (!bcn_valid && (poll % 10) != 0 && !stop);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			if (stop)
+				break;
+		} while (!bcn_valid && DLBcnCount <= 100);
 
 		if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
 		} else {
@@ -850,7 +902,12 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		NULL,
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	{
+		u8 *desc = &ReservedPagePacket[BufIndex - TxDescLen];
+
+		rtl8723b_fill_fake_txdesc(padapter, desc, BTQosNullLength,
+					  false, true, false);
+	}
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
@@ -922,6 +979,8 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 	DLBcnCount = 0;
 	poll = 0;
 	do {
+		bool stop;
+
 		SetFwRsvdPagePkt_BTCoex(padapter);
 		DLBcnCount++;
 		do {
@@ -930,8 +989,12 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			stop = padapter->bSurpriseRemoved || padapter->bDriverStopped;
+		} while (!bcn_valid && (poll % 10) != 0 && !stop);
+
+		if (stop)
+			break;
+	} while (!bcn_valid && (DLBcnCount <= 100));
 
 	if (bcn_valid) {
 		struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
-- 
2.53.0

