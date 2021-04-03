Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7C86D00
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:57 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j7so6562786wrd.1
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTpgTYAuNOGpQA/JBeXTXo9cQF6qwIy+jwlVbtJcu90=;
        b=YFnbMxef0+5bejXzU3w63BSRKYgI2x2w1jHZ+Xv5iewILD53KwgbSvXkN65ds5KuaX
         CWQ8+hziBpNtljbLUchnyO26Hy1hImnHFttrWZfLZYfp/xKQd0NiKq7GoNeHhVMYhFmN
         Jk5pYA3CjSmi2q/e8antXqXlxpZ18AFCQQSzHJyhLHVStu6+c9OSco+g6mjJyq43kB1I
         VR0QZaNVe6RQDytDL1UuwojM+LRKqN25FHWmaf3hEn/06g7IqJgyrbRQY/XHvfbQ1dyr
         ln5j0ZWbDCdNDSMXqd198BTlK/W7DroTBtfFyKgY489nRyI1YrhtBd/oV7yWbaj/cCGx
         MrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTpgTYAuNOGpQA/JBeXTXo9cQF6qwIy+jwlVbtJcu90=;
        b=PDJMnxfPyNUcVFOsxPiRMa2mjyBnYeuPR2L+Eb029VsY9UbSPqP4K+BDJAzorWLe7r
         Y2PqrOw/sgzahJLYWuFxpeqQ1lOejOQEjLnYy+HlDq14Wd5bEXPy85EUXhtKXxQrsI7F
         VxJEL0lspDf8hvN+0QN9z1KHQIWDL0dGFccLJ858Tq0lHjAenMGyRvN/eguPWQmwtZaE
         r0TNqQJZHY8RI/FVHupsogNKaw0vENaf1gN/iiw9lYOrOVqYmrer2ICBV3d6a8DbN9L3
         coJou14sCkqmrP9sl0cqahxi7Q84Jpb9SCTD2TkufVFmYN2EW4REGvcx0SHqy7TCdr9W
         0X2Q==
X-Gm-Message-State: AOAM532XeMCfi8ZyIu6lJaQT0SIYRfFVFYIeTTVkwbv9wKR1xBelEtKL
	LyBlgWolbpuLVKGpcI+fUPc=
X-Google-Smtp-Source: ABdhPJz6QllR/uwl9bveLLMIaxAuUY4LRd1DPQJ/ulB1RYAosXb/+J0yc9Ubo8waFJRE5dj9AoamuQ==
X-Received: by 2002:a5d:6cc3:: with SMTP id c3mr3967397wrc.179.1617441296579;
        Sat, 03 Apr 2021 02:14:56 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id h6sm5784372wrr.21.2021.04.03.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 27/30] staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_wlan_util.c
Date: Sat,  3 Apr 2021 11:13:49 +0200
Message-Id: <c1d6d9c6514640176af9f4c9ce25f0940884fb17.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
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

