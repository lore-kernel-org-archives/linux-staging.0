Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75BA3806A5
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050206; cv=none; b=KWu0JSOjKvA1jjDUuCeIsN9fAfIuUIIKiH2Gu+0msQaquFoOCOjTZRYSYfo9IcyQjmWofnt5vcdaAS+m3YSm0RNGhBvB+ams7yr4rMiF6X0wTN/Kv5njob8h+vdoawf2LRPgpyG7Uh+7jpQp3rrJCJhESatS/vIUthS6idSHZmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050206; c=relaxed/simple;
	bh=GywECaTVjet7aObPBOJ32BBbakuMq48hFNTSGbgQ6Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DGAnn4rgUglYmJ0kGQ+7hY3vmDZyBTm56ufkzhzMLzV6P1wsHLq16x65kWHcyrLOy4SXH95pBSWNgz9l4PppKm0TvNA2zd/U3OGLJ1DexIIxhdewwJlogv2o4aaUILDyj3rnKbDqaW7wNpP+a6WIsZhrV87W9BNsY7wITahi7u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9AvKddf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9AvKddf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so19637575e9.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 02:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773050203; x=1773655003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJpzXuJIH/wf0ZLIIWn6JqjJ4S7H1q/PXDwqXMZiNhM=;
        b=i9AvKddfE7kFY+cJtp50400eM4jUJeqLBN63fhRsK4ii8reaau5REOwAPcP2bYkAx4
         s2QebXDwUHzeGwfNPns1iX2pBmtBUJvIk6KmcAYwFABZNwMUJbHx7B+5NBPFSJ+uJvL0
         sXeff7Y43ZnVaUsChYPyxwQ5b2Sm/GoU1/cgz/sNv8tDAbbrrRCFzH/imHcbCStwS2TT
         RieCZGgZhKv2StkBeW/YxiHhQjEhze84cfb0pMRpbRykjVfR+40xeEWMW8QrCoWwvcbU
         eSOazO95NBQol/RJh/K+IJ4Ty3kQtb82Xx8p+O2jwToAhNLbrHwsWbntUE0SuF93+q29
         rgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050203; x=1773655003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJpzXuJIH/wf0ZLIIWn6JqjJ4S7H1q/PXDwqXMZiNhM=;
        b=ie1lOZFMmcx5KGXm0ddZOydqatRJ4QMRcyAfsjZTyNmOZddxj9KDTYziWxXwSwwXJ7
         MPmaWa33jYUya6pL9YDNw9F+nrT4jM3lxgK3NGpkw5AaT7016lg0v53ZkYxiTRuknJXN
         mvIp+KCrQj05preFBAbmyRIUTNQyTRKIuGrCne5gDoIb85iD05PJ3m4BefH1SkEc/TNO
         EJJGFn1AFOmiyrpDmINzVlhncMH285hI0+C+8nezDHBnKkOxaKKn5MSTlOW87SEKpRuw
         S7JyJgEjjImMxAZkuFnb0Wf47Fe20RDnYFN7xahl5gCYMJoVZregSdRaznIo7r2zshs0
         2VSw==
X-Gm-Message-State: AOJu0YwHn6OzGDxkWGmkuqSTqJKsEL7ZJ2Y6gEicmSvq+bzer169thAd
	ysLd7rItfDnPw52SnRBe4uTrLawBRVNf/YQnIzhdnqgxoUeA4d2DNXIL8LSOPmsz
X-Gm-Gg: ATEYQzyLQ15IeK39NR/MN/mTbU2SnHUi7pjUqXVx5XICG/aeosFWxlVKDlD6BAyDHn8
	uoIlKZbkFYEok9SUVXXCjsiQd/rYVnLlq0AVjZTbVhTTFcOeZhKJ4NEvja2IdwGt50uI9Ig/AQV
	SQj0FZgxmEeYFTjHX4JBcycOkouHQkDD6gfQWjSwsXlHlWKLPVn+ndEW2uS1cZDPDuFBCYJqb/V
	tGh9yogLJtDi7KibX2fevlQBztv5A9Z9zX4PjOZPTkH163qknsiB1THZ5OTAMcbqBo/kDkY8VLi
	AdSGQmwAIW7QSDC8Bf/NjFOR7K14cDAmj9zc+egiUhLbLl+6YDdnnjdblj0gaRXTFJg3rD6ZR0i
	zHKo5Ms0IbyZDSU/ntmN4J5iW11NhYvDhtV8KDXedAmEkP3ReobL7mELGKtc5EjaXznLLFyeVot
	qRnYoWh+nJ0ZScIK+PplkFBYSGMsIssl/xPlAfXPXyFx4vEvGwDqFOtVFSLN8eG10DloimGAGV2
	kgeBAai/vvh6ude5w==
X-Received: by 2002:a05:600c:3b01:b0:485:353f:c651 with SMTP id 5b1f17b1804b1-485353fc9b9mr72508195e9.22.1773050203051;
        Mon, 09 Mar 2026 02:56:43 -0700 (PDT)
Received: from localhost.localdomain ([37.60.47.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853afb2011sm70586785e9.15.2026.03.09.02.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:56:42 -0700 (PDT)
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
Subject: [PATCH v3] staging: rtl8723bs: rename supportRateNum to support_rate_num
Date: Mon,  9 Mar 2026 09:55:43 +0000
Message-ID: <20260309095543.14495-1-esty5664@gmail.com>
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
v1 -> v2: Rebase onto staging-next
v2 -> v3: Add missing changelog
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

