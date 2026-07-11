Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1426ED3E
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783779931; cv=none; b=li2xrty8iCVN9Nxf5JOXc1l4lqukUzfX5Wj85Jw7xPqapDuSk14k3Pf908DC+nujDxRLYDPDLamhtLTCJ4QsI3pWiPeprKrXeWQLiUQUXONpaTmUDYXO55ISkd9jc4tET+tHdU5vL0KiCjpwu/+ZO8w0/V49gLGp5Yt7MYf/vGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783779931; c=relaxed/simple;
	bh=vilpXLEDv1Xk8q3QClHvxhVnG7q4HgezGXMTj+tIfW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LD8CeEA5gWZMZyS5LrVbfxKT/djaMhkCUrh9JnWwWZmc6AKCiwHHBHGEENvzf6xqajPdlhunRE/hhhfKAmzdQ/6VNef6rJ6BjLLeRPqDabI7+/kCFj+QyvBj2Qf4ZaEB5mPhr0ltMuFWXOs/ra9hOg3lEwbuc6o0xyDyzANfinQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdSp1wlI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdSp1wlI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b27c7451so35111515e9.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783779928; x=1784384728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9z7AtBnILyQPFQVJFnxgKErsF4ZaY5z4yBYPOW/Znoo=;
        b=EdSp1wlIJrutkkhCvqRBIJ4cc8lI/hR8MAw9XiwA62Syk1ozVqa2G+idVL98cQmJWF
         cIZoQAgsLjJdBw+8BkxWTsLkkIb2payGfwE7IjPSsChQU06ldMZWdOR/sA5/ZDMwazfY
         LTa4bjETbQg/JbbmlZD6HSelkRjSEp/NwvWd3y83nJTkJb7eQAY9+jBX7ZglK+O3Yj4d
         DiyV1TWguVKuzEZ0ELX3eM4l7emWs71RuGfR/XpbIZT6/euZDgDiZ59zdS2J7lf0MQ1O
         5hXQt/NOI1y1TJz9UXGlkz8fK/3MygRStTUvuGBxADwVQ3GjdBM2dHK4OXlqXZSpOIta
         iWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783779928; x=1784384728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9z7AtBnILyQPFQVJFnxgKErsF4ZaY5z4yBYPOW/Znoo=;
        b=h+Z+awsiXJ2bKlJtAAhWsQEiHMmtGEg++43dpZclxG0BB9r4l170loSm5xjolmpuWT
         H+fG7sP4o+42YjJlFmE/1DTobdbS7hsK5Ww/XZG3HjQ7Q3TvuhfMpxcgvn2tgYqfzB63
         bE/1UtbXrM1v/CgRCbELtZWoa7ieOsB9eB+m5yqqCu8z2AoK5vD7VcdMyLDOw00CC1e5
         wN6vqiqNq+cjOzBO4Fh2HTTsj2mrM4mqpE9SI1W3IKP081GhhJ4P7qfgEokAkoPedK2S
         JsdR+yQihZVsuP5OrNVrMUp1vKd2WoyP/NSI4uGpV9y/TK3BumpzSSjl72o4Y0I0sMRt
         D9Ig==
X-Forwarded-Encrypted: i=1; AHgh+RrqTnTTtQKrBuQVFmLbluucS/G8hzkAVk0PMaW7OZ0hhpzUdb3IjPeUIBVNhic937NxW8pnN5W03fkufD+3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6GKr+PmTuwiiTxIKAXUmDpMTLLULy5fSMSIMsbLfwTqipDNPo
	rbwqtQ/lx4rsl5Y2MLsP/9E8O2p/31M9rRl2kkcn7Zs/5X0giyIsx9h9
X-Gm-Gg: AfdE7ckegwPhysJKr316KKh0yu0QlYeD7+ghAka77tR1+V9C0PmYdn1Rd7p/6Zk00d6
	pbLsAj2hJuoREEq41mhI0/sGm54zo3g/8+CIzhANnSwnWEPm9YrZSZe90gnNeZ1SC+aJvKEuUIL
	AOH1qtzVaQfQM7U3XgozYJHURmVRyP0qKn1wD2XPKbeizR5pvWkF2Rf931GIgjcxkYG3eAOtqWq
	t4G+XBNI++zYbwrj58qxtzyXEOfkjiTxpO6xhNi0PPte4FpgDq6B9mIxJtk8Kb6eUEL5d9Rslbo
	MbeBh5P/BP2z1TZskNEuC6PaMbEq+hx4pdDrV9D++m6kv7egPhwgISX6BbKVpRZ+87/r8t8dwNI
	Z1YVuSXNRCQJ7k0OHgtLadkDA2x2mVapiEFpuAr2C5CC0DRevm0yKfNxkOPtEzvhG4KxxHDgSyj
	eOeZRrMSpPBCbcpECORiIe+T4u286/p3V/NPtaYEMz6G4EkU1xh2t7b39yhhGj+iMXFmdotxYSZ
	+ryzA==
X-Received: by 2002:a05:600c:8b65:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-493f8885308mr27048745e9.7.1783779928039;
        Sat, 11 Jul 2026 07:25:28 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm217970965e9.1.2026.07.11.07.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 07:25:27 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Fix logical operator alignment in rtw_mlme.c
Date: Sat, 11 Jul 2026 14:23:45 +0000
Message-ID: <20260711142345.2903-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajf8qOpXZ9fFFczS@koolguy>
References: <ajf8qOpXZ9fFFczS@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move logical operators to the end of continuation lines and adjust
indentation in rtw_mlme.c to comply with the Linux kernel coding style.

Change v2:
- Rebased against current origin/staging-testing
- Changed subject and patch description

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
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

