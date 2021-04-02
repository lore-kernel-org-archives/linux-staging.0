Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB95F
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:31:02 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id y124-20020a1c32820000b029010c93864955so4601681wmy.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+WIbGM0TNq2Kt4ZMdwccEsYf6WIgo/nj7IbBEpX7lbs=;
        b=eo/aD5TvnqcNTdexF12Bv+6+MIqOmC/6acCITBwhUb79I1lMogMWk1z05w98p6NMFD
         AI+U3YWbnpLvHslzlXdXhR0T6tlBfttnrfgX29oBDnxMC03z8FQzf6qbdtbaZyK0zRSB
         wHUbFz8yaFz3KRqVEuhRPWaxZg1e6Aqc7iP9+g5Pkx+vVc5GNHK42/CMtFNF5nOzvkWH
         v5tHXI1S9HE4Y48OME+zaBDRoouAE2D4VlElAdPPG+war3Qc+UJOAybbIKquYxXNiKSO
         imt9nFNfUZ8MftcdglCVK9ZDIToLj4IeufBtLL3AhM3xy6tKrPQp2Q7lMUjSuZWLuTl8
         UKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+WIbGM0TNq2Kt4ZMdwccEsYf6WIgo/nj7IbBEpX7lbs=;
        b=bjT2jEh08ttWL5FZ6oH1olLwjdJJ/AbAxdXTQ5IVcX7L7/zeEG3/bC//ldmn8AuiBl
         mjnawvwt2yoge7fihQE3DRzs8xCMH/FNa5Jrc092jTy1BzMIocL84shVaWB6ckKiens4
         SjJxG6NWp0v2xNXUB2XDg2fqNhJ4CH7rJTjRJlDj6S6AsN7I/qH8L9JTVpxAWPi60Z5A
         aiEBtflCgeLL1bE98Sr9xZsZyd31Qx/8nQYx5/jvuR/BJXZnx/tKHse0Ah4GxhObDzfb
         m3Qe3IP+9IDR1r5TT+k9yxIttXhM5BgbB7VLnqYQCrwsBeP8Imft1I1raovdTyIJ1Ojf
         YpLg==
X-Gm-Message-State: AOAM530J4D6/wsqaYtlD2j/2/tJYXe4Pl+wsPmnrrgssZNNlu8iBa49x
	MKW7FQS6ZjVSPSltNUS5X70=
X-Google-Smtp-Source: ABdhPJy3OaScQbyNkcbWIWykSV9mjvfOGlGjL20p1mVOpRas5JWDf1XGchuKcp4oexJ7OTYkLbC4ew==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr3435969wmb.99.1617384661198;
        Fri, 02 Apr 2021 10:31:01 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id l5sm13041219wmh.0.2021.04.02.10.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:31:00 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 27/30] staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_wlan_util.c
Date: Fri,  2 Apr 2021 19:30:09 +0200
Message-Id: <468821e5b155e51101ace32f5ec8630a8315d0de.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

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

