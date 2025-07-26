Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081DE212B0A
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504426; cv=none; b=VZIIYPbaE4h+Z7DTeIb2fWXbeGv1IAhe9jzxX96lPo25474U6UQqWEW5uJZBTxRrJ81MPhCBFUb/uhG5uU3w7RnAoqwJ9+rL4xPHxpLoXbsiNCM7cxbMoH9EItuLjY1U2TDuQR2CnLB47iwj7yvJ2LmarXINVuvpYV0RUI3vmaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504426; c=relaxed/simple;
	bh=P8blFKCskYmLJJ7VIQpCA1udM8xXbyCUuJ3KFZmm5I8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HYZSE2HbXOPZUmvQXIGsCaDb7WYp7UhMGILsLbDr/G7e8msKt+pAlR1yfCDqe8/AzBTCReww6SiKElNxtLWzRLxL2hzU+FERk39k8zmHmYW1hKuHQ5HCJvfLSBkOP4bT5cJnK0sDYHpEVgRaNREWWaKZ1p/NxPQTea69WeKZmcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQlggHBk; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQlggHBk"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e63adcd6d8so127737085a.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504424; x=1754109224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiqQs9UeyD9dBqrMAhpgHRDznjYgytkYfxAEJHc3WqM=;
        b=lQlggHBkDnLhrH9X5q3qq69lsjYVnBlOVCBcXte+vomIKoeg9QMvNPRHXfIcPNvEUb
         yLiBOt4ynU9ugoy/svfMOmYhIMcuj8QgPZdTh8RAPLiSUvgrV0tJ57zTHBy1+NeggK6I
         92pZJ/hC2bioLNFuUAienQJXsh4wBR4NOI1aJDA2CFW/XT0WUZWLWanmsBcizJ7TwY+j
         MzA9Z7iJmle5cNB9uHbi5CZgTCbA8xfrzil8o1wPOCkAVP1LS9qzBME3LZhGE8JekPA5
         tJxyY1I1EBkQZdBZM/LgMujV9EZiXFvQl4hX7IE8z4j18FCXEeUUvqyGGwP3DvnXpiod
         np9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504424; x=1754109224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiqQs9UeyD9dBqrMAhpgHRDznjYgytkYfxAEJHc3WqM=;
        b=WjRzfqyLuy+Y5XYYxFeKzTtPyowAdgQZ93q8onlI3CLoczJRHZLCNz5bySVJn5bp1k
         X/OBgpW7tM+jdqhP8LTY4ubQplkTA5uxtp2sULo52LRq5seWIwJ97z1K/LfVm6haxM+1
         5RoP7w7C/bovK90dw8lRpXepBZQdCzkDSFpwkHm7FDeyWBv4DRg0Mj+2hBJVeW2RlvNZ
         jQ++BydEiy89oVlJef5xSSXMNW//bpm2B9o6a/viKjl2+QeNGBVTarvWdPdyKd0C5Emh
         y3zGk5kJVz3zK7YkQtrK14/so6X3rpvQ2AJFUizbjmOh4ozshXs+j0w4ZS+YGMt4x5b3
         uXtg==
X-Gm-Message-State: AOJu0YxDfGPaRuowoQX4LflQHxA2Y5rDmoDBmBD76+hiVkGcYdV1rrpv
	HeKzw4mpUZbyJwiFOXh9BpMHatrfzHNeihiOOxxGFY/7NVzHY8SZy3ir
X-Gm-Gg: ASbGnct+GJ8sQfjQpecmBPrSvEuUuI6urS5uJV9zp0GQfOqsnl/kUhIJbmtXPdR7u+F
	0Cg0D4YpHdal28kWBAMzJX95W42uFDLK54sdFrvPSqDAVbcYfq0unUHsP77S1iVDlirqf5XSXBN
	jCxRe3RVb+aBabj7wIqkZBW5r7OYe27qVCf28xJMbXsfn0GGdEtu56KjyjahxzCqO277uXhJTfR
	/2QSHbq9qfovK1Dsjt7W+FlZZvmUDtIuT4u0VE35zqkyfj0xORCPW+UAqQQG9aPV7TOTpQBrnot
	4xMVTJ4eMa1pjrvFqmf9NYTpvsT++UP9SGVVgYtYVeNurav0VCHCskmEc0e/9LNweI9ldjM+mXX
	+pCy/vlitpPtcfS9aQYyPtsdy+hp14KYw9Mcg09cpdwqp/rXkjE0=
X-Google-Smtp-Source: AGHT+IFX9Vsx4swIGeE82fmmkBcCcRt9S8KkzP2tx9DgvyavfwY6YXizCOrgrpkDEs9yllbkh9T/OA==
X-Received: by 2002:a05:620a:6d85:b0:7d3:f3a5:71d7 with SMTP id af79cd13be357-7e63c1beb27mr348119785a.40.1753504423833;
        Fri, 25 Jul 2025 21:33:43 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:43 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 08/20] staging: rtl8723bs: fix logical continuation style by moving to previous line
Date: Sat, 26 Jul 2025 04:32:06 +0000
Message-Id: <20250726043218.386738-9-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformatted a logical continuation to sit on the same line as the previous
statement, as per kernel coding style guidelines. This improves code
readability and avoids unnecessary line breaks.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 29 ++++++++++++-----------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0c985593ff0c..692d2526965f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -323,8 +323,8 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 
 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
 {
-	return (a->ssid.ssid_length == b->ssid.ssid_length)
-		&&  !memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
+	return (a->ssid.ssid_length == b->ssid.ssid_length) &&
+		!memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
 }
 
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature)
@@ -765,8 +765,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
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
@@ -908,8 +908,8 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 	if (rtw_to_roam(padapter) > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
 
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED)
-		|| (rtw_to_roam(padapter) <= 0)
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) ||
+	    (rtw_to_roam(padapter) <= 0)
 	) {
 		rtw_os_indicate_disconnect(padapter);
 
@@ -944,8 +944,8 @@ void rtw_scan_abort(struct adapter *adapter)
 
 	start = jiffies;
 	pmlmeext->scan_abort = true;
-	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
-		&& jiffies_to_msecs(start) <= 200) {
+	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) &&
+	       jiffies_to_msecs(start) <= 200) {
 		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 			break;
 
@@ -1618,8 +1618,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (adapter->net_closed)
 		return;
 
-	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-		&& !(hal_btcoex_IsBtControlLps(adapter))
+	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode) &&
+	    !(hal_btcoex_IsBtControlLps(adapter))
 		) {
 		u8 bEnterPS;
 
@@ -1766,8 +1766,8 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 
 	/* check ssid, if needed */
 	if (mlme->assoc_ssid.ssid[0] && mlme->assoc_ssid.ssid_length) {
-		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length
-			|| memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid,
+		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length ||
+		    memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid,
 				  mlme->assoc_ssid.ssid_length)
 		)
 			goto exit;
@@ -1777,8 +1777,9 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
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

