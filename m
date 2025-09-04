Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EBE1D5141
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949195; cv=none; b=E6+fDdWLDbEOzDjTO/jrKBgbMtiVLCDOnr2698y52dn0gKv9AlaTvoQ09C4U0DXxacFPbSZZEkwTiwz74BpEn0O4mKPyJq2ZImQ1cr5Ni9+tSPsv5xACy6ZTpLKUaQnMmSebfxSH3zWm2BJpnNifrkUjtFOSU+KdBh8pt67iTZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949195; c=relaxed/simple;
	bh=Xf0LccqCHjcRpc9m4rzbi0aDOX4yjEMRJ3TSSqCdCAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Es066d5DC0tngZbmCkmdr1VypgEANCEsDfkJUPbGmNnVhaeeEwqNkgaHfaJcohJ9CtBvk9+z3uXZiuMrHSHJaUDmAmSRe6FNVTnNcTi647cSPPgF6lFtcFsU/JQIW0FiC6vJLM9WLDrKmhbwcLfMUPmP3WjlESujkNrfAWdI0JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mg5ZpuNy; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mg5ZpuNy"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b5d5b1bfa3so6003251cf.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949191; x=1757553991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDqO+UoPGgDbKDZcftZWgsNo4sXFXXjdDKh/zegscDg=;
        b=mg5ZpuNy6FglDd9xRq6TLLz4OMW80Pb/wvNSPsT8Oe0/r0Q8/4WiXnR7mx6oQrEGPa
         ZD6k5DyLiTuX/jnV49hs7sVwtnsKQ9WYgFAAiIY8EYltaQRLRL6Hr0EcGSdz/H3bWaU/
         4PAwXDHHRsKce12aJWAV/n8LG9EG1ey0/cCTEIz2ravuJ+2PayalAVQlK69WJUlEZ4Nc
         xuyel42+Tp0t9FAQ+OKL4s/o0X8R5P3GhRcoUWA58PeEJnO3gm7DgNnwlTLoQ1vYVHnL
         vtIV50k//FEEy9Io7aLOjd4tWMDF8kwKw8FeigCH710CJtt+C0CgarB026c2zpsW/KBT
         I3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949191; x=1757553991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDqO+UoPGgDbKDZcftZWgsNo4sXFXXjdDKh/zegscDg=;
        b=Bfrit3Dc9FLlaUZk5xsxRT2SLIHi4AotQsrQ/WcDD4CFmwBL5f5H8OAonFdtCDYM+x
         DJTjtQjC1KWREPvgCtR7AYMvFZ/LN9ICKiKlw9OE0Nw2xQJjrNEOOXW9qCuwP/YCkRFv
         wT2cFd1ywmGdU0AWe71GrAK5QhOUoq+lOAdu68UvqIRY53cVD7roXjji+B0raanDo7M2
         kOneQQF11wzkev8hrCtE8W6s/+2q56cyMXEn+j8BbwmAcuxDy4Rs7EI5cmu4GgWgrAeZ
         Vdp8xBY40Ndf61PJLul0nYMMjex0x0GFESq8si928701KLjg+yPErgb1W9n1YIl27xkJ
         7IoQ==
X-Gm-Message-State: AOJu0Yye6rQfBWFTvUoExM5/qNrMr6XFEiL5QdOWH5gjGP85/7X45Rr4
	VjWCvky77gpJgByxM6myRUmtqRhPiSwqArESOPKi33U8P1INYjxFBDt1KHz6Lg==
X-Gm-Gg: ASbGncvRzv0PoorqlMzDpaLMm6TJtvbZOiJlt+UAAJjSrqP/6TkEoo07t1A4Qf37g94
	7cxt+nNXnM1WMm5/kk1Oa2S+Tk6CL+0zBsr/WFWwF9i727Jx2IOIJbZdMBUvnBMHQe+UJk8wmnC
	9ryK8M2+ZBBa9tCmo2HIMTZpH8ibY85u7dr1JmBBditdpLm8MU7tv5L3E3NywzN3kuQnKc9+ixR
	1FNvT7VDDaAZcTh4C7SvnFpN+NOwvyI4ilnCDcs+C5LySkz5GOFTvLxHMlXRGHNseuhMKnzOgRm
	HB7rLWRSNx16SSLvtEnqmfbgQxEQvx1+Mu3PcSCEG9QXrp9WRAhYnblISHg8uvkuR+Z3zaQsomn
	cq5orDbRkgTYFc/ZdZ234v1i5w83zFB7KLO72jF4zkGvSYO/+oRSsF6M8q2Mnmw==
X-Google-Smtp-Source: AGHT+IFcguj47NJvQCskQGxvudvLVBjK3M6W78q/3sb6x+7iqwaAVb9HjBH4w2kpk4LIWc+w731iYw==
X-Received: by 2002:ac8:58c4:0:b0:4b4:8fc1:cd2b with SMTP id d75a77b69052e-4b48fc1d9c6mr52381131cf.14.1756949191485;
        Wed, 03 Sep 2025 18:26:31 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faf5sm38423266d6.65.2025.09.03.18.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:26:31 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 05/16] staging: rtl8723bs: fix logical continuation style by moving to previous line
Date: Thu,  4 Sep 2025 01:25:25 +0000
Message-Id: <20250904012529.215521-6-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
References: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
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
index cd41f713a52e..2ed7f71e41d1 100644
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

