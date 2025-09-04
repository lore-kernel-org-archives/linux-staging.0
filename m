Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255351FE45D
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952113; cv=none; b=gaKhaY1F4QB7m4kj7uVcHaaREPPz7GPVn8Te/uT4FdXEnzs29WWUu1TOtqDjltTMU6x0I855o/xxDriQfFHz5zowN3rEAqFeU4tTdyQit/+UjLluvEssIhkVzlxvBqs9brCbA7eSWisH+hRP6BIH3bujsURwKPhCAdXMCj+ymmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952113; c=relaxed/simple;
	bh=Xf0LccqCHjcRpc9m4rzbi0aDOX4yjEMRJ3TSSqCdCAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RgTFsRbk0FmdcUIqoRmJYTeGryIcPOSIGsEmiU9QAbkTCxAeYgswxpzTi8+UKrH14hz5thlLtq2qtszqHWs0No/7dlA+yWS6Q36c9bWgdsB4PH0jbTb8wgJqMmfVq+oM0R6LGHxHuDwL7wKmtnOsHo/DQ1k6huv2Lf5cEr8sdds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moEY1f/4; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moEY1f/4"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-72226768824so4328416d6.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952110; x=1757556910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDqO+UoPGgDbKDZcftZWgsNo4sXFXXjdDKh/zegscDg=;
        b=moEY1f/4UL00cTbtdg7fvKvGBf4UAehRYnj5UWuYyMWjes0g5jhufHekg3+CkxWGmG
         A350sH8GyU4QoM/3nWsRHBG1c1uAkRoNMclKa+2BM6khwtpC1NTcw3AFpCVoCqLfi19+
         ga6R++djUNARBjC21Gm0PFRhJeKA055GGDJMdjyIkHkwI/xXr0w0evo4Ul9JjiF1JnK3
         gjVc0VDCUU8pC2w5akVDZZQ/tLhWeuR6dYQqMPdmwCjM1qhJ+W03qZS0Jy9Cc1xQIH/X
         0oOaAX7ahGDwSMuMSDBxYWo3GOgMGTNuB5++HCRLbVvFYSBh1Dtt0KW/JbD3iYuYwqlH
         6WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952110; x=1757556910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDqO+UoPGgDbKDZcftZWgsNo4sXFXXjdDKh/zegscDg=;
        b=Gs5xesTgo5QgaRDd4QIYQWCkMRyB+OX8agPo7qURl5hj48MwyA2917hXdtxeUYDO2S
         vrXbnOcSWhI+MM/MuYioRBfJ/l5NZ0ZMcr0d6TVAjfWK23jqYlWPgLA62Yhd2LOmngF2
         RgBfN7GAL+nPk0aDqmSLIjeGyeZhs9+TuR7gv5RDyqLmgsecYmKKOZ8rtuOfPN5vhtmo
         EF3FZQpXz0xdibd+tCs6cPOmzAXN5t+BuYJR2kdIbYmg94tBBE0h6jXIdL+udIzbnqTF
         1F6qsjbMIj6346hHdIAclZBiOiFXI50SEVCyJd9I/h1P/dZ6Qk7obTyNTBkw0SSPNvPI
         iQsQ==
X-Gm-Message-State: AOJu0Yy2/5Gl9v/6xeyAKdslsOVcJOU3G7jcBCtDoKpgUgp4+q/K5Zz6
	VEl1K74+Ql7+X4dFZbU5/qLNdHE4szqa0ijxpUiF/lSGwwTpSuFndl9G
X-Gm-Gg: ASbGncudAzy1e3Ihgt8V16VKlweH0MlQuCCKwWD2ywDDC4cqYagoQTDhIyDOAK6QBWi
	5JfLEFBwyCxyUCwLerux7EC5iG2VMoZ9BqKoT0enbCdTxBM8Ywheyel68ie64j0jdu/IWOlOo7X
	j8DQNyB/Yn+S2vaFsIS7DEgZJFWaN9j/UqsJQwazavTD5+35idsXZceC77keNGN20k+OFrHNTwf
	iFWW4fyhi4DNg9FZnCufVY54H4vbFx2Bm27CX1yQ++6/ZOVwOuyOYbt9k01DWj3kGfdqFKs1PJ5
	feWvzdKNAPsAe9V89ZkXnw5mXOd/yyWyTsA4CcEM8YeEJZ+wkUfEp74PykQJEh3/wRNnYVTBpoj
	xC6TgEP4RQT+Wz8EKeyPAuJzjvRCDUMWcwXbFfn6pebtDl/YE0ac=
X-Google-Smtp-Source: AGHT+IGeng4/Y0t+Er/V1I1daQN6O1gDkI/HO4MmnZunycC2bX7hbkFmgXVNheuXbC3UUKCpofhzOQ==
X-Received: by 2002:a05:6214:1307:b0:70f:aa71:15b3 with SMTP id 6a1803df08f44-70fac93979amr218166526d6.60.1756952109906;
        Wed, 03 Sep 2025 19:15:09 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:09 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 05/16] staging: rtl8723bs: fix logical continuation style by moving to previous line
Date: Thu,  4 Sep 2025 02:14:37 +0000
Message-Id: <20250904021448.216461-6-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
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

