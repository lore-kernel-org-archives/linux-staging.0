Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8676235046
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425839; cv=none; b=F6qJ3P1N2KHnnksBMCWX0+Jtv/cjdc8yMZsB2ag0r2HOr7fhLUvMRD1D2sjUjElozXP8v1kMk6dnmxl2iqkSdwYOMFBiSSp6jw2aU/oHiKfdYmS3b8emKRRnKQ7Z9bDwM6B/RptXaG1vklLJgfUrFQ5T+6zc0B2t0DDYa0eXWoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425839; c=relaxed/simple;
	bh=TH4+HNld9+i/MGM0f/5DEADdJZf7ly3KCW4Q2/9zRHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xee2POSvsDRaLuP9imHNOhHSAZSMXsa0BfSTOto5QLLmSM40BzAspMVIfG2Zc1/u+SsSJrnG7yYu3tWSxeecXTRMri7C51XR21jHSWH7olDY1oajDS33oxrQJfm0DNhBEVlnKtW68c89WXjdw0v+WUUEuXzKzxax1yU+IZ7YgQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCsXngku; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCsXngku"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4e4b340f99bso10975701cf.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425837; x=1760030637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOkuukFAKfuNlA45spRenHQb3HrxxtKpHdC5Zz9bbRA=;
        b=WCsXngkuQvOMFblYiOT5VZqDChWQCvHZcyK+6JeCWfXmmYpFzuZNNl15l3gcUihwVs
         lDW+clP8hb0De0NDfES++vRkMH0oTqlOVgmj/heHwSuiBwtIN5DA62seUva23CJySkTB
         xY4lhS3NPL2R72U6LA15WNQ8z9JPGTNn/Pkj1JGNuiiwS0F5WCmbWOh25H1t8Nuco9Rb
         XZq4ujj/rkgvC5+wUM+7kRsgdJAtevs1Y80CsgjhubE7U+grEiqghMCVLDS8OqDT90za
         W8muGEhMt1PbSRWuhohtqO7RXSGAEGNLU8H2p0zNAI1PgBDGM8klyBc81HN3WVNy++mB
         5ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425837; x=1760030637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOkuukFAKfuNlA45spRenHQb3HrxxtKpHdC5Zz9bbRA=;
        b=uJbzkdcr3V4KluXLs5jkB5ayp6esL6TUcaYYrhLiWh0KLIJ1KikouxqXuPWvI9iVHR
         8rGneggvmnctn9fBDLA81VGVOtMglWEoNTooABHlPwOdLMv9DQGMJlPYMh20lF6tlr98
         Gn25c+cWxUSuhxFZS+eLzNajM1mn0novl5CjfcRpKlYu1jQcP0L+smmeqe0ouDnYDl61
         5Wep+choPkt7A3V2PDXl8s19xStE7IyqQ3hK8O4ZaiAemRMomyyK+L6hcTnSVYWUJUJ2
         b91BpLpJLRL2oJeTOJpRLECnJwzvB+z9c9+FHob7VxumUUmwY9gYohmMJUz5D/jhTAfG
         +ccw==
X-Gm-Message-State: AOJu0YzXAmSgYWq4tUg+WGICu+PmE1iT8tcGKdrvtiIHlMSqIaE6gfhW
	Lz2PBI5+4o/YKfrnfg3oLZ6iJ9yOKnBaomgtXIGJAqVouqM6uOQmlwUv
X-Gm-Gg: ASbGncufrUavTaAMmXjk/W9CkL4vez2GTmA/Bxv1o+DSZ/8lrX0nV0W4yvocH48ThUa
	e+syNwKYB7Vbbq50rBpiqkVL4wqyX5OkeVc+el3sfeC25YS8DqvuANO9Om+EEN9DIdpkH/VumD7
	c/ayiDSiv5GqJmBbM19ybufEja2gMgnXuh2DUGXDAYip4FuD3/jgo9yreCt9MPy0CHR9LbaZwaB
	i0YxYPo7LVqGw4DS9/92DArCW9jJNFiwMVSIkjcux5gB96fVyFnfQ3uBqaBfRNQXbULq/Fvs/2F
	lcc89qXPrpals+fJGwzgBruZ2zjou0KO9/wJAb109AfDDKX3z+6rkoE5AroxZLyJFMBaTziB9hw
	4Q+/HVvrVT/gZkemnTmdPhAsnattQaxGxVZy6Z63ZvbkNQMn4ESM+L/CKI6Gh5jz91POjjmU97r
	4nFktQemq/m9bOkkSsGxn4
X-Google-Smtp-Source: AGHT+IEQGdKDqBPPATb2xXEI06t0K2DfncS/o9zfpqmAWWSdbxrstoOvzRuXs38SLSnyKjbvImWQvQ==
X-Received: by 2002:ac8:7d0a:0:b0:4e0:b72b:7f6d with SMTP id d75a77b69052e-4e576a7df6emr1380721cf.29.1759425836387;
        Thu, 02 Oct 2025 10:23:56 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:23:56 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 05/16] staging: rtl8723bs: fix logical continuation style by moving to previous line
Date: Thu,  2 Oct 2025 17:22:53 +0000
Message-Id: <20251002172304.1083601-6-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat logical continuation to same line as previous statement

Place the logical continuation on the same line as the previous
statement, as recommended by kernel coding style. This improves
readability and avoids unnecessary line breaks.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 24 ++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c898c10f0813..0296c2e9a7e1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -352,8 +352,8 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 
 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
 {
-	return (a->ssid.ssid_length == b->ssid.ssid_length)
-		&&  !memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
+	return (a->ssid.ssid_length == b->ssid.ssid_length) &&
+		!memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
 }
 
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature)
@@ -792,8 +792,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 		}
 	} else {
 		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+			    check_fwstate(pmlmepriv, _FW_LINKED)) {
 				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
 					receive_disconnect(adapter,
 							   pmlmepriv->cur_network.network.mac_address,
@@ -945,7 +945,8 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 	if (rtw_to_roam(padapter) > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
 
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) || rtw_to_roam(padapter) <= 0) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) ||
+	    rtw_to_roam(padapter) <= 0) {
 		/*  Do it first for tx broadcast pkt after disconnection issue! */
 		netif_carrier_off(padapter->pnetdev);
 
@@ -985,8 +986,8 @@ void rtw_scan_abort(struct adapter *adapter)
 
 	start = jiffies;
 	pmlmeext->scan_abort = true;
-	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
-		&& jiffies_to_msecs(start) <= 200) {
+	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) &&
+	       jiffies_to_msecs(start) <= 200) {
 		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 			break;
 
@@ -1714,8 +1715,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (adapter->net_closed)
 		return;
 
-	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-		&& !(hal_btcoex_IsBtControlLps(adapter))
+	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode) &&
+	    !(hal_btcoex_IsBtControlLps(adapter))
 		) {
 		u8 bEnterPS;
 
@@ -1873,8 +1874,9 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 		goto exit;
 
 	if (rtw_to_roam(adapter) > 0) {
-		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms
-			|| is_same_ess(&competitor->network, &mlme->cur_network.network) == false
+		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=
+		    mlme->roam_scanr_exp_ms ||
+		    is_same_ess(&competitor->network, &mlme->cur_network.network) == false
 		)
 			goto exit;
 	}
-- 
2.39.5

