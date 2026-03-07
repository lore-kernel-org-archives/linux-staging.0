Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427F30F808
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 23:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772927128; cv=none; b=FlvjNWhF/nSddbv1p4EMJPPaw/lwXSmOPEAtfCOVO62+4xWJccdNwRmB8Pr61cpur1cbbEjVIsFwrxVdY65zOO85+tHlEOYtfFRZhQm2lmffpRtlE8+io9IrTCPAORjgTKemiPBZfQrwR/j2WlHfMLViiF/FIHaUYyMfx4qh/n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772927128; c=relaxed/simple;
	bh=/WRUyswJ8DVVO4VAWuzQMVIcdKrxGoZGjGHsZdCV0I0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VyzYn0aUTvhvtSclMBmH9UInIFVqrjVR3MoEWzBHEusTd2y+2jAI4JEJY+aRrERIGJ5dOeHbtEJSOHVoc+env3xRPBOnRrVJfwsHkobB2idmc9HYgXm31ROZ7OvZV6zHtk7ids/cayBNXYznB+MuuNR5Uj25JceA7VifvlGwAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XB7VXfEe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XB7VXfEe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so9641515e9.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 15:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772927124; x=1773531924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWzd7e8ynCPqKOVhA4L5aVt0vnwqgW1iTp91DNqZGuU=;
        b=XB7VXfEefIPRB+axaZhVGbrqBOdBhKGAXc5+VfurF7x60ioHq+hf6L40VxBtAabEIB
         VcEl9/bID8K2uVQzeYm8d/A2huD5MoJ61oldaGDN/yfLoic13BrxFE8Scx+WwHdUf1yK
         YB3E0/0BYEgPxIBL+maKDMv4sKf42ahEAg3F3DJBYGF7CPvaOzKMKNjahQagnF4Kcv1Z
         AYfrR0/8Txfb9SIuFQ2JIn1pZPkCguuUYTNF661dkCTHeXfmSvU+QdIkuwGyP+p4tnTb
         jIhd7F6Pa0Q82anNCmNu+QDK5p/OEVvqSdqPKZzUYiptMQnrgGbKiRZ5ORH63FrJyIe3
         waRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772927124; x=1773531924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWzd7e8ynCPqKOVhA4L5aVt0vnwqgW1iTp91DNqZGuU=;
        b=k57SXVwkFHmrgIB9ggvjRS51DUeQzZ/EBVu5qgouS/UhpxeuQvNCZVjGELM8nFR2X8
         eBXUmPoacC50+cP7cRCLvXDuzhgEFPVxM+P0an41B9IWFIoX6Aa/7dHO3jqx4a82G6fX
         lDkstjQgxUVh3p/9uJBE2iGWN3/MXTwJMju65Dhn9py5hezJyoXdaU85Va2mTNpyU5iR
         2tPaRLIYE+bm3XsfX/9zXpjdVinbvH2XTmo26ELgoeJPmw0TxrolIJQcahpMbZJZWOBd
         xi6zXhTKuY+zNHquroHRSfFCxToQ8t7g70en15vvRYq5YXZ4Y6EY4Qhkyrc4upl24kru
         LlcQ==
X-Gm-Message-State: AOJu0YyfJ3GXGJz4oEcbq7rTPecEGajRKnF1bEnBphipgyBit1yqEy4W
	/9Z3EUzRKA0r/fnguSYoAsZvSoqZBnn8IjdXA1hj16WnCDchE5UX3uif
X-Gm-Gg: ATEYQzxoaGoNZVnZTilWoIWiTvCsqucHxDblrK7ZUrtEL026AxCw+R2zzON2YNIjuh+
	A01b094uSlZFB3CXpWzVySCACa5Pw06a1lhwVXNzObuXyD4MdDT6pUK7QIvbPBpsllMYTeAnzoQ
	wsFT7L2m0Id4o2kM7DEoFnPQAzHOsqqE1ANN8l269BNN9kaYZImRVmSpP5TG2RU+XNk8piSdDbB
	Tx8pkaazYYYMKGev/i1BdU+vBZb5P9H5pnlaWL9tDNtHttzGVMTcCT6YF00FHiOCWuTK9TsqCsC
	ZXZHqZSVNDGPI0Rch/jhgQaprKVk+4VplkngHmiwZMG5LUEw2oIzt7l2fYlYM4WgvlMxOOREKsM
	kO0a8i6vaexHyOPpcKGFy6Z6ba7MzqL542UDRqP+Be9W4mUmTg6tASg/PJRxi3YfR1Mnl/r40yW
	OEs47girtKH8fOxPDJSXUSrXqaW0aMaYxnP78qSMHWnckal0W6PKeonJl5Zss3e5a5RofaCdKQU
	V8vjcD0JlXBefUlFg==
X-Received: by 2002:a05:600c:45d1:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-485269791b5mr113525375e9.32.1772927124441;
        Sat, 07 Mar 2026 15:45:24 -0800 (PST)
Received: from localhost.localdomain ([37.60.47.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853044d849sm105307755e9.11.2026.03.07.15.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 15:45:24 -0800 (PST)
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
Subject: [PATCH v2] staging: rtl8723bs: rename supportRateNum to support_rate_num
Date: Sat,  7 Mar 2026 23:44:30 +0000
Message-ID: <20260307234430.5439-1-esty5664@gmail.com>
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
index a631fe323157..cc197b3bb195 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -937,7 +937,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	int		i, ie_len, left;
 	u8 wpa_ie_len;
 	unsigned char supportRate[16];
-	int					supportRateNum;
+	int					support_rate_num;
 	unsigned short		status = WLAN_STATUS_SUCCESS;
 	unsigned short		frame_type, ie_offset = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1024,7 +1024,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if (!p) {
 		/*  use our own rate set as statoin used */
 		/* memcpy(supportRate, AP_BSSRATE, AP_BSSRATE_LEN); */
-		/* supportRateNum = AP_BSSRATE_LEN; */
+		/* support_rate_num = AP_BSSRATE_LEN; */
 
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
@@ -1033,25 +1033,25 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
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
index cffb1a9d36fa..6a7c09db4cd9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1595,7 +1595,7 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 {
 	unsigned int	ie_len;
 	struct ndis_80211_var_ie *pIE;
-	int	supportRateNum = 0;
+	int	support_rate_num = 0;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
@@ -1606,11 +1606,11 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
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

