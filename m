Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB68325709
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384213; cv=none; b=FdiEHPYe8roprCyOxDypk3mc/ouqtvKOQRJw5GW60fCTccXofzff+jnWH9pHiFcRbw0aF48ze8qdvApS5NdHO8j+u87TCfxA0We0Gri9D9hLs/G6451JGOYBPAtke162M2wbRUg0E5LlveZOlGsz6hYPeIB2jpfZO9YTwcJaRV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384213; c=relaxed/simple;
	bh=e/mI78rlcROkwyCnFrPqZ93+2skdXKQYdQbPi53JV+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BCyOpC26KAPmwVttP0p7D0a0QCzGr5X4W7UDtsa18JsbhAgo363HDd2xDNsXCFtQ2a7domshFi7KGzPA5741lwobHOWDeqgjlOgC3GI0+Y4vcldZtxCxYK3O1lnv/hvOyn5e91F5F/BP6lt77wnMh9MwyNpOfnRLCNrpqBZ+iM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6/a+qRz; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6/a+qRz"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81f4a1a3181so1574169b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 01:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768384206; x=1768989006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7184E+UMbkIgJ3J/SK+PE3TLYikCfjJs5cBICGV7eJA=;
        b=V6/a+qRzYZ0ZeyVRPQWho6C4qad6Io9hTeg5FkLmi4KKTNgJTRSnVjXdI7W8Ws4kiy
         wZ6gD0RZJkStRxOeIQ+L4+9nZ9OJGEKZxcLEmSoyqagYj0u9fz7KNqkeT4BVpI8l174Y
         RhJ1XPJ+AT2eJslHVoqazt0cQmA7/wwMRHP3gYEU1zU76IJB5+yGQQCeUF4jpePqkjI8
         9/JMKOzMzEhTdDPMxML8PG0rEfz0rTyRmzj5ojVprW5qRzB6sdbOwCtnjbHQow25cnku
         8b0st0gV/jBQPj5fwZ6ldTcEj2HwU4crP3gAaioTSBmug937lr/8RrpyvvnF2J/pglvB
         6leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384206; x=1768989006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7184E+UMbkIgJ3J/SK+PE3TLYikCfjJs5cBICGV7eJA=;
        b=wZc/66s446FJehDPTKWjhdZA5twaBNJt/oa1z7dgW/apZL1ojearjZsUFZjYCFRX3y
         vL5MhSQ2ZOi7KzRTk6SHnp8OOTcKjDaZSsfzZpNoZ6jRP//l7A7uIx2xeSI1K9iIK0bi
         mcaMTgWs2TMg7ZsXRRO3s6aaev6eXjTgLQLNvMZXEwEwzntRu7DaMQ/KDHr/5blvGLjc
         fEJcMKI6IXPPipVFmxMVlVk9O/WLsWewjRZZOyHnqrcJuSMRYVTtQRu3XP6KFlZHV111
         s/ZliPBRfFIUAmA5YxWjmIYbLY7BGD1QtJWsgnUu8L0vHpg75xJ+jRI4TyNH/Vumnp0a
         xgAQ==
X-Gm-Message-State: AOJu0YzF0YsaEn4mBjjNwt9zQVK1N0wgVD6HrVWkncJZhlsEz1z6kcT/
	qC/XZtLMczm2/NEGx3hKOeAtSGTPkroiwmrvEjW113FziznZxtHi0Lht
X-Gm-Gg: AY/fxX6EpmVwZRS7iyF/j427e99qCYAgSq2nl5BbUdFYp8psVma5OAKvB8LDvBheymv
	gzlyaZfkoJw3WK6IFjhT/a/JqOLiRZgZDinRwIHC28fgtdtSHKjvmqHAw4ZUzPEeBwVfc2by3n1
	Bejlf+9Szs973WIbZjkdMgk//6lNrIS7IEqw9z6PiwZBNvO78FsrIAAe0dhxiW+cnP4ieZb0yXS
	wl5mJ0Ic22lNI0+hmZE5TOTJoqmbJIccm8P0r9Poy3KsUX7HIn8bWVg+vUfB+PcEKrN3PxcAwQ5
	Al3G94OXrYUI5AgJdlL5l7yqwx2KzMnMsb5fBOCRQ8or8A7EC7Y8qyKAaAC2KzQGyNds+mHYUc6
	cbtsUFAUWXBCUTpbGzcWyDGNWyvjg5334yl78aFGKNPXLmCSRpwHP/eJlHIm13Acz4R9MR2TwKF
	WK11TKOc1DW2RMb6uBskpn2BssYfV/1g==
X-Received: by 2002:a05:6a00:1c9f:b0:81f:7e24:44ff with SMTP id d2e1a72fcca58-81f81fa22a3mr1953571b3a.67.1768384205976;
        Wed, 14 Jan 2026 01:50:05 -0800 (PST)
Received: from debian.ari ([152.58.176.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f43dfd462sm10201075b3a.27.2026.01.14.01.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:50:05 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ArchitAnant <architanant5@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: fix alignment to match open parenthesis
Date: Wed, 14 Jan 2026 15:19:49 +0530
Message-Id: <20260114094949.14825-4-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260114094949.14825-1-architanant5@gmail.com>
References: <20260114094949.14825-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ArchitAnant <architanant5@gmail.com>

Align arguments and conditions with the open parenthesis of the
preceding line to comply with the Linux kernel coding style.

Issue identified by checkpatch.pl.

Signed-off-by: ArchitAnant <architanant5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index f7b5448415ea..0044b54e7fbe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -305,7 +305,7 @@ int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 		bAllow = true;
 
 	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
-		!atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
+	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
 		return _FAIL;
 
 	return _SUCCESS;
@@ -363,8 +363,8 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd)
 void rtw_stop_cmd_thread(struct adapter *adapter)
 {
 	if (adapter->cmdThread &&
-		atomic_read(&adapter->cmdpriv.cmdthd_running) &&
-		adapter->cmdpriv.stop_req == 0) {
+	    atomic_read(&adapter->cmdpriv.cmdthd_running) &&
+	    adapter->cmdpriv.stop_req == 0) {
 		adapter->cmdpriv.stop_req = 1;
 		complete(&adapter->cmdpriv.cmd_queue_comp);
 		wait_for_completion(&adapter->cmdpriv.terminate_cmdthread_comp);
@@ -523,7 +523,7 @@ int rtw_cmd_thread(void *context)
  */
 
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num,
-	struct rtw_ieee80211_channel *ch, int ch_num)
+		      struct rtw_ieee80211_channel *ch, int ch_num)
 {
 	u8 res = _FAIL;
 	struct cmd_obj *ph2c;
@@ -757,16 +757,16 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
 		/* Especially for Realtek 8192u SoftAP. */
 		if ((padapter->securitypriv.dot11PrivacyAlgrthm != _WEP40_) &&
-			(padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
-			(padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
+		    (padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
+		    (padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
 			rtw_ht_use_default_setting(padapter);
 
 			rtw_build_wmm_ie_ht(padapter, &psecnetwork->ies[12], &psecnetwork->ie_length);
 
 			/* rtw_restructure_ht_ie */
 			rtw_restructure_ht_ie(padapter, &pnetwork->network.ies[12], &psecnetwork->ies[0],
-									pnetwork->network.ie_length - 12, &psecnetwork->ie_length,
-									pnetwork->network.configuration.ds_config);
+					      pnetwork->network.ie_length - 12, &psecnetwork->ie_length,
+					      pnetwork->network.configuration.ds_config);
 		}
 	}
 
@@ -1149,7 +1149,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			BusyThreshold = BusyThresholdLow;
 
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
+		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
 			bBusyTraffic = true;
 
 			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
@@ -1160,7 +1160,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 
 		/*  Higher Tx/Rx data. */
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
+		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
 			bHigherBusyTraffic = true;
 
 			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
@@ -1171,7 +1171,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 
 		/*  check traffic for  powersaving. */
 		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
-			(pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
+		    (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
 			bEnterPS = false;
 
 			if (bBusyTraffic) {
@@ -1264,7 +1264,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 	u8 mstatus;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-		check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		return;
 	}
 
-- 
2.39.5

