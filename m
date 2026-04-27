Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C157B3EE1CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316771; cv=none; b=A757hcmM8R3heSTvgnMvwqk0ami2OKxK19h/g/FED4OyKB4ZmiOsvp50mWtDSAJF4WK6YXeWdjq/u2xNzdTOGYlv1gHdy92CTBWbUWfHLWqXVF3HjHxPCWrrpna7CiKszoUY5o8zT+EGJ276fjPi8F6MfOiYBQohlMpahOjf+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316771; c=relaxed/simple;
	bh=kDDHtw9rPofDI2AAfHSyWNiya7j5GY0ATpGRX92VhAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkUh9VLiTB6N0nfYs6cKksy4tqbkSzQca8UDP9XU/Few9JGadFls95FfujQSF0gTD2DEJitYWFhtELdRLs61EoD9sor6g+SG+yBzfJ3RDVTLOxM+e/2mpRka/woLJNNSxF845W4HkC8Md4Umvyds2H3sUYe1K4WftV/eqosie3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=ikwsi5QG; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="ikwsi5QG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7084E84F2F;
	Mon, 27 Apr 2026 22:06:07 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777316768; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ydse2Aksj+59gm0+mFUorFCyCRgeFaGRM4V9YNfhUwQ=;
	b=ikwsi5QGRIbYkWrEexwNuOh7xkXYCPuHBTObCiYwi4Jf0/Bwxd28Dnv0JA8s9JoTsbniUJ
	RdoXm+qGPN25CzN1BN/7oTgOsd5eGhF0dESta85I8r3iQVeMnMD4Pv3+zK4TST9rY4p1gG
	JZDosN1x6hqECmXDitpIWBT5pjtKbYO68CLXL9yVX0lBXERIm1Jxz9BcfD4LMf8qeRqPWm
	7jTFK3POpZfnS+FUgbK6waEttTsSwyEA/hDdYmDMSHEjl8rtPdcGG7Dl5nogUopDIEDZ6G
	VBiPVtNhgGu2iCmxIH7haTIuLhy/E58pPhrXPn6/a0yK10oywwZvh3tafSkPblwd1ABkf6
	lnPInX5rtJjS2pnR3vnVmLs3tFoYF3yAIyuNszJdx+F5y1STeBB53DCDwOGDBqVYT25f70
	a7nUThIFkT1/CTyYWkgFhLRc9V2w2a/IzSRo6Kps1YMxr6ZBzVyixI2ZryvyBqYhme39Wt
	BotMxjRAjcYJghZ7Q8sj847pUtVLe6l04fIIP6bkZeUfuIVcF96Zhnznm35uA/131YMiZF
	1Gz98fl4OQApzdNRkv18+St2gM3KTuuLgg7Bp5WIKOg5NpvRzUwBj5g5Quaaftkpm+KREM
	QZeJb8RE/jPgTtPCyaoJDK1xT93IV2uH1Uhu046gi57n48dxiuOT8=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] staging: rtl8723bs: rtw_mlme: remove dead commented-out code
Date: Mon, 27 Apr 2026 22:05:33 +0300
Message-ID: <20260427190548.156499-6-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427190548.156499-1-me@cipherat.com>
References: <20260427190548.156499-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Remove commented-out code and its associated orphaned comments.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98271cea2bf2..47c0d176dbdc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -750,9 +750,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					struct wlan_bssid_ex *pdev_network = &regs->dev_network;
 					u8 *pibss = regs->dev_network.mac_address;
 
-					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
-					 * because don't set assoc_timer
-					 */
 					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 
 					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
@@ -1062,7 +1059,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter,
 			preorder_ctrl->enable = false;
 			preorder_ctrl->indicate_seq = 0xffff;
 			preorder_ctrl->wend_b = 0xffff;
-			preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
+			preorder_ctrl->wsize_b = 64;
 		}
 
 		bmc_sta = rtw_get_bcmc_stainfo(padapter);
@@ -1072,7 +1069,6 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter,
 				preorder_ctrl->enable = false;
 				preorder_ctrl->indicate_seq = 0xffff;
 				preorder_ctrl->wend_b = 0xffff;
-				/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
 				preorder_ctrl->wsize_b = 64;
 			}
 		}
@@ -1712,14 +1708,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 		linked_status_chk(adapter);
 
 		should_enter_ps = traffic_status_watchdog(adapter, true);
-		if (should_enter_ps) {
-			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
+		if (should_enter_ps)
 			rtw_hal_dm_watchdog_in_lps(adapter);
-		} else {
-			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1)
-			 * in traffic_status_watchdog()
-			 */
-		}
 
 	} else {
 		rtw_dynamic_chk_wk_cmd(adapter);
@@ -2254,19 +2244,11 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	/*  1. Supported rates */
 	/*  2. IE */
 
-	/* rtw_set_supported_rate(pdev_network->supported_rates, pregistrypriv->wireless_mode);
-	 * will be called in rtw_generate_ie
-	 */
 	sz = rtw_generate_ie(pregistrypriv);
 
 	pdev_network->ie_length = sz;
 
 	pdev_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)pdev_network);
-
-	/* notes: translate ie_length & length after assign the
-	 * length to cmdsz in createbss_cmd();
-	 */
-	/* pdev_network->ie_length = cpu_to_le32(sz); */
 }
 
 /* the function is at passive_level */
-- 
2.54.0

