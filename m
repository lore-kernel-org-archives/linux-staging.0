Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F6385503
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442519; cv=none; b=tzAxyxriq3YNjNdcOTEV3ybSldct2l77qR5xjMA42u7FVF/Qe0lXQYk5sf/kz7nRYv3gyU/lUJ4yjfyAQywHrKpC6ogH5bhFoKkZkAzqTOL+fSF5dzNUw1oLfrJqyDS45+VvFp80YIOx3sC++idqs+qpzM0A/C/JUegI+bVkzPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442519; c=relaxed/simple;
	bh=zhzt+tcs1c6k6aHKKnua7gPqbP5iNkIXyItVfhYEwG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+r2X/cz8m+rlWWTQrx7Y6yvsHODjTHf01F+kErloYoTxpr71FdwFNnfAnhdM8cpvNvRMmXiTfkBWDY7gmZcYj/nJdHLMdc2W2vzbxpX2kKUXEcFNNwl2PBFNFo8mofdcEKipKClY3ZExDO6nWBbX6tof1GuyFQla3MiAABWdZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/z9jSJ/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/z9jSJ/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-480706554beso48494775e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 01:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772442517; x=1773047317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tk7cZzZHw7d4HQ5vUcAe2rmSSAuSnIzR303wBwBYKhU=;
        b=i/z9jSJ/YXoltOPmP4a1AhQEYaXM13QsE0ZejlGWnpExSjygbZGqsu9j7OJprlzzXW
         p/WGQF9VWHKpEYt4oH+Mkf7Ng8KiTi0SA7+Bdq+gRGhurOrvJQstLKIDTeLPFD8+ZmTm
         mbXCkxvgABYKvkPdR+kfchU07dZhMxeTXYVec4TSbLkOprg8KmlPi/QgR26gTw9Y9BrB
         A5Oxk9YosSdyk2nMvbMu8oXRS8zG2CMA54PQcyuKyJ/eQX5qN06n3Uw9H3gW3pRCeRrG
         hS7noNZp5+ax5gWmLfK4Q4xYSRlssxYgQ6iuTRm9ud04f3I/Gl/do5wQV9iYTzOk+tWR
         cK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442517; x=1773047317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tk7cZzZHw7d4HQ5vUcAe2rmSSAuSnIzR303wBwBYKhU=;
        b=FUUx2EQy08qMN3XP6hG4HBJSRIRwH5dXw3OAAvFXu+S082cqsNB15MsdgYsvPoLsb/
         0Nax7KeOrliBrFKO7OQ5ttmwBB+H0sGBnzfEynG5baNCUVDF/IYJ0g56FD4ikj9zqXtA
         lUQKe8mNHkJV3aBTphKuyCziI+4XCzcrsAMeK+dT18E5JYUjSPxCpjZtznsPrP9JZGzY
         V2Ixkv26iKgafg0pVUvmYg+e/bCBbIxuRxq4qX6kJPgW9VpGvD7/hwiMq7ZFiAX2bNKd
         k6PJQR69kyS+PxwhskXermzJ02BpyeEE3FsBk/InHtEMdyacRsmX11oVnkYtmbKohYsY
         seKA==
X-Gm-Message-State: AOJu0YwU65K6sPDKvD58XEmmiYPjHG0vg2aC4Rewu1DddMFdI+Ucqr4V
	IUyx3ywXFtlySivKKFQFzQc6X7zABOSQkmZ0A9+vEZz190lpwCDG0kZV
X-Gm-Gg: ATEYQzwsTkCN7SDcYnVc4LDgX6rM55vllaGddG6V5V6+9j3raNaeHyBcjmpSFaFw1aF
	RXkTYbvHd11JySb6DfQv2FTpguPmSSQdLQ8/bqtYEG1x4p9BUqzBtuGomh/tvGs0ADTX21phEvo
	KDx5Xe+GbqETZe7CuiE+sI2KUkjSewGHMfC9/a5yhd2A3SzmQWgEwo9FxpetWX8lzqfSi98Ou0n
	UZnJtWVc1cqq4OiBSS7790lR+0FT0hQNcaBuUm6x5Vq0SrwM8vdWDJfRP1fQekQm27J5RQvg8Bk
	hhtepd0HP9hTub0wZMK1xFNkUtmEjrX8hagLg/xFC74NOA5IeVMnGPhjoqeiLY7B1G1e4ux5OfE
	WyXltFGCd8BRV+GQjxfO88dMV4dPFgJion4aY0VPuT3Ye98PYR/II+LMkFsvWnXI12pxxh5hNeq
	Crmk9+RIpx+llrddEuvnAGVAb8ZYVJE98dQCeEmzVmuR2WsHVyRQ1yKgH4oinXzCRflJS5CCtDe
	2dH3x3lbO4xkiH2vg==
X-Received: by 2002:a05:600c:46d5:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-483c9bbbe77mr181785815e9.20.1772442516359;
        Mon, 02 Mar 2026 01:08:36 -0800 (PST)
Received: from localhost.localdomain ([37.60.47.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3ce8fsm273856135e9.4.2026.03.02.01.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:08:35 -0800 (PST)
From: Esther Zilberberg <esty5664@gmail.com>
To: gregkh@linuxfoundation.org,
	arthur.stupa@gmail.com,
	jannik@jrehkemper.de,
	william.hansen.baird@gmail.com,
	kaizhetan@yahoo.com,
	s9430939@naver.com,
	straube.linux@gmail.com,
	ysinghcin@gmail.com,
	kees@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Esther Zilberberg <esty5664@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename supportRateNum to support_rate_num
Date: Mon,  2 Mar 2026 09:08:03 +0000
Message-ID: <20260302090803.4796-1-esty5664@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename supportRateNum to support_rate_num to fix warning
reported by checkpatch.pl.

Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  8 ++++----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b1f20aa81efb..8c76f2c5d282 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -935,7 +935,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
 	int		i, ie_len, wpa_ie_len, left;
 	unsigned char supportRate[16];
-	int					supportRateNum;
+	int					support_rate_num;
 	unsigned short		status = WLAN_STATUS_SUCCESS;
 	unsigned short		frame_type, ie_offset = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1022,7 +1022,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if (!p) {
 		/*  use our own rate set as statoin used */
 		/* memcpy(supportRate, AP_BSSRATE, AP_BSSRATE_LEN); */
-		/* supportRateNum = AP_BSSRATE_LEN; */
+		/* support_rate_num = AP_BSSRATE_LEN; */
 
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
@@ -1031,25 +1031,25 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			ie_len = sizeof(supportRate);
 
 		memcpy(supportRate, p+2, ie_len);
-		supportRateNum = ie_len;
+		support_rate_num = ie_len;
 
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
 				pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 		if (p) {
 
-			if (supportRateNum + ie_len <= sizeof(supportRate)) {
-				memcpy(supportRate+supportRateNum, p+2, ie_len);
-				supportRateNum += ie_len;
+			if (support_rate_num + ie_len <= sizeof(supportRate)) {
+				memcpy(supportRate + support_rate_num, p + 2, ie_len);
+				support_rate_num += ie_len;
 			}
 		}
 	}
 
 	/* todo: mask supportRate between AP & STA -> move to update raid */
-	/* get_matched_rate(pmlmeext, supportRate, &supportRateNum, 0); */
+	/* get_matched_rate(pmlmeext, supportRate, &support_rate_num, 0); */
 
 	/* update station supportRate */
-	pstat->bssratelen = supportRateNum;
-	memcpy(pstat->bssrateset, supportRate, supportRateNum);
+	pstat->bssratelen = support_rate_num;
+	memcpy(pstat->bssrateset, supportRate, support_rate_num);
 	update_basic_rate_table_soft_ap(pstat->bssrateset, pstat->bssratelen);
 
 	/* check RSN/WPA/WPS */
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 3242978da36c..ee06c5888942 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1593,7 +1593,7 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 {
 	unsigned int	ie_len;
 	struct ndis_80211_var_ie *pIE;
-	int	supportRateNum = 0;
+	int	support_rate_num = 0;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
@@ -1604,11 +1604,11 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 		return _FAIL;
 
 	memcpy(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates, pIE->data, ie_len);
-	supportRateNum = ie_len;
+	support_rate_num = ie_len;
 
 	pIE = (struct ndis_80211_var_ie *)rtw_get_ie(pvar_ie, WLAN_EID_EXT_SUPP_RATES, &ie_len, var_ie_len);
-	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) - supportRateNum))
-		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates + supportRateNum), pIE->data, ie_len);
+	if (pIE && (ie_len <= sizeof(pmlmeinfo->FW_sta_info[cam_idx].SupportedRates) - support_rate_num))
+		memcpy((pmlmeinfo->FW_sta_info[cam_idx].SupportedRates + support_rate_num), pIE->data, ie_len);
 
 	return _SUCCESS;
 }
-- 
2.43.0

