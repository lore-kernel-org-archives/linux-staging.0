Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672E2FB2
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:17 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id y29so15844650qky.12
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=apNjofWd9AvXaN6XyOcY1gPI3w+bR2S+KXIsPCKkywg=;
        b=ypDcHo1aonLu3uOVhzpfdspGglQDj3CzJDwka4oQiBUsmOpJ5g80COFy9xfbcoDPqn
         Nuspf2X+YnvLsAnmxwBRxp1gAFOxC5Anixf9Ojll/k9i2CwHRu0v3xNIOb40s1cgbjr3
         Tz9iY9dLrsduQkyBWwnD9sapnQoe/fFO0jKlkr3ZB1XiqOngimtdmhJqL5E0r3dX+zOA
         8z8gFfbCSm0jl7UbgnTdNF8iVsnJ6txwXMMQQW+NJBEi3rZFcgbw/eJuA5FpCEsyHCpu
         y8X4hMlq6+NZp8VoJHvEYIClV89gmpvuxjgisRZgsNXkbFqwjTJyGl90Pu3Pnl4iXCWW
         e/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=apNjofWd9AvXaN6XyOcY1gPI3w+bR2S+KXIsPCKkywg=;
        b=quDycPiXj9/76rdVXdny4lX4ISu5bzDdB+oR1ZVGQb1iKRVle9cNq8VW7MIK4XssYR
         H917JGkC1KKwE3zaaIMzMDxqbmihDzEciXO+7tsh8hiTwErORT4LSowpYVoIt7IrTswG
         yR8XBNkcIqNVS0xBWRBVbFCJmN5RMk/2wa2vnyDGQG2vUUsQ6nSjQ2k2WSVaqqFPUjpE
         kupXldHVBGeAl7SdMZMb6pqo3Y/yCKmpzfUfz+xvxPASVbb4xS4/3B9S9/oYkNATbzU8
         f/L26y7LKLTTMAGBhPIQ8La5LK4dpZ3oENrz2D7k0u749nxNGBhTXx7m2MTAFqKsbiss
         FnvQ==
X-Gm-Message-State: AOAM533jPPinUQjuLS1+hK1NYyQWcgnqgba8tfJ3vII0zzjldOxJtf2B
	tgnzunLKKVDyYVS/SrEVkK5Ldw==
X-Google-Smtp-Source: ABdhPJznkVDJOf2Nu/ESN8L8UyccaRaBCtb0++WmtR4Y9Dv7dDk2UGL+wjXuBoT14isPX3JiAQ9qQA==
X-Received: by 2002:a37:d88:: with SMTP id 130mr8322569qkn.302.1624579697163;
        Thu, 24 Jun 2021 17:08:17 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:16 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 11/23] staging: rtl8188eu: remove all RT_TRACE calls from core/rtw_wlan_util.c
Date: Fri, 25 Jun 2021 01:07:44 +0100
Message-Id: <20210625000756.6313-12-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625000756.6313-1-phil@philpotter.co.uk>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all RT_TRACE calls from core/rtw_wlan_util.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 .../staging/rtl8188eu/core/rtw_wlan_util.c    | 27 ++++---------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
index e3c8bdc9cbc1..2d4776debb97 100644
--- a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
@@ -871,11 +871,6 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	memcpy(bssid->ssid.ssid, (p + 2), ssid_len);
 	bssid->ssid.ssid_length = ssid_len;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("%s bssid.ssid.ssid:%s bssid.ssid.ssid_length:%d "
-				"cur_network->network.ssid.ssid:%s len:%d\n", __func__, bssid->ssid.ssid,
-				bssid->ssid.ssid_length, cur_network->network.ssid.ssid,
-				cur_network->network.ssid.ssid_length));
-
 	if (memcmp(bssid->ssid.ssid, cur_network->network.ssid.ssid, 32) ||
 	    bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length) {
 		if (bssid->ssid.ssid[0] != '\0' && bssid->ssid.ssid_length != 0) /* not hidden ssid */
@@ -890,9 +885,6 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	else
 		bssid->Privacy = 0;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-		 ("%s(): cur_network->network.Privacy is %d, bssid.Privacy is %d\n",
-		 __func__, cur_network->network.Privacy, bssid->Privacy));
 	if (cur_network->network.Privacy != bssid->Privacy)
 		goto _mismatch;
 
@@ -914,26 +906,17 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 		pbuf = rtw_get_wpa_ie(&bssid->ies[12], &wpa_ielen,
 				      bssid->ie_length - 12);
 		if (pbuf && (wpa_ielen > 0)) {
-			if (rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher, &pairwise_cipher, &is_8021x) == _SUCCESS) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-					 ("%s pnetwork->pairwise_cipher: %d, group_cipher is %d, is_8021x is %d\n", __func__,
-					 pairwise_cipher, group_cipher, is_8021x));
-			}
+			rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
+					 &pairwise_cipher, &is_8021x);
 		} else {
 			pbuf = rtw_get_wpa2_ie(&bssid->ies[12], &wpa_ielen,
 					       bssid->ie_length - 12);
 
-			if (pbuf && (wpa_ielen > 0)) {
-				if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher, &pairwise_cipher, &is_8021x) == _SUCCESS) {
-					RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-						 ("%s pnetwork->pairwise_cipher: %d, pnetwork->group_cipher is %d, is_802x is %d\n",
-						  __func__, pairwise_cipher, group_cipher, is_8021x));
-				}
-			}
+			if (pbuf && (wpa_ielen > 0))
+				rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
+						  &pairwise_cipher, &is_8021x);
 		}
 
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_,
-			 ("%s cur_network->group_cipher is %d: %d\n", __func__, cur_network->BcnInfo.group_cipher, group_cipher));
 		if (pairwise_cipher != cur_network->BcnInfo.pairwise_cipher || group_cipher != cur_network->BcnInfo.group_cipher)
 			goto _mismatch;
 
-- 
2.31.1

