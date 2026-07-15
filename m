Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CCB3368B7
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119821; cv=none; b=C16Y0MaGXbw0bd4xxp34GrGYhFWU1JA5g59J+Ygyw62WM4tVfLMW1JYMDt995IDuCxZ8+6ouFjjD4evJvP9L5gh6mIO6dSIe/RagrwKB8yRKqUWuOIFQNwZjZ2qW+CWc/57qN1cc2IHZxWKelN4rTVVzelUvNp8mt/T0+OojHxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119821; c=relaxed/simple;
	bh=c82bzzoJN5+wD7QRbDZBQm7K5arVc0DPy2QsJOOc2r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpRiVX0DufqOtuUxScYQdzbnm6qYl3PGHnCbd6WElRbGmhk4vTd5BioymTnGKUDcqiP0fuFLwXUxLU8BcilAGxk4sIgY1kVCGUqavhwTgPOqiMcJGn8VGlP7K3QFVlFkfsOykf7eRs/SnRL0ikYndjXNb6Ie6SvPjSs3lZyN2bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/NUmuYH; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/NUmuYH"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0117dda13so1898103e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119818; x=1784724618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fmjy7fGI2Ix2XPkU4EhhKdKH2Y1aaPOILOdheCazGBs=;
        b=J/NUmuYH2qaoifx4EkdZZA8z/NPmEH6051kum+Rar8VJk4/bsnn0jhF1RpWM5aeJaH
         7QrVGa1Cdl5MMszLVxv0LpleAc4LLRfuU/WhCJCL5B4vimGG6Z0Mlf6eGdcvkDqo2A+q
         LVsg1+fb87l3CHjdRNqkgXebja27PdBFgoF/2cj0mxrBpJnJdKYKyudt9YDTwSQTjBrH
         qvfp55/NgPgfnOX2GnCCJj77E2xI934RTmLJO3i9zE8Riq/CaVJXO2ho7vs5viSZk31w
         1Rrv4j7vMkkt953uCamCgY7MabHMuZ8vfcvrRVPolzfQRCCYQlKE7ukrx4PUoeOLAQYX
         JGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119818; x=1784724618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fmjy7fGI2Ix2XPkU4EhhKdKH2Y1aaPOILOdheCazGBs=;
        b=Rg2qaimcIvbHLYoGkt7TWp5tafRg/NwvDsBN+Z+acSFgfHpR6hgxv5Mv+LhfxPVrCV
         rpS286EOkNV+TAdiiDnswJEzdZjmp18Z6S50cSoYEyj/T9P18WXdlopIGgiP9KnXYWvN
         89tvsqWsMrCxffunj9i74PbXN2M2ze6WMukjOB7SYty2VaXh8gXDr5qG6yWGRKuSQS9J
         kuY74KCbZElECqq+Vhw2xfzmnsbTKS2G4/D4BYtO36hqb4VAZUJgt/8P2CwQO4Sbo4XD
         2O5bLwTzEInN5HUGnI4cNpuJZ8bxKNS1QJ/vpWBNSZ1ZjhPPyBu2G2aisYX9v77kyDAW
         qftA==
X-Gm-Message-State: AOJu0YyMlNKJaLZyIgi/bdlyWZAHY8AFzhFLCSat0uWeTB2o0HI8uxNe
	vnlMxN/4D0rJ0j4ar5uqHKIXOOgC0sijk5KZbKoPZRb0AuyAj8pdi5Lh
X-Gm-Gg: AfdE7ckG/0W25mM8EyvDsHO7O9ODHYOFe+6NOFeOIMCQOjWyQx45/GMczL7OH+rn3iN
	WKx9I7OlnlAW6ld8mf/9n5o8luNYKwRckZ0aPHtPfqnfkK7T0qxG9wWCUsUSCBK9yITuU4878qn
	Eyf7j9cnO9qfs0FR2T0I+kQ+yJe9r92fVdhErTSF8iAVpeEyKf7ww0uc1QJIJFrFcmksbmF+vSl
	lMsiR3BDsG57Tbi0TEQXrqDA3KDxafey5J5B8vk9qkdY2V9GmfiAKyZ5LvocUr6TrwVqZ/FOmIG
	dqk0TqJ4Na/kTpftltydfD7S8PVtLyAcsyiEs7Tpu8feHErf8QL/5SJNe14+YoWOl0UAM1uijWy
	T8cmD1hzfuLKV1CnNeKKo3V59O9xbdielbNibnFjwExmQfxXEJx+9BLwwQx4Ms0hzwAgxt+REr0
	naEC1AalosVtquN6jkj5uX8OfExOhwZHUHgQ3WoNMY84T1Td1aj0I53/weYn/s/KWDLOte7OykF
	8QC6M9dc4y8Dg==
X-Received: by 2002:ac2:4a81:0:b0:5ae:bd53:70f6 with SMTP id 2adb3069b0e04-5b023566824mr2914444e87.4.1784119817466;
        Wed, 15 Jul 2026 05:50:17 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:17 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 03/61] staging: rtl8723bs: remove redundant rtw_to_roam wrapper
Date: Wed, 15 Jul 2026 19:47:31 +0700
Message-ID: <20260715124829.90290-4-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate the redundant rtw_to_roam() helper function by accessing the
mlmepriv.to_roam field directly at all call sites. This removes unnecessary
boilerplate code and simplifies driver interface readability.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 24 ++++++++-----------
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  1 -
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  2 +-
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 12bf7780b..9872467b8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -59,7 +59,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
 		/* we try to issue sitesurvey firstly */
 
-		if (!pmlmepriv->link_detect_info.busy_traffic || rtw_to_roam(padapter) > 0) {
+		if (!pmlmepriv->link_detect_info.busy_traffic || padapter->mlmepriv.to_roam > 0) {
 			/*  submit site_survey_cmd */
 			ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
 			if (ret != _SUCCESS)
@@ -110,7 +110,7 @@ u8 rtw_do_join(struct adapter *padapter)
 				/* when set_ssid/set_bssid for rtw_do_join(), but there are no desired bss in scanning queue */
 				/* we try to issue sitesurvey firstly */
 				if (!pmlmepriv->link_detect_info.busy_traffic ||
-				    rtw_to_roam(padapter) > 0) {
+				    padapter->mlmepriv.to_roam > 0) {
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
 					if (ret != _SUCCESS)
 						pmlmepriv->to_join = false;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b1a268728..6c042de11 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -744,7 +744,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 				rtw_indicate_connect(adapter);
 			} else {
-				if (rtw_to_roam(adapter) != 0) {
+				if (adapter->mlmepriv.to_roam != 0) {
 					if (rtw_dec_to_roam(adapter) == 0 ||
 					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
 							       1, NULL, 0) != _SUCCESS) {
@@ -893,10 +893,10 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING | WIFI_UNDER_WPS);
 
-	if (rtw_to_roam(padapter) > 0)
+	if (padapter->mlmepriv.to_roam > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
 
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) || rtw_to_roam(padapter) <= 0) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) || padapter->mlmepriv.to_roam <= 0) {
 		/*  Do it first for tx broadcast pkt after disconnection issue! */
 		netif_carrier_off(padapter->pnetdev);
 
@@ -1420,9 +1420,9 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 		}
 
 		if (roam) {
-			if (rtw_to_roam(adapter) > 0)
+			if (adapter->mlmepriv.to_roam > 0)
 				rtw_dec_to_roam(adapter); /* this stadel_event is caused by roaming, decrease to_roam */
-			else if (rtw_to_roam(adapter) == 0)
+			else if (adapter->mlmepriv.to_roam == 0)
 				rtw_set_to_roam(adapter, adapter->registrypriv.max_roaming_times);
 		} else {
 			rtw_set_to_roam(adapter, 0);
@@ -1516,10 +1516,10 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if (rtw_to_roam(adapter) > 0) { /* join timeout caused by roaming */
+	if (adapter->mlmepriv.to_roam > 0) { /* join timeout caused by roaming */
 		while (1) {
 			rtw_dec_to_roam(adapter);
-			if (rtw_to_roam(adapter) != 0) { /* try another */
+			if (adapter->mlmepriv.to_roam != 0) { /* try another */
 				int do_join_r;
 
 				do_join_r = rtw_do_join(adapter);
@@ -1773,7 +1773,7 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 	if (!rtw_is_desired_network(adapter, competitor))
 		goto exit;
 
-	if (rtw_to_roam(adapter) > 0) {
+	if (adapter->mlmepriv.to_roam > 0) {
 		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=
 		    mlme->roam_scanr_exp_ms ||
 		    rtw_ssid_differ(&competitor->network, &mlme->cur_network.network))
@@ -2540,10 +2540,6 @@ inline u8 rtw_dec_to_roam(struct adapter *adapter)
 	return adapter->mlmepriv.to_roam;
 }
 
-inline u8 rtw_to_roam(struct adapter *adapter)
-{
-	return adapter->mlmepriv.to_roam;
-}
 
 void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
@@ -2559,14 +2555,14 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
 
-	if (rtw_to_roam(padapter) > 0) {
+	if (padapter->mlmepriv.to_roam > 0) {
 		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
 
 		pmlmepriv->assoc_by_bssid = false;
 
 		while (rtw_do_join(padapter) != _SUCCESS) {
 			rtw_dec_to_roam(padapter);
-			if (rtw_to_roam(padapter) <= 0) {
+			if (padapter->mlmepriv.to_roam <= 0) {
 				rtw_indicate_disconnect(padapter);
 				break;
 			}
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 8cc96164e..b5276c429 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -389,7 +389,6 @@ void _rtw_roaming(struct adapter *adapter, struct wlan_network *tgt_network);
 void rtw_roaming(struct adapter *adapter, struct wlan_network *tgt_network);
 void rtw_set_to_roam(struct adapter *adapter, u8 to_roam);
 u8 rtw_dec_to_roam(struct adapter *adapter);
-u8 rtw_to_roam(struct adapter *adapter);
 int rtw_select_roaming_candidate(struct mlme_priv *pmlmepriv);
 
 void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta, u32 mstatus);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index ce76a8586..397440af8 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -436,7 +436,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 			   FUNC_ADPT_FMT " BSS not found !!\n",
 			   FUNC_ADPT_ARG(padapter));
 
-	if (rtw_to_roam(padapter) > 0) {
+	if (padapter->mlmepriv.to_roam > 0) {
 		struct wiphy *wiphy = pwdev->wiphy;
 		struct ieee80211_channel *notify_channel;
 		u32 freq;
-- 
2.55.0

