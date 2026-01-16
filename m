Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199133A6F2
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576255; cv=none; b=X/NqR+V/pBr0+P7yoGy9i9c7JMe/YTDB6O2GxibhuZJ+HBPkYZXmJ51vXs1L+JigWTdn9yco+kK8a5OBXXmtAIVOJQjitFtLzghnghf5XQ20RzcXVI1Tp0QiEdEI3SSvB/cVzIe7tdrPcoyQ7RjiX45UJt2eZ627Sd14DE7WFus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576255; c=relaxed/simple;
	bh=oZ9sNNqOdgRafiPjKfwup3jwSiZA2Xsa+BIwqKUiYVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZfLAv3S7LsIXYY2SQzJXZN0FLbQ2LUfjB6bq/u7DjlWYR+GDQ7QFwgbYDN3RXEnjI+mkK+ktfZucpehmehtSe3LTrEbTIToMChMDibMmWdlDht5rDwDC7xN6WYoMHsVDvY7abpW8im0jq7csiQikubxLQ3QJZ5rckCNquWEpIPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlYrwVuI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlYrwVuI"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so1170472b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 07:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768576253; x=1769181053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVZ5Mp/g3j9l9RDoarYSUUTifQp5wOmGbd3WsjFTz3A=;
        b=PlYrwVuIVCj6PQ5mnPl3kgR0xUc2YqmjmrZfqYC1hkUA+lzZfbjph18sL+1/DX/tv6
         1A40LGbaAWd+Ch5UNa7KUHTu+M6znAYWPP6j+PN8QlVcH/3Lv9UnVElaflWrOzxSdi3D
         oYITa/DA6UrKaMSJYSfRWOgJlC4UdjkGDtYXaNRVDmyEA4Ej3gdpaMUiWH1RK5iZybq6
         8+xYmbHWWmjRzJXKczbzPdOguHBDR3NfhflpGgz8mTFBvsqEl/4iJLdnwwLgglljyu9M
         xhWy+NX1giV45/wpZyDakzUDbB3KxTxJYNV9VdjXHd83bWJLTHJNj214iOaNeFX/DPGp
         5UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576253; x=1769181053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVZ5Mp/g3j9l9RDoarYSUUTifQp5wOmGbd3WsjFTz3A=;
        b=SYVwEgo6sH7nvTLZuQGtG1HomPM9f1z1QUQg6luNkLhl5MnAgXEP5Zqynt2LzgDy/m
         9nfglJmhrsq6T07HTXyRR97MjfyGUtbgUAtwPObaD2Tu0M36oUsB4/hiPvKesHftgIUA
         zpFl0pWKwuFS/kLlQtWQXmUXxr93+htGMGeekGJGTbVSF6yj0L6Gq3KLzyZvRSCmQWVp
         yQcPwVEVqhJdGRZFyy20sYDYjbZ2Ozyf64YVWU+YaCFCBj8IJRdkPKJEQN2XhIOGA49S
         MwZJeFtDP8FT6SXB9sheXgf/yRk9mMAiS3Ha1q/m/Gy2uxebMzVic/0j6xQoRumCSu++
         cHmQ==
X-Gm-Message-State: AOJu0YyI9O2qe/JoBDu90hKFYibt4iFWA/iuDO72VAYyYgLpJpfceEne
	RM7WArhE2I5JgsP+x/0Yjo0o/uTklsUaw3X4TVJVUEoN27ABrp3JC/YD
X-Gm-Gg: AY/fxX6vq4vpJ94Oq7Yahu4iXkbljJJaZ2bfF6HtgJEDq7KdaxEOXgZSqxWk1jheJFF
	cdPvUFRxH6CtjfGdA3zaQbDXoAeTNzHe2YgXDD8USK7zw/RPskbxS9Yfkpt33vTqbl9ITqsMsLb
	qa/hL4rfiVfGqIiZzWbnqNmrfmrTW3jRX6aNZBaarlc3RY92BJeLnMFgyofN+bhJtM3B6x1FxpN
	9vZnX5EAw2CQeZHaKZ63r6gXZk1dXibIbgTQ4/T6NAV5wqFEKFe5y0kPV1K6lKm2QOBUFM1dIXr
	zBtLSuDhAKXi4BYc+c8muwAxDfq05N+WL7mTyMuAnAYzHTps4aVDb3x8Yd9XUgZAqyp1BwG+k4e
	heLl9w9FXSUnjcLJgE+Xt/zFdBwzyDvmgdxtKBssfz45s85ZISrU98BR2u2oNOH3wypZx065Joo
	xUJ85kSA7uUKNVTSa292vQahv/paiZDA==
X-Received: by 2002:a05:6a00:ad0:b0:81f:44bb:8aa with SMTP id d2e1a72fcca58-81f9f68f1d9mr2834647b3a.8.1768576252807;
        Fri, 16 Jan 2026 07:10:52 -0800 (PST)
Received: from debian.ari ([152.58.178.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10e6ec7sm2353920b3a.28.2026.01.16.07.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:10:52 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v2 2/2] Align arguments and conditions with the open parenthesis of the preceding line to comply with the Linux kernel coding style.
Date: Fri, 16 Jan 2026 20:40:38 +0530
Message-Id: <20260116151038.23519-3-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116151038.23519-1-architanant5@gmail.com>
References: <20260116151038.23519-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

