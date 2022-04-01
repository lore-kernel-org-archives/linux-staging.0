Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0917B;
	Fri,  1 Apr 2022 14:53:57 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id hu11so2188366qvb.7;
        Fri, 01 Apr 2022 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Qd7+UMiN3Jrll9fNOSYkpHLr2EKG3gIqE6IEorWFPTo=;
        b=frhnIWwX5xEJfxxbkE/n9nEd6dE/TeDbW4SLwUwBveOv2aw7Dz1nk5aApc1nvf8271
         pLwhEcIZXPWFnuLMEPuh4Xo+HviPV7y6uyxVowzlLGed/+eMajBWaaoyAAb+HUfQ0A/1
         rCJ3N9Cn68SJFgAWkQL0H2BKx1CLbjuLYO5NPKkooHJ7k9A4nMNvdPuXkqfGRwpFyJFa
         akkMzxvvoSPZg0cAUJFX8gwoIm6Ib6peqfsZegtq2NwpLcbySC8S6ttsC5Zq1T0OpB5V
         GS4fTPDFal55l3KY9ramCBrqwpX61mlvQAkawS6oydb1GnExWqjrJ6y8xFlkhuCpxuSS
         hxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Qd7+UMiN3Jrll9fNOSYkpHLr2EKG3gIqE6IEorWFPTo=;
        b=pCIijn7R/W4XmlzU75zAz8cmorTMwxyoTRR1GjYR+ERsFzxI2eh/vGpGdK4Llrayz9
         bZct4LUfD0Iixj1qLiVxvIUF9CkPbkaeOzkSe71QMjyxcSin1Gqy0CuWdh49xZesEVTZ
         kOMv2d1cNgo+cjkuSMOR67ORvnNYcKJPZ/EwIguDmmr9T1nw/BcwmC/FwW9qLfM3dlNF
         WxOiL8w67/U/2AJPKkRx0eH+3APUOl6eZ6qDxzO4glJXEkRC5u8ViWQJIe+8eux/dut9
         bDE7oJA6535GUD0BlYChVExv/aC5HVXzdO80N2QhAKkIBR9ROT/2UWrgYOJtqmdW2EiI
         ZTuA==
X-Gm-Message-State: AOAM5316L3N8tD17pSmpzx63VequijMbcmrhwnlWw1xErU6qsAl8n8x6
	dge4L5FnhMxUwg6Z6Ory4Zo=
X-Google-Smtp-Source: ABdhPJy03H5LmOvAHNjNyWo4gCVB0lYUhUS1sgLswcBnnNIHvMqyZuLbnB1sbi1joMr9KqFX9Idebw==
X-Received: by 2002:a05:6214:2388:b0:443:865c:5623 with SMTP id fw8-20020a056214238800b00443865c5623mr8396733qvb.72.1648824835916;
        Fri, 01 Apr 2022 07:53:55 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id i68-20020a375447000000b006809e0adfffsm1511818qkb.25.2022.04.01.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:53:55 -0700 (PDT)
Date: Fri, 1 Apr 2022 10:53:50 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: wfx: change variable name to be consistent
Message-ID: <20220401145350.GA45053@jaehee-ThinkPad-X1-Extreme>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change variable name to be consistent with the naming conventions.
ssidlen was changed to ssid_len and ssidie was changed to ssid_ie to be
consistent. This makes the variables more readable. The other ssid
names in the code are separated by an underscore. For example,
bssid_filter and num_of_ssids have the ssid separated from the rest of
the words with an underscore.

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/wfx/hif_tx.c | 10 +++++-----
 drivers/staging/wfx/sta.c    | 20 ++++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/wfx/hif_tx.c b/drivers/staging/wfx/hif_tx.c
index ae3cc5919dcd..9c653d0e9034 100644
--- a/drivers/staging/wfx/hif_tx.c
+++ b/drivers/staging/wfx/hif_tx.c
@@ -280,7 +280,7 @@ int wfx_hif_stop_scan(struct wfx_vif *wvif)
 }
 
 int wfx_hif_join(struct wfx_vif *wvif, const struct ieee80211_bss_conf *conf,
-		 struct ieee80211_channel *channel, const u8 *ssid, int ssidlen)
+		 struct ieee80211_channel *channel, const u8 *ssid, int ssid_len)
 {
 	int ret;
 	struct wfx_hif_msg *hif;
@@ -288,8 +288,8 @@ int wfx_hif_join(struct wfx_vif *wvif, const struct ieee80211_bss_conf *conf,
 
 	WARN_ON(!conf->beacon_int);
 	WARN_ON(!conf->basic_rates);
-	WARN_ON(sizeof(body->ssid) < ssidlen);
-	WARN(!conf->ibss_joined && !ssidlen, "joining an unknown BSS");
+	WARN_ON(sizeof(body->ssid) < ssid_len);
+	WARN(!conf->ibss_joined && !ssid_len, "joining an unknown BSS");
 	if (!hif)
 		return -ENOMEM;
 	body->infrastructure_bss_mode = !conf->ibss_joined;
@@ -300,8 +300,8 @@ int wfx_hif_join(struct wfx_vif *wvif, const struct ieee80211_bss_conf *conf,
 	body->basic_rate_set = cpu_to_le32(wfx_rate_mask_to_hw(wvif->wdev, conf->basic_rates));
 	memcpy(body->bssid, conf->bssid, sizeof(body->bssid));
 	if (ssid) {
-		body->ssid_length = cpu_to_le32(ssidlen);
-		memcpy(body->ssid, ssid, ssidlen);
+		body->ssid_length = cpu_to_le32(ssid_len);
+		memcpy(body->ssid, ssid, ssid_len);
 	}
 	wfx_fill_header(hif, wvif->id, HIF_REQ_ID_JOIN, sizeof(*body));
 	ret = wfx_cmd_send(wvif->wdev, hif, NULL, 0, false);
diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
index b1e9fb14d2b4..03025ef7f1be 100644
--- a/drivers/staging/wfx/sta.c
+++ b/drivers/staging/wfx/sta.c
@@ -392,8 +392,8 @@ static void wfx_join(struct wfx_vif *wvif)
 	struct ieee80211_bss_conf *conf = &wvif->vif->bss_conf;
 	struct cfg80211_bss *bss = NULL;
 	u8 ssid[IEEE80211_MAX_SSID_LEN];
-	const u8 *ssidie = NULL;
-	int ssidlen = 0;
+	const u8 *ssid_ie = NULL;
+	int ssid_len = 0;
 
 	wfx_tx_lock_flush(wvif->wdev);
 
@@ -404,21 +404,21 @@ static void wfx_join(struct wfx_vif *wvif)
 		return;
 	}
 
-	rcu_read_lock(); /* protect ssidie */
+	rcu_read_lock(); /* protect ssid_ie */
 	if (bss)
-		ssidie = ieee80211_bss_get_ie(bss, WLAN_EID_SSID);
-	if (ssidie) {
-		ssidlen = ssidie[1];
-		if (ssidlen > IEEE80211_MAX_SSID_LEN)
-			ssidlen = IEEE80211_MAX_SSID_LEN;
-		memcpy(ssid, &ssidie[2], ssidlen);
+		ssid_ie = ieee80211_bss_get_ie(bss, WLAN_EID_SSID);
+	if (ssid_ie) {
+		ssid_len = ssid_ie[1];
+		if (ssid_len > IEEE80211_MAX_SSID_LEN)
+			ssid_len = IEEE80211_MAX_SSID_LEN;
+		memcpy(ssid, &ssid_ie[2], ssid_len);
 	}
 	rcu_read_unlock();
 
 	cfg80211_put_bss(wvif->wdev->hw->wiphy, bss);
 
 	wvif->join_in_progress = true;
-	ret = wfx_hif_join(wvif, conf, wvif->channel, ssid, ssidlen);
+	ret = wfx_hif_join(wvif, conf, wvif->channel, ssid, ssid_len);
 	if (ret) {
 		ieee80211_connection_loss(wvif->vif);
 		wfx_reset(wvif);
-- 
2.25.1

