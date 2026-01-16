Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676D303A07
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579087; cv=none; b=Z8I9/bdxQ0chj08aGRlkc8M4oYPYZupg+Lnd5bxy3++bL7tiH+Z3HboQ0A+e2mOqCT3ETeRVM1J4lgVj6OwjFZlyryxHcRPrOZAtCWi7firAJ9xYNAih7vFL8CuHbgwTKDbTMYNlRIEXypqYGh+ZiWeYcJExn1AmzghGwvozkeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579087; c=relaxed/simple;
	bh=mpllJG6gBKBRG7ElTrNzkI2S89D7n4qBQRED2RY/GDU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XeMEzYUW6Z2V8/6SXMw9zH8y4iX1LQRipQN7r8PtUubSTjXKtX4uk9VXVo6Ju5uKqBnTDxkrZoQcIGS30dAsyJa2p9jCdb+vLeAdrSuYDvKlXvfFaMk7JI03utZlnW6bU6tBy81vZtdXntEDMMQdGkvEbKmMgs7nmkNLSa1fydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+EyDpkT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+EyDpkT"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a1022dda33so13457345ad.2
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 07:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768579085; x=1769183885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHo6mmSV+2Dc3DTnSEGaMMsOirtcmLWxe/FZsBH0U68=;
        b=R+EyDpkTzPkavnnv8HQO5JV98ko0rkqdaAXn4vKfhTTCwECWjbMhGOLl+aXrGhJnC1
         ffsQokxMloX6CX7hqZk8aTiVqSphblFraUZANOoeBZdxrdtVRWc9r067GZPBXUnOk4WI
         cNrKc/CBFoyagvKutRNTJBYfeFTFWueI6GFQ6H42uk4SlFJtCJWRLoMHzk02WM32qSBj
         VZH97xLotYEw0AxMPRNgfM67D/hoKtJHmBjObSXNsQ2uAnQ6MUB4tXFqO/ET3QfipKAG
         DM737LjPmHUnKa6inaTyvcOXYDTjbNEnU3ABy9OKBdls+vuTBO4lp4ueHyvsUPyO4ghr
         dQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768579085; x=1769183885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHo6mmSV+2Dc3DTnSEGaMMsOirtcmLWxe/FZsBH0U68=;
        b=Eq+bxXDXBDgeJUWmurVZ46rGSQBLFxL75ehapjPt4qNoFe6zVR27j5LMpCb1crNr7j
         xkEAxTH7tihBhIxLEQJZassMw/gjF6Iqa75oxc4QpP4IP/v2fOvd9Dd15DokzrNRu/Aj
         r/kTE9CjPui/5lOplkaK1vmN4wVnxdQPT9NVoMjdk399Nbzx8mrxWlKw8eXZnw20r73l
         EF9jv0xnCyGSqX80xxM7lB4IJ5qt25n/2OOL3xImGMRoPG5Ufxu5wFTPzLWlldUqAj8x
         SQPnXmdlNa/AXlTtUhwHZyd1gZN5pSeF0CgItEiEQhTFKb54YohEtplGJWdVqpmeIXzZ
         UWYg==
X-Gm-Message-State: AOJu0Yz5ZKvi1FfhqGkCCNcttX4vguB8hhkC2v37qWQLAy50tGb0q/7r
	9X4/gc4taWkPKiqZGzJxxLUbUSNvVxUmWbawGfGkfvzihWd979XoaF23
X-Gm-Gg: AY/fxX5/4J2rO+Ev9vkAjWLTatv5DsGA6mCJs7xztMEWuFUdhI4zVvqC6BLL41v9xy0
	Alk+Hb6TqhQbfs96jfgsI3cwmxtRWk4st9VxJtV+YuHVsjKhuK0c31qT6cLN5rLADgu1OdJoA7Q
	rrxSR16OxUAq9D4jWv0Ad0fi6gY4eHvXrHvKfxDcIu5qnKdKbyoSVoVDQJOIQKz2tXtqUeroCtO
	yphgCuONW3V1pze1vNz7TztPr7YgrV6Dudg3WkjIndiq3+/1nux8lO+A8qXguhxL9pcOrS9kpfg
	JrpPEyBcaLLsTuAGYGNa7N6gmjFS4ee05g+vbzB135AGusdz/R4FkQ0M2RFNn27XzoBfG9H1TSk
	1r7CGGZ+jcpHBSwZKquACRvkPADoeVQZe7MPAc43bKFlEFwCJgX8Swp9OHIyDP65Y+RNE9fDSpK
	I6vir/2ytQpjHG+SJL1X5eL2AnzcYlgg==
X-Received: by 2002:a17:902:d50e:b0:2a0:daa7:8a57 with SMTP id d9443c01a7336-2a7175cd269mr40820265ad.30.1768579085281;
        Fri, 16 Jan 2026 07:58:05 -0800 (PST)
Received: from debian.ari ([152.58.178.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eee4fsm24738885ad.42.2026.01.16.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:58:04 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8723bs: fix alignment to match open parenthesis
Date: Fri, 16 Jan 2026 21:27:50 +0530
Message-Id: <20260116155750.3173-3-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116155750.3173-1-architanant5@gmail.com>
References: <20260116155750.3173-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align arguments and conditions with the open parenthesis of the
preceding line to comply with the Linux kernel coding style.

Issue identified by checkpatch.pl.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1f5b3ea1f272..27da987d881f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -306,7 +306,7 @@ int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 		bAllow = true;
 
 	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
-		!atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
+	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
 		return _FAIL;
 
 	return _SUCCESS;
@@ -364,7 +364,7 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd)
 void rtw_stop_cmd_thread(struct adapter *adapter)
 {
 	if (adapter->cmdThread &&
-		atomic_read(&adapter->cmdpriv.cmdthd_running) &&
+	    atomic_read(&adapter->cmdpriv.cmdthd_running) &&
 		adapter->cmdpriv.stop_req == 0) {
 		adapter->cmdpriv.stop_req = 1;
 		complete(&adapter->cmdpriv.cmd_queue_comp);
@@ -524,7 +524,7 @@ int rtw_cmd_thread(void *context)
  */
 
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num,
-	struct rtw_ieee80211_channel *ch, int ch_num)
+		      struct rtw_ieee80211_channel *ch, int ch_num)
 {
 	u8 res = _FAIL;
 	struct cmd_obj *ph2c;
@@ -758,16 +758,16 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
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
 
@@ -1150,7 +1150,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			BusyThreshold = BusyThresholdLow;
 
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
+		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
 			bBusyTraffic = true;
 
 			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
@@ -1161,7 +1161,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 
 		/*  Higher Tx/Rx data. */
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
+		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
 			bHigherBusyTraffic = true;
 
 			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
@@ -1172,7 +1172,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 
 		/*  check traffic for  powersaving. */
 		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
-			(pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
+		    (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
 			bEnterPS = false;
 
 			if (bBusyTraffic) {
@@ -1265,7 +1265,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 	u8 mstatus;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-		check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		return;
 	}
 
-- 
2.39.5

