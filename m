Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417D7392C46
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394737; cv=none; b=rZ6sYufuZfo1WA35qWQr5COTX34BaVDa9tqO+rxlQJg45mOWc8Ld7HM3+V38qVFeX707OhF8hQhbXd/mqm9EKjzsCwyVZzjtj9h4Nktyr2xWBDq9pjvRKLtp0ccvIS3WUDPWDWMk86xpcLBLnO/Ld5Laeoc8SYAJ2Qa59WgrmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394737; c=relaxed/simple;
	bh=aIV2EFGl8Rw3+pTqWtdl1K7zxN/9Zupq79LHIy59AHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpiudtlC94z2EdeJZCvfXmzNQf6zebzbUUC2uKOVsApCfWvawgVlZsyna4PTFsLvC2/WeRKZdA3Ly95cgu1StkVPSBs5UAj5Kc4eIxoOqAj+Ty4RB3YBxkQvYiutS5zhDJOrakZ9XqeXLjtCGeE4p47VFTt9NU6R/n9S4raP83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=Q4VRDefI; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="Q4VRDefI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DDD184292;
	Tue, 28 Apr 2026 19:45:34 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777394734; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5nwBJM09V8VDtqet+QMNYG2G81ccmqT9GY2u6fEOuaM=;
	b=Q4VRDefIHtq0D6fb4O5FjHeIACkp60HN17zBSd3s4r5ua6cNGPznb5fjFIHZiLD9YU7vNB
	sgeRAsyWGcY7+sup7Yx4jrfuLyf0kQz0F0KgQ9uS3+EDphN4+dh2HMgSxPE7XA3ETSNrZE
	Vxic4mXvEYbYOjPB9yNzqC1SSKr/nMLK5zvF/Tdg0V8L3zFCrIUl4n1YYEGLJvJrZBd9xo
	FzCQ+sbCWkgIGiwblXLF/82C/hWvq3oNGKUja/IhpYpqL0uQ5cDn7lGswriBbs9Q9oUs1u
	e65grTKOv4zCNPPyn7XjbmmjVkMeQyOB1ahdjdy/YH+MjhHlLBIhF5GvOgoXFdlsbG8yLi
	41Nz2huaI3g+6S9EXRkDvl1ucmkXtv9svWk7YWS7W7bIxcHWJga1H1p1H9vd7PRXIU+rUq
	v9NwoEcm3cPsBTMmsCG7jDKMiAYnTwYJTw46p1Q4LxMk4nQMP4G6U+B9yK6BoqBo1err38
	uxfGsEV63u5NgxRXuchZ66WETuggKwXd//hPkeCJZBxH9udSofYMZIO6kETtjCWUTV/vVv
	sQGWZd40rRkTD4GuTrq6KIDusQkpoPv5lCj8BJeJRRbp/rMol1SwGtQ+ROd1qnGXAVm1N4
	h0oBRBMXxcRODAY2IEoTkoEzPbALa9xTyvV0ztpJ6Tm8S/df8jDXI=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/8] staging: rtl8723bs: rtw_mlme: remove dead commented-out code
Date: Tue, 28 Apr 2026 19:44:36 +0300
Message-ID: <20260428164513.763471-7-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428164513.763471-1-me@cipherat.com>
References: <20260428164513.763471-1-me@cipherat.com>
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
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 9582d9704393..233675f3a045 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -750,9 +750,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					u8 *pibss = regs->dev_network.mac_address;
 					u8 ret = _SUCCESS;
 
-					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
-					 * because don't set assoc_timer
-					 */
 					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 
 					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
@@ -1707,14 +1704,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
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
@@ -2249,19 +2240,11 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
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

