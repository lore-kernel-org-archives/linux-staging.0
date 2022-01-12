Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A62C82
	for <linux-staging@lists.linux.dev>; Wed, 12 Jan 2022 04:22:09 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id t18so2240263plg.9
        for <linux-staging@lists.linux.dev>; Tue, 11 Jan 2022 20:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kboHIb2qimmeziUoT1eD5XtRn5oDOkA2cacDUt27T1s=;
        b=F+xr3MeBBBwQ6Bn32wVfIBpyKp3OeuNBgl81G53UM3nhoPGi+bh45DIUWSnB+tJWZa
         kj5mksiXv41PBrSIvoSpHSgdP27M5/7RsUVCdBKGCt7DitiLtlcsO6ebNCPSxrAusHsM
         86eYIY8Eu3YfbfpfTH7yWPD2bE+5viurSLAIE7A+yLKjH47U7F7sWo47ULefQEvgtJ9K
         lGbf2VDkdxRolr6itpieS7eX5vv7OoBOyHP71TPmh46StPVnUaIeTDoGl41NrWhbkP1M
         50P5Tqa+sxsknLlifbnLnV34FtLqOaYfRBNH8zNWyD6AYoTwYbuuPQVTX/iK+UkmAqot
         79UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kboHIb2qimmeziUoT1eD5XtRn5oDOkA2cacDUt27T1s=;
        b=pdNbBrv99Vlpei0uK1yI0WY+IsOetRufnH6gPyGQQ5vWGpAhbDdY1Zes5WPgo6Lwzc
         POr37KGf0HajKrrAKVhLj42HYDbp1yP/xzCgFaGuRs/naoksAd/aRLBHaVzuuWavIQrF
         0wuH4Wq+hRlE3JL945aM6ca9gXft8dbCYpK7WssYGyoN80OuwEni6jUn3z8FHcvlFQmK
         3AKdbUse+UBTz7fZF2hJPm5EAFkkF5N7ciyE5ic15HPCBTXpa1PGviQrktLF28XsgM3e
         6QFyN7ck1ytbjYwmIXbSLuVeOR6uxcaI9Qe4wTBNNnmWzmDJA1+In7fdsj9adIt63zrc
         PlQQ==
X-Gm-Message-State: AOAM530YVWzmvL6E3EaUcNSEhrBg+0RxREYOAaeJ1BP4t0tNErIeDAxT
	EQYGbYg5+j5V0FCUefT/zHLGJmfOOemr+Q==
X-Google-Smtp-Source: ABdhPJzVGvNhr1ihwiJVs3pL1YYkNtBu1Z5wvKSit5bZKeiMwVRvn8UYqCjK9P9ApU23ZF8F1B2NLA==
X-Received: by 2002:a17:90a:8b81:: with SMTP id z1mr6817104pjn.83.1641961328550;
        Tue, 11 Jan 2022 20:22:08 -0800 (PST)
Received: from localhost.localdomain ([115.99.137.58])
        by smtp.gmail.com with ESMTPSA id t207sm11237747pfc.205.2022.01.11.20.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 20:22:08 -0800 (PST)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jagathjog1996@gmail.com
Subject: [PATCH  1/4] Staging: rtl8723bs: Placing opening { braces in previous line
Date: Wed, 12 Jan 2022 09:51:58 +0530
Message-Id: <20220112042201.5056-2-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112042201.5056-1-jagathjog1996@gmail.com>
References: <20220112042201.5056-1-jagathjog1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Fix following checkpatch.pl error by placing opening {
braces in previous line
ERROR: that open brace { should be on the previous line

Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 40 ++++++-------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 5157b5b12597..81b548ad4e30 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -113,13 +113,10 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 	struct ieee80211_supported_band *spt_band = NULL;
 	int n_channels, n_bitrates;
 
-	if (band == NL80211_BAND_2GHZ)
-	{
+	if (band == NL80211_BAND_2GHZ) {
 		n_channels = RTW_2G_CHANNELS_NUM;
 		n_bitrates = RTW_G_RATES_NUM;
-	}
-	else
-	{
+	} else {
 		goto exit;
 	}
 
@@ -135,8 +132,7 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 	spt_band->n_channels = n_channels;
 	spt_band->n_bitrates = n_bitrates;
 
-	if (band == NL80211_BAND_2GHZ)
-	{
+	if (band == NL80211_BAND_2GHZ) {
 		rtw_2g_channels_init(spt_band->channels);
 		rtw_2g_rates_init(spt_band->bitrates);
 	}
@@ -235,8 +231,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	{
 		u16 wapi_len = 0;
 
-		if (rtw_get_wapi_ie(pnetwork->network.ies, pnetwork->network.ie_length, NULL, &wapi_len) > 0)
-		{
+		if (rtw_get_wapi_ie(pnetwork->network.ies, pnetwork->network.ie_length, NULL, &wapi_len) > 0) {
 			if (wapi_len > 0)
 				goto exit;
 		}
@@ -244,8 +239,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 
 	/* To reduce PBC Overlap rate */
 	/* spin_lock_bh(&pwdev_priv->scan_req_lock); */
-	if (adapter_wdev_data(padapter)->scan_request)
-	{
+	if (adapter_wdev_data(padapter)->scan_request) {
 		u8 *psr = NULL, sr = 0;
 		struct ndis_802_11_ssid *pssid = &pnetwork->network.ssid;
 		struct cfg80211_scan_request *request = adapter_wdev_data(padapter)->scan_request;
@@ -258,14 +252,12 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 		if (wpsie && wpsielen > 0)
 			psr = rtw_get_wps_attr_content(wpsie,  wpsielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
 
-		if (sr != 0)
-		{
-			if (request->n_ssids == 1 && request->n_channels == 1) /*  it means under processing WPS */
-			{
+		if (sr != 0) {
+			/*  it means under processing WPS */
+			if (request->n_ssids == 1 && request->n_channels == 1) {
 				if (ssids[0].ssid_len != 0 &&
 				    (pssid->ssid_length != ssids[0].ssid_len ||
-				     memcmp(pssid->ssid, ssids[0].ssid, ssids[0].ssid_len)))
-				{
+				     memcmp(pssid->ssid, ssids[0].ssid, ssids[0].ssid_len))) {
 					if (psr)
 						*psr = 0; /* clear sr */
 				}
@@ -374,8 +366,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 	int freq = (int)cur_network->network.configuration.ds_config;
 	struct ieee80211_channel *chan;
 
-	if (pwdev->iftype != NL80211_IFTYPE_ADHOC)
-	{
+	if (pwdev->iftype != NL80211_IFTYPE_ADHOC) {
 		return;
 	}
 
@@ -383,14 +374,11 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 		struct wlan_bssid_ex  *pnetwork = &(padapter->mlmeextpriv.mlmext_info.network);
 		struct wlan_network *scanned = pmlmepriv->cur_network_scanned;
 
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)
-		{
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
 
 			memcpy(&cur_network->network, pnetwork, sizeof(struct wlan_bssid_ex));
 			rtw_cfg80211_inform_bss(padapter, cur_network);
-		}
-		else
-		{
+		} else {
 			if (!scanned) {
 				rtw_warn_on(1);
 				return;
@@ -473,9 +461,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 		roam_info.resp_ie_len =
 			pmlmepriv->assoc_rsp_len-sizeof(struct ieee80211_hdr_3addr)-6;
 		cfg80211_roamed(padapter->pnetdev, &roam_info, GFP_ATOMIC);
-	}
-	else
-	{
+	} else {
 		cfg80211_connect_result(padapter->pnetdev, cur_network->network.mac_address
 			, pmlmepriv->assoc_req+sizeof(struct ieee80211_hdr_3addr)+2
 			, pmlmepriv->assoc_req_len-sizeof(struct ieee80211_hdr_3addr)-2
-- 
2.17.1

