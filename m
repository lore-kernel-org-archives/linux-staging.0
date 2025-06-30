Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3228D21ABB1
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272268; cv=none; b=ifIDhwphHRPKemPFiOvDeD/jJQxjrLh6fQl4GNUpmkRbSQxO/SLRDl1is+M/FMDxMq6iwm7yLgiZPbcAqM49r+/L3FkYu2N72hvZnvEJ5gY2U3eepNXmjMFp3ZCQrTJyApoypuMBTXTPEhjlrZgh5yHllW11sNytdRaOezqilVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272268; c=relaxed/simple;
	bh=BacTpYDKsivXlWevsTrw36x80ITH6Ritocv0vbDFpNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDN7SQcL2xRS9mdr3PxXnKc4hxiuc1x8nU/Q8XMHytNbrEyHtSUN3K04tEFbVPd2XBKJSxcjy4WEXM00/IG0D/Q3r53hPlqT8orjmqlTL6a7h7r2hbTIrZDKHh6LhtmYe6DC/KRo2r5zJT5pEPPNUPtT9KJSJWD6gzdk5wSmjKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhukBGmx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhukBGmx"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae35c447234so554510866b.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272264; x=1751877064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfEtgbNt/rYCf8xNxthB2n/XL2JqGnY+ug8Bfy+XFfE=;
        b=MhukBGmxBxWi0RC0sP+k9jVGHc48m7eq7W+1B2jUqnQ0LjLohv104Vhc51ktaQGz/3
         I29A+zg5GCLfM8pdGheIzcSUv2H5fNGaBYOqGagUDfYDORlfRiKRPMbiBBQjj81qC4mQ
         lqccK6Vvw+w1/6oPFkiVEp11T7gFmRdJpPsEDTLxv1f3K8+FzY1YhcabKWR31YVJM0H/
         r0p54BlT4dQey6iKXegA95obZrlhM4mkVc5LP9YbB6CFcXbtQuaVWVmxC9Hp4kVcSP12
         JK+5gYk5qioAQDJxO5FCkWWS+xiXpLFO3jP/0cFUlHSp+GlVfxauufJUSjP9n1PibFsc
         yKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272264; x=1751877064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfEtgbNt/rYCf8xNxthB2n/XL2JqGnY+ug8Bfy+XFfE=;
        b=MXHOid2zDBXHfDzMd/RdAc46hxIzNQHn0TvX5it80u7qKYRx2VhQwbebJOjFaUC7Xm
         Y4Yn5YWfBL7TGz7n8EUTSuPjxJoEv2EEX5PweYz3+nygotbyu5qJS4nBjjlUCNuxAwjT
         aWMHY715qm00nL8+ZmStI7n/D7YNEZdSzUOzVLmcEBwPr08VEU6HF93CubF8EADnIQ17
         Bo4cgCZW7BUyGUNe4be272HgNrTJzheC6tfL18BQfqzUkN28tOwf10LoVbR7ieOo0rGq
         V9iPGeJqKnzqxtXjy6LzN6XsaOq+1gayR59JHmnZnM3776hg0DYbGycGdQBuZFARaqBX
         gczg==
X-Forwarded-Encrypted: i=1; AJvYcCXoWC5UKeap5MdI43VWkoKItvFgkfMMaMutlLDRNvU2IHfRRVyY7EJqsE9gxmBbCiPCU1boFMsikJhivcPg@lists.linux.dev
X-Gm-Message-State: AOJu0YxZtfChV/K1wlT0vFVDMgDw3z7EDaeeoGMrUhsVtxvdoVlG9ISQ
	mrm+kq4bAMOdtHoDnq94wNh5xHia0Lz9cvF23uM1lMnIXBpHCoxAC9GO
X-Gm-Gg: ASbGncu1jeaqVdhQzflu6SY8+R1QztQfOxFWK0h/04O/7ww8EJTXBmiFnH6sOFU1u0g
	5eCAwrTl7FMhlZBKq5PNj5BKcMyIKuK/B1SJz11XJneQ62ctBTCj4b6/6owa3bTjHwmaIpeEwoo
	F7VDICicvK1PtLPmembfAJ4fqWGXUMxfSbkIUtVPN9irk3v+p2Zu0OYUkkUjDstjy+LZpgpHKot
	3SJ0BuFj3Dq0m5wUZnKODPti3upp5AeCDjDH8eeDeuoYpPvs75ANIZwyZy1tQO6a3QIV23fQNd3
	x00HTp38Mk1v4RHOYT6rlAB5v1g7OfAudEZcgTDsfoeT4IlhTUph8BVulRSRq4NXskkS/E9+LdT
	Pm4G/jxz8Cf5fCw==
X-Google-Smtp-Source: AGHT+IEcnypyBxGiTttasTy/2glWFDimEHzRoaELnx7Jb+RtdgUUjyMZ7adE3YhZsT+gvEipekO/WQ==
X-Received: by 2002:a17:907:8686:b0:ad8:e448:6c64 with SMTP id a640c23a62f3a-ae0d28c7408mr1552178366b.24.1751272264033;
        Mon, 30 Jun 2025 01:31:04 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm577568766b.37.2025.06.30.01.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:31:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unnesessary function parameter
Date: Mon, 30 Jun 2025 10:30:48 +0200
Message-ID: <20250630083049.103734-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630083049.103734-1-straube.linux@gmail.com>
References: <20250630083049.103734-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_ieee80211_channel_to_frequency() in ioctl_cfg80211.c
is always called with band = NL80211_BAND_2GHZ. Remove the unnecessary
band parameter from the function and adjust its code and calls.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7fcc46a0bb48..7cc1e036d2c4 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -192,14 +192,14 @@ rtw_cfg80211_default_mgmt_stypes[NUM_NL80211_IFTYPES] = {
 	},
 };
 
-static int rtw_ieee80211_channel_to_frequency(int chan, int band)
+static int rtw_ieee80211_channel_to_frequency(int chan)
 {
-	if (band == NL80211_BAND_2GHZ) {
-		if (chan == 14)
-			return 2484;
-		else if (chan < 14)
-			return 2407 + chan * 5;
-	}
+	/* NL80211_BAND_2GHZ */
+	if (chan == 14)
+		return 2484;
+
+	if (chan < 14)
+		return 2407 + chan * 5;
 
 	return 0; /* not supported */
 }
@@ -266,7 +266,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	/* spin_unlock_bh(&pwdev_priv->scan_req_lock); */
 
 	channel = pnetwork->network.configuration.ds_config;
-	freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
+	freq = rtw_ieee80211_channel_to_frequency(channel);
 
 	notify_channel = ieee80211_get_channel(wiphy, freq);
 
@@ -340,7 +340,7 @@ int rtw_cfg80211_check_bss(struct adapter *padapter)
 	if (!(pnetwork) || !(padapter->rtw_wdev))
 		return false;
 
-	freq = rtw_ieee80211_channel_to_frequency(pnetwork->configuration.ds_config, NL80211_BAND_2GHZ);
+	freq = rtw_ieee80211_channel_to_frequency(pnetwork->configuration.ds_config);
 
 	notify_channel = ieee80211_get_channel(padapter->rtw_wdev->wiphy, freq);
 	bss = cfg80211_get_bss(padapter->rtw_wdev->wiphy, notify_channel,
@@ -440,7 +440,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 		u16 channel = cur_network->network.configuration.ds_config;
 		struct cfg80211_roam_info roam_info = {};
 
-		freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
+		freq = rtw_ieee80211_channel_to_frequency(channel);
 
 		notify_channel = ieee80211_get_channel(wiphy, freq);
 
@@ -1976,7 +1976,7 @@ static int cfg80211_rtw_get_channel(struct wiphy *wiphy, struct wireless_dev *wd
 	if (!channel)
 		return -ENODATA;
 
-	freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
+	freq = rtw_ieee80211_channel_to_frequency(channel);
 
 	chan = ieee80211_get_channel(adapter->rtw_wdev->wiphy, freq);
 
@@ -2456,7 +2456,7 @@ void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame, uint frame_len,
 
 	rtw_action_frame_parse(frame, frame_len, &category, &action);
 
-	freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
+	freq = rtw_ieee80211_channel_to_frequency(channel);
 
 	rtw_cfg80211_rx_mgmt(adapter, freq, 0, frame, frame_len, GFP_ATOMIC);
 }
-- 
2.49.0

