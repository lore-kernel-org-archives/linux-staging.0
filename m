Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D041E885A
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782054138; cv=none; b=Ff37LvBwCG2iszDUcAK6nI14xWjA1ztvIYxKJstEogHz5QLn5sj5Y5fmaLMS0znjmeKo7AFacjDkb2i5/OopMgwigqDUJJ73TY6q8p9PVIUzBwx5oBzjCDKVLzl8JNdkaDl1AllltqTAUhPwdGviCOtRYTNP1yTMeBQcdz2xq5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782054138; c=relaxed/simple;
	bh=CQthjIv8AZBpIDvxrdt4C1Foll3V3R/LWLX7xKINv+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYne4QXcP4ymlLSYUnHl1ocb4nfbkK++c2kxKnj6cYQ3Cj8P6FygzMw70p+Y5Iv/K6vcZJDK1H3qNW4Q2NLGRi6M7gYNOJgeLe/lJXHyY7b3cJ1l7lxzQow3Ckx0MA9hJANZSNSc8dXW3zl0DbCFxHr7Y+e36+zvzzgpDQWZ1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBmTRxvc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBmTRxvc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4908b92904fso50005775e9.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782054135; x=1782658935; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/1ZvD9wSv90D12rzGmY2UzhSP4tlY7IuN/M3rUUTzY=;
        b=lBmTRxvcWuYcx6V5yrL4KU0xqAYcVS7YtPTZZYF0ZbOcBFyOmilqlYa6MGTIg9Jx+1
         bOvGjf7lAOEwdxG3vzmVKftx8MUU6eBLQ6ePD75LnjF+QzD+S0AGlyOaBD3kI43xU7No
         goUsSd4XNJDRjzcw7Jq2T+S85UStFGsuKRllP7x1ytqga8/SfWY8pK4/piS4+XxWt8CV
         WwH1Z0nhaEDWBfbNR7ldO69Al/5dM/WddSqaZ7KRjMN2V3sIFXd/ISUVrT3ZMACjB36a
         YTf3HEYOQmmpZNETeqZSQyxABQZTPeBHmclkcAC038SyStIV058oxHFcVA1sExKILsmk
         UbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782054135; x=1782658935;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/1ZvD9wSv90D12rzGmY2UzhSP4tlY7IuN/M3rUUTzY=;
        b=Yl3NnAlOdZpgqn+zxM29jz9hCvEhIAIemGu9sA8ivKJZ+TityUKzLZdxMTUmNnydve
         tPKKdz8fA92gJxA/OCABZXQTU9Obpzo3bNbSWlNSkO//ugr5OpXwl7e+CmfTTTyfacs6
         FM2GIsnt92eBJWNh5eUaDM6E8VMw38sf3uwCWXHcowPC6w2SxPFii8rDEjsGmPuBgrz1
         a15Z7AmUocayuL296VfLUtIXUiPzKzomrhsWF9cyUoeEETMa3i+5wfj2dmTZaYJWYiEM
         S0EfMS6Xvam1qR6Fu+O7UDJf9kYfz6TqX387Yeeaqk2gcbjYznW8E4ymfr65tZLMD2vy
         XozQ==
X-Gm-Message-State: AOJu0YwLBlnrkGGSES/8YeGubc7NZ4BOkABwk3ZaHZyoY3JaMVs7WtRd
	HtG2CNiT8f1eU7L/IGWuADQrdVDZwqio4uD+7PeLTuWXgDU1olqVm12g
X-Gm-Gg: AfdE7clFeF7oI/gJNLrTS0tAUTPLp26souY6RZx0LdY5nUS+sLvQq1oFeT7x0o+8/kP
	z4BpDSV0FjSbnzMDte/2RoRfUFDVUB5sdbjOyAmT+wzkx4WUExR6wkRsfZId1GWa0wnn6S8tNiN
	o+8TyMyywTFSirzgO4uszTSTymK+5aN/9e9WhBy2xkcMgEdjE6yxFOx+V5PtdXXoFNEcIivlucA
	16tWRJzqfdnZiiZv4pOJfulEkO7hw5MCQRN0jj++LfTnn1uVqbbB+EVVeZ/4AkDJpVY3JLQH49N
	c2itn5hBsu4vS67afBNXGhgdtfpWG56C0193fYxmoC8SlQ/CE4hQjdcCJReNhNCbwSvORTwJyfi
	uDaxHcQKfuhX77ZGRHr+m/PbvT7lbvQjEEnk4NNVInaFbmiFvXrRQb07P3QdAQZ4eAgwjTmmhwn
	bsP/nQU1npTKCQzrY4xigRsUNOEvaNQSGmTSGK7dVpSK3/xiz4/h7Mm5R3qBsvU8Bk9mg=
X-Received: by 2002:a05:600d:6451:10b0:492:463d:b2af with SMTP id 5b1f17b1804b1-492463db33amr92235535e9.31.1782054135191;
        Sun, 21 Jun 2026 08:02:15 -0700 (PDT)
Received: from localhost (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15535sm249091575e9.3.2026.06.21.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 08:02:14 -0700 (PDT)
Date: Sun, 21 Jun 2026 15:00:56 +0000
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: put logical continuation on previous
 line in rtw_mlme.c
Message-ID: <ajf8qOpXZ9fFFczS@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Move logical operators from continuation lines to the previous line
to conform to the linux kernel coding style.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4fb74729180f..e3a17b5cbbf4 100644
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
@@ -751,8 +751,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
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
@@ -925,8 +925,7 @@ void rtw_scan_abort(struct adapter *adapter)
 
 	start = jiffies;
 	pmlmeext->scan_abort = true;
-	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
-		&& jiffies_to_msecs(start) <= 200) {
+	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) && jiffies_to_msecs(start) <= 200) {
 		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 			break;
 
@@ -1574,8 +1573,8 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 
 	rtw_mlme_reset_auto_scan_int(padapter);
 
-	if (pmlmepriv->auto_scan_int_ms != 0
-		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
+	if (pmlmepriv->auto_scan_int_ms != 0 &&
+	    jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
 		if (!padapter->registrypriv.wifi_spec) {
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
 				goto exit;
@@ -1605,8 +1604,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (adapter->net_closed)
 		return;
 
-	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-		&& !(hal_btcoex_IsBtControlLps(adapter))
+	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode) &&
+	    !(hal_btcoex_IsBtControlLps(adapter))
 		) {
 		bool should_enter_ps;
 
@@ -1750,8 +1749,8 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 
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

