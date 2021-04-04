Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7991470
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:36 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id o20-20020a05600c4fd4b0290114265518afso1660183wmq.4
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTpgTYAuNOGpQA/JBeXTXo9cQF6qwIy+jwlVbtJcu90=;
        b=qQbl4UI2W6jGE73wKsgB8ldVfdbJRQAqsnirW/uLq08nZykavlZcHyyjLRe9Pw8VSY
         P+D9kYyavbuCNfh5BI29geSdEyjDxK4vvbotG2EqkhXAzWz24dkKtGxbfTM6OQPeDtPR
         9eBk6l0vbBKbWHsdbeEFJpoyYDv6LLG+90Fdb5Jf6xhpXN2ADXkR4x2IfquCDOQ383Pa
         cg4QSE+N0q4OZi8PbbRFpeXgQbTjggNlEqfkJyaq0tdGFw82xQ50RTl04pqzwf/LpBWJ
         vBhR+/pR94KWpb0JOotclnXlqEUKkvmA0RorRMHTzcUFVCBXaMR1bC1B4rLw40XMTM/G
         IvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTpgTYAuNOGpQA/JBeXTXo9cQF6qwIy+jwlVbtJcu90=;
        b=V0Ho1VuKM79WwGRbztDeDSuYRPK80RljGustE9rWy12J6/jP0oBGfXZHeCy+kiQ0aB
         DEbIBdZfNtuEmvdqI8JPVQx3xhg6fWj3gaAXFMIE1LGs89nIttK1PVJC4BttwQ3RBcZd
         MF3bLSsSVNn1cTFGmelsLtJREKmLV9EQQnq5XHmdK6oyUiKt+gObmUZ5A1JQHQDv/4d/
         ypi1Icuuzdc3I/bLnSUqVmEEsKc0XCPswgYS8dd6UgWiWw45fFT6GvesTQEgi8mbzYRD
         ulPMmNKFLKK5MqjwqA4U4izggum22XTD0gYpknB+KNBS8uE09ZyfIvzfFOYgQRfT7BYw
         7IwQ==
X-Gm-Message-State: AOAM532gXe6VnI7rvCx59tCUVPC+T478Ieid1k8w4upvc984SE7fRipw
	H/znFSMAJijaW9rFj996gE8=
X-Google-Smtp-Source: ABdhPJylwUfzLolwvPSxED3UgM/vGhBaOewbtknc65icueDhBZay/jiGP1xEGK8qePdOaF9VTn20Zg==
X-Received: by 2002:a05:600c:35c1:: with SMTP id r1mr21499668wmq.143.1617545435085;
        Sun, 04 Apr 2021 07:10:35 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id k127sm2975533wmf.19.2021.04.04.07.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:34 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 27/30] staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_wlan_util.c
Date: Sun,  4 Apr 2021 16:09:43 +0200
Message-Id: <406adfd834b55ea5694dfb3c33c36fe0754edbb3.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all of the RT_TRACE logs in the core/rtw_wlan_util.c file as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged. Moreover it relies on an unneeded
private log level tracing which overrides the in-kernel public one,
so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 24 ++++---------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 760b0ea4e9bd..f6a7993005ab 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1334,11 +1334,6 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	memcpy(bssid->Ssid.Ssid, (p + 2), ssid_len);
 	bssid->Ssid.SsidLength = ssid_len;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s bssid.Ssid.Ssid:%s bssid.Ssid.SsidLength:%d "
-				"cur_network->network.Ssid.Ssid:%s len:%d\n", __func__, bssid->Ssid.Ssid,
-				bssid->Ssid.SsidLength, cur_network->network.Ssid.Ssid,
-				cur_network->network.Ssid.SsidLength));
-
 	if (memcmp(bssid->Ssid.Ssid, cur_network->network.Ssid.Ssid, 32) ||
 			bssid->Ssid.SsidLength != cur_network->network.Ssid.SsidLength) {
 		if (bssid->Ssid.Ssid[0] != '\0' && bssid->Ssid.SsidLength != 0) { /* not hidden ssid */
@@ -1355,9 +1350,6 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	else
 		bssid->Privacy = 0;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-			("%s(): cur_network->network.Privacy is %d, bssid.Privacy is %d\n",
-			 __func__, cur_network->network.Privacy, bssid->Privacy));
 	if (cur_network->network.Privacy != bssid->Privacy) {
 		DBG_871X("%s(), privacy is not match\n", __func__);
 		goto _mismatch;
@@ -1382,25 +1374,17 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (encryp_protocol == ENCRYP_PROTOCOL_WPA || encryp_protocol == ENCRYP_PROTOCOL_WPA2) {
 		pbuf = rtw_get_wpa_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
 		if (pbuf && (wpa_ielen > 0)) {
-			if (_SUCCESS == rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x)) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-						("%s pnetwork->pairwise_cipher: %d, group_cipher is %d, is_8021x is %d\n", __func__,
-						 pairwise_cipher, group_cipher, is_8021x));
-			}
+			rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
+					 &pairwise_cipher, &is_8021x);
 		} else {
 			pbuf = rtw_get_wpa2_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
 
 			if (pbuf && (wpa_ielen > 0)) {
-				if (_SUCCESS == rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x)) {
-					RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-							("%s pnetwork->pairwise_cipher: %d, pnetwork->group_cipher is %d, is_802x is %d\n",
-							 __func__, pairwise_cipher, group_cipher, is_8021x));
-				}
+				rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
+						  &pairwise_cipher, &is_8021x);
 			}
 		}
 
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_,
-				("%s cur_network->group_cipher is %d: %d\n", __func__, cur_network->BcnInfo.group_cipher, group_cipher));
 		if (pairwise_cipher != cur_network->BcnInfo.pairwise_cipher || group_cipher != cur_network->BcnInfo.group_cipher) {
 			DBG_871X("%s pairwise_cipher(%x:%x) or group_cipher(%x:%x) is not match\n", __func__,
 					pairwise_cipher, cur_network->BcnInfo.pairwise_cipher,
-- 
2.20.1

