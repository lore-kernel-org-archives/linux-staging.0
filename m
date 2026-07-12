Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A891DED5B
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 06:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783836811; cv=none; b=GNI+HRbH5kOtisDbqwJzo2/XakO3yjslkZ0mGewYLA/SrzKfJv34Mb754R/dBXDwOHjQ5ZcasLNS+IkGX0R+NTgFrSTSprLt97lvbmGL39zH+iymDYPQD+Rjvkwzmt7lzcJSzVmkqgZECLQm6EdHMPRETAUziCTcOK/dL9AFA3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783836811; c=relaxed/simple;
	bh=mbz6ZFrfitvJ+I1yFkzdLUpx+RyH3yGMlV/dj9kOsT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUhz9GY134TW2i4tB4LXvrQ38RWjJamQ5a1eiHs65nKdUvDRd/Q/irVgD8bltcMF9ptXJoqUSYouTgiqvSIOw7UCR6wQJnanoxKt0da13IkhPJ8hQry9EGPdLw5jeJDw9b1ANpSLwN76Bod6h2oDn0k+Jc87sDMASXDfo8vFG3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWA5lf5/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWA5lf5/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so18858735e9.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 23:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783836807; x=1784441607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=948Z0YkTlfRslhq7mBEcq1nfiSUfkPFYh5CFRB+xyWE=;
        b=GWA5lf5/Stfg/D4gU8wHe+FsDroEzy0Brz2EbeZVsQgLL5lo9Cbve5xM0Py2/cHCeX
         8f4qU+m9wMg3vhb3qjeYE6Hxk1qMhCXnXH/Qc0ziCKOAErJ/FnxA2NoVlDZUbqjHby7p
         IBANOu0aNduYqMBLo2yVUtjXNkSYZlq9PMKPJLUXLZXB6/SJhmGTOF2E6rtSz+PVyT8x
         5hRpgf7lPbX91K+pPqIEGMwzQDdW/KKjPjWl8HA6k1SVHUAatbqSCNCHTPiP+QjThsEN
         vJPdeWTqvkC+MG8XtlIU++3RUv/c2PK9lfQWZ4NccowDZFK75L1dRcHjNUtb+71HIu0Y
         laxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783836807; x=1784441607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=948Z0YkTlfRslhq7mBEcq1nfiSUfkPFYh5CFRB+xyWE=;
        b=jqkBjinl4cZq/eeKcRJjG+25YXHdg7b+W8bv/b/1dDInFgcfIbV4Z6SsrnCwSS1C/V
         Q6qT/AsEFT4votXfzQCQHG1YTLdorViNH5tZlvfSM+YARNY2KsPDRl3XTc7jf/tAt+Hy
         /EzkDAOYiiDyqVnFtVuAeYPOXzcif/NRPcwR7hGF8khZuLktI0Gy6MvHvZqzpAqw1Rzl
         QPYksoWNGKyz3LMWRQoDhR6euHKF9gafUxoPklyUp+C2MbZrDlowRMu1+VQyFDXP5jSd
         36gkZrnC4Fj/ErAzxx8S2o0/Y3O1l5Lx7kYMqoW4+ekl1ct6yGmsysgpI3ASRte3WNhI
         fGZg==
X-Gm-Message-State: AOJu0YxhlePv/lrLL0NyhTyZ8J3I3Ss7l+aPgvpDVCKq90HoZHlCBjkF
	bDJxcNVi0yzSGsqbrusXONb0IKhPauxJddK5R+g0SnKF78hjEAlNBqHi
X-Gm-Gg: AfdE7cnCuV7P6HvNmuBgn3pk6a+fO24ZHWJHhdkWaLhEHlR7EdvUDGgilkG+zc0KQbN
	N1kWVvtkwtNFte24BgC9K2pGwFeer0bgPHB4S50iN6UMAgs6KBLAZdq0RII7oX7AbUUpDdykUG+
	B7iZF5xu7XVy0jZIyz64WHHzPTYhJq4t7BGNEQ3CFacljdbYX6t+eX1jeiRkYnLke4/E5j8gw0C
	vLIylp5IaCxloUuMBuVGurcwSuVS7lUm3uheHS0xXSKCt4lrTBMyQzJAljxhTkjiSOvvW9hIF+u
	UyaP7n6xnzF/cZ7X4VrTirAC5EyFk1V8UiNuO8khgXNdqmlkNO0qwIIbZ+Wo3SijwDvJP7YupMQ
	iVDEyDP070BbnfDq8QlirlO1znoYI2tN49nWHD0oGA4twL9+SzvpyjOPtjMN/Lpm9j4Pv5axXYT
	+5UdYDDxq3Io7fhktk+BAxxtZB68BcW6Ytic5fjdfT2Amy6zATIP48j/9t0YSZq9YJ5yxAhzFrE
	mnWBw==
X-Received: by 2002:a05:600c:858e:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-493f8833b77mr40731965e9.35.1783836807366;
        Sat, 11 Jul 2026 23:13:27 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f87b03ebsm96413815e9.7.2026.07.11.23.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 23:13:26 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Fix logical operator alignment in rtw_mlme.c
Date: Sun, 12 Jul 2026 06:11:43 +0000
Message-ID: <20260712061143.2982-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajbQ4m5HAaL2yflQ@koolguy>
References: <ajbQ4m5HAaL2yflQ@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move logical operators to the end of continuation lines and adjust
indentation in rtw_mlme.c to comply with the Linux kernel coding style.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
Change v3:
- Rebased against current origin/staging-testing
- Changed subject and patch description
- Correcting changelog from v2

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index aaac09100fe3..1ffd1d2fc7f5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -342,8 +342,8 @@ bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 
 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
 {
-	return (a->ssid.ssid_length == b->ssid.ssid_length)
-		&&  !memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
+	return (a->ssid.ssid_length == b->ssid.ssid_length) &&
+		!memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
 }
 
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature)
@@ -755,8 +755,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 		}
 	} else {
 		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+			    check_fwstate(pmlmepriv, _FW_LINKED)) {
 				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
 					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
 						, WLAN_REASON_ACTIVE_ROAM);
@@ -928,8 +928,7 @@ void rtw_scan_abort(struct adapter *adapter)
 
 	start = jiffies;
 	pmlmeext->scan_abort = true;
-	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
-		&& jiffies_to_msecs(start) <= 200) {
+	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) && jiffies_to_msecs(start) <= 200) {
 		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 			break;
 
@@ -1578,8 +1577,8 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 
 	rtw_mlme_reset_auto_scan_int(padapter);
 
-	if (pmlmepriv->auto_scan_int_ms != 0
-		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
+	if (pmlmepriv->auto_scan_int_ms != 0 &&
+	    jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
 		if (!padapter->registrypriv.wifi_spec) {
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
 				goto exit;
@@ -1609,8 +1608,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (adapter->net_closed)
 		return;
 
-	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-		&& !(hal_btcoex_IsBtControlLps(adapter))
+	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode) &&
+	    !(hal_btcoex_IsBtControlLps(adapter))
 		) {
 		bool should_enter_ps;
 
@@ -1754,8 +1753,8 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 
 	/* check ssid, if needed */
 	if (mlme->assoc_ssid.ssid[0] && mlme->assoc_ssid.ssid_length) {
-		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length
-			|| memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid, mlme->assoc_ssid.ssid_length)
+		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length ||
+		    memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid, mlme->assoc_ssid.ssid_length)
 		)
 			goto exit;
 	}
-- 
2.54.0

