Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A741347BA9
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364522; cv=none; b=aHepe3yqe8D9XCgMcfd6Nwd3/K6LHw/vjCL6KV0o/oNLhwPJ6WWL6oAi9V2bxtdz1ZnSgQ5SfbdPH/wOw6QHwpaC+hvaTqRV35ioNx1tS2RHuhS00iomHs18Ltfaf8L8nji9iI6V0Mcsn75Aty5fKQ1WD9tSaZM34XFqsfs2TSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364522; c=relaxed/simple;
	bh=bYPip1vgC7wJ7cS6vh4x0R9WeJDmhQ7nN41z1s8VP8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5zqXqQUeD/0JRcIfnFXTBSbX9QTUqeT75r7wueS7mkXPdcUtPkxmdK0SNwq/H15RSVYoArfegMy9ftDEyobGj4+pO/x1qgE0CP2DcGBtXZ9zUEIj470lhDVaCSXApENGk0yS1HzrVzqijkl4Iszga2OrOZNIr1Q2ptU8pf8ndQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAtJyCnZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAtJyCnZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4362d4050c1so79896f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364520; x=1770969320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5V58EnH+IXkjtbytVCMCEgw7QXNaZq6DFNz2iVM+7JU=;
        b=lAtJyCnZGQb4vY9pRKz2iZmICCpHn8geigPu4hK+YARgSlVqIlOMRMRaZAIiVNnkAb
         EWnzo1u+0h4kjvdmDlv9QHHkjk1pRcaHph4Hw9lV6EJb/8sg8UgcNgL2kQ6ZiVfn5Gr9
         4NmguWyhLUOZq1KsjnvYTBp3L4UoM8qayVyzdBvEYcAz90YXmkXrSRLRP3j/SWuJ1byw
         8CSCJxoHQgx2to8Q6DtH8YR0aYwWDJ6wsgs9meZWkf5JCcnkkJBUafYpeOKrIq7PwG5j
         rjQG3/MgWo/PIk3iAec4UfQjrzB6cL7f3TxD+eiBkb3mioxX1MSRHSKMnYItzCYvUppX
         yQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364520; x=1770969320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5V58EnH+IXkjtbytVCMCEgw7QXNaZq6DFNz2iVM+7JU=;
        b=Ee9oM5uKvbo30CmiPcD7TI/BFraCDYP+0hCL22+EctK3MDcTJ2v9WeWScpFiKf326t
         KTaTLVXKqxj5Dd4pdqFTD30B6lKxA21Hwwn2OJRY12VqWg9XTtAhnaNE8aZULuUsWldp
         4Z0ixmPrev5BWGOwieVM2Wv0vhqVaDtP6JL1gnLiN2LBwZXfsYSyYHiNgErqJdxoH2MZ
         wyFewV6Bh403eS+fOSqofdldu+Ms3+Jw9OUHcmSlksEz6QpM0pJD0H9U+zBqizqMD7V3
         JGnHEx73RiJ5LJP8jjDwhjE1KrnujJObNQe+oVAw+HiSb/NKfYBtb01O7eS5TInXpB8K
         Y9cA==
X-Forwarded-Encrypted: i=1; AJvYcCUlvjOFujKCTrXHrrDWQWx9b5wAdNQpPSfd8gzlI3eGRfli6rlqL2YtcH+iCp20vmjhtl+DkENuWd+dc5OU@lists.linux.dev
X-Gm-Message-State: AOJu0YyTUZXvouRgKbGnGY4orCah6AaRsZl6lu1Ao0RZ2xaq3yHsW4/Y
	T3nchsUGofjy9wjH0wHKjiFsdNMUHMnZ6++IysI1dQdVTLeFg0gWF2Q/jHq3sac=
X-Gm-Gg: AZuq6aIqS4hv2xZAnuVSNiRr+K2C1lVTL83YYzksZGp6OqTlE7w/IxIb0+0PUsuIksL
	nPmp7mjWbKoYer6WWS1FTS2itSeGtwn0oPwVcNrWLWy0ErPA2+ozqyBqDqSq9rDRaLPcGRZvLwX
	RqbgUaJb3MVXXC4naQrAjS1DTSDwaMpvcjxLKgV3K6gC3Vn983TlKIDqEVEwX64lPHVMDnpc3Lw
	PRUvLWdBoW95bWCG27ibVie69p0yhWtm3Og66rZk6chhomp0Yp0wQIvdRO37WzKiDwU6/asCz6S
	uXjbKXqJyiZDBWnpEEbo9IJ+ccW4G2QlgkmAoA6UGdbQADbFgOsu57ASUmW34ya4QiIGo5PP3AI
	npSlFk/f/RLCWdlH69zkntJMc0f3OTXLZPumaJLG673gYpjngHEfSy3j/V8EBRb2QAFDTfSRAIY
	x9w5fpZqUMRFlFpwa1ueWM0axOyrZZ69FgoUrAbrbwr5Motr0XY6/XEuWXfs91lYY=
X-Received: by 2002:a05:6000:2681:b0:435:a4a9:6f67 with SMTP id ffacd0b85a97d-4362938feb7mr3039350f8f.42.1770364519609;
        Thu, 05 Feb 2026 23:55:19 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:18 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 16/26] staging: rtl8723bs: hal: fix line lengths in rtl8723b_cmd.c
Date: Fri,  6 Feb 2026 08:54:29 +0100
Message-ID: <20260206075439.103287-17-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.52.0

