Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C429A3488
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 19:04:43 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso2673291wmq.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 12:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PaYR6V7BwVCAhT+WCl9MYXQBWVeOSpDreN1dn4JER14=;
        b=LUv3hr2jRSjc3dan/dMo2kIKTj1A6atAJXA/h7g66jVqAMcrW1Ig7obQCSzshdcx5f
         0CsqOt9iAhhbqMfHejEo4BH4lXFJ5jo6HcmN/qdsaNRxJSZFAi4x06Ttiah73TWFlt+Y
         muAxoqVlh5YhpGRzeCEU0FzJlGgRSVOXmthwah3xKMPgVKstfkdXG9VeukZfabT2LpA0
         SBoaHmpl27G5EzmnHerYB48bJl6B9m+HuRt/wAnPejLEqLFETlt30hSg8iUh/WFUJ5e5
         9HJaRPoaRdNols/DEeRZ41hdZU90n3Mhg0bAwYzdUDEYG1e5VPbWj9JiPmnMVEXxEOwz
         r3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PaYR6V7BwVCAhT+WCl9MYXQBWVeOSpDreN1dn4JER14=;
        b=W8CaRlHFIH7Lm4+m7G1875onOSumPS2KEeuthfn+8iQSSyb9oGectaylr+QcpqED5A
         QW5TPbTrb6CJIOCsm715ns8/PUA4oP1nqyFUuSzlkr2XbzW5COrJIczFdLBgriVBZxV9
         FjTNXzAuX91ps897LUsx+sHl2lmbPDrc7ab0LS9FAjWDnh8cAEd1fm3eS9xhLSwu6LT1
         dvvj1SoEmCgUr56TvhycivUJyJI3j+J0Tyvtq1hBrAZ8tcODjtRLzAL3pGLFVgLfOcoq
         tS/abnk9ZCPj4Ctut9+6JXfZvIvJLTJhY8plMgfi99oKDc1TxerpmXPNBb+wGysm36QK
         6jJQ==
X-Gm-Message-State: AOAM530Yt2BEy7QiTLKCo7A+Me2mXrIJQ4dNk7mY+nS/aJPitoUkGXFg
	e5rZVLtVXjrkxoqYno2mXeiGfA==
X-Google-Smtp-Source: ABdhPJyStRD13ZlBc5TXh2q1SZPuUXMMLmnLbHJnGMqtVJgWyStPqekKCLLKTuT1k18vNlsaOw8a9w==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr13808522wmb.12.1627844682173;
        Sun, 01 Aug 2021 12:04:42 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id c10sm8196026wmb.40.2021.08.01.12.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 12:04:41 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH 03/15] staging: r8188eu: remove RT_TRACE calls from core/rtw_wlan_util.c
Date: Sun,  1 Aug 2021 20:04:25 +0100
Message-Id: <20210801190437.82017-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801190437.82017-1-phil@philpotter.co.uk>
References: <20210801190437.82017-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from core/rtw_wlan_util.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 25 +++-----------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 15edccef9f1d..212e64183e9c 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1001,11 +1001,6 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 		bssid->Ssid.Ssid[0] = '\0';
 	}
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s bssid.Ssid.Ssid:%s bssid.Ssid.SsidLength:%d "
-				"cur_network->network.Ssid.Ssid:%s len:%d\n", __func__, bssid->Ssid.Ssid,
-				bssid->Ssid.SsidLength, cur_network->network.Ssid.Ssid,
-				cur_network->network.Ssid.SsidLength));
-
 	if (memcmp(bssid->Ssid.Ssid, cur_network->network.Ssid.Ssid, 32) ||
 	    bssid->Ssid.SsidLength != cur_network->network.Ssid.SsidLength) {
 		if (bssid->Ssid.Ssid[0] != '\0' && bssid->Ssid.SsidLength != 0) { /* not hidden ssid */
@@ -1022,9 +1017,6 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	else
 		bssid->Privacy = 0;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-		 ("%s(): cur_network->network.Privacy is %d, bssid.Privacy is %d\n",
-		 __func__, cur_network->network.Privacy, bssid->Privacy));
 	if (cur_network->network.Privacy != bssid->Privacy) {
 		DBG_88E("%s(), privacy is not match return FAIL\n", __func__);
 		goto _mismatch;
@@ -1049,25 +1041,14 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	if (encryp_protocol == ENCRYP_PROTOCOL_WPA || encryp_protocol == ENCRYP_PROTOCOL_WPA2) {
 		pbuf = rtw_get_wpa_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
 		if (pbuf && (wpa_ielen > 0)) {
-			if (_SUCCESS == rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x)) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-					 ("%s pnetwork->pairwise_cipher: %d, group_cipher is %d, is_8021x is %d\n", __func__,
-					 pairwise_cipher, group_cipher, is_8021x));
-			}
+			rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x);
 		} else {
 			pbuf = rtw_get_wpa2_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
 
-			if (pbuf && (wpa_ielen > 0)) {
-				if (_SUCCESS == rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x)) {
-					RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-						 ("%s pnetwork->pairwise_cipher: %d, pnetwork->group_cipher is %d, is_802x is %d\n",
-						  __func__, pairwise_cipher, group_cipher, is_8021x));
-				}
-			}
+			if (pbuf && (wpa_ielen > 0))
+				rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8021x);
 		}
 
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_,
-			 ("%s cur_network->group_cipher is %d: %d\n", __func__, cur_network->BcnInfo.group_cipher, group_cipher));
 		if (pairwise_cipher != cur_network->BcnInfo.pairwise_cipher || group_cipher != cur_network->BcnInfo.group_cipher) {
 			DBG_88E("%s pairwise_cipher(%x:%x) or group_cipher(%x:%x) is not match , return FAIL\n", __func__,
 				pairwise_cipher, cur_network->BcnInfo.pairwise_cipher,
-- 
2.31.1

