Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01D7A95A
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 19:28:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-401ce65dfc4so18192915e9.0
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 12:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694546900; x=1695151700; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8LmepYLjp69oSf8jB6s9XGuWnA90MLVSQ4b7fLKD3gc=;
        b=B87M0whWf26IyLEBUomD0zUEbA6FoUQ6UjqnlNDjy46mor+u+trGyybibJ4C8nkSsU
         MNehtCGlSOwZKQ+VxrhVzFlOD63Y076wk1v5N8fOFLbuEUN9ecVCkJtmZ+QJMiUoAw8j
         mTZ5wGOkQ8BKjq258MeI1488bmjnmcjVKIMU4dmjhMtNG9lqyAGDREWDnUqBq7Fb0iVm
         8yqIaPFQGSw5IUV0flqybzJEsWSTwh9PMvovwbC/AJg7JeRgaNo/deE0cZUev2fUsuTb
         /6HVigpeHkqMO+KCxDkxFCF0vGD21KoqziRfCA5Gfm2tbDeD1QgoADi5pLCtF1ZajLIm
         npng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546900; x=1695151700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LmepYLjp69oSf8jB6s9XGuWnA90MLVSQ4b7fLKD3gc=;
        b=T6GgF29+0i9cuqs9S55GpKlxLeqCLABVjw5fut8CADQvfdur47kRFcYUn6pBOXmmY8
         ApujAD8exUX1QldrmhSqm9PV4DhT49vViWz1FcJd1Y9zAx6Ms3kNxniJDYJ/awKc+M28
         AUgSNnPuraBQuAp+y/uKCePncG6u+VGUOGmKCxyXVeMdHGpToTngZVAk4+4qvX0IFqNl
         6VAGfxwC6FU9H73pz7mzVPLzuwWazG29X0FSeoKTfNLvj+xzLhZc9mWNBgsep3U36yzE
         drebXnqlaE+GaIfwFkf74JzPwH+ZeozWjmgZiS6ciH40w4u10tiCjH/iyTLdMZFXh4Sy
         u4Tw==
X-Gm-Message-State: AOJu0Yy3Vcj8StsXTuje/fKo9K+xAWDaCDYVIWe+iJKztASYZ77RkanP
	66b4oantdP7ZXd+RLMIzukk=
X-Google-Smtp-Source: AGHT+IEx865bnRz3eHCa/omFyd5D4nZlp8UoOq/Z0TDKgX6Oguo726Gv3wEexemdoRVBBEYksmlIhA==
X-Received: by 2002:a05:600c:4515:b0:401:b0f8:c26a with SMTP id t21-20020a05600c451500b00401b0f8c26amr300538wmo.4.1694546899943;
        Tue, 12 Sep 2023 12:28:19 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c218600b003fe1c332810sm16810073wme.33.2023.09.12.12.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:28:19 -0700 (PDT)
Date: Tue, 12 Sep 2023 21:28:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] staging: rtl8192e: Use standard function in
 rtllib_process_probe_response()
Message-ID: <ad24a52c045d6638103f4263b811c87d18cb3e97.1694546300.git.philipp.g.hortmann@gmail.com>
References: <cover.1694546300.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694546300.git.philipp.g.hortmann@gmail.com>

Replace proprietary is_beacon() with ieee80211_is_beacon() and
proprietary "WLAN_FC_GET_STYPE(frame_ctl) == RTLLIB_STYPE_PROBE_RESP"
with standard function to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Unchanged
---
 drivers/staging/rtl8192e/rtllib_rx.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 108238aa61d9..89c8d66765fe 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2448,11 +2448,6 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->BssCcxVerNumber = src->BssCcxVerNumber;
 }
 
-static inline int is_beacon(u16 fc)
-{
-	return (WLAN_FC_GET_STYPE(fc) == RTLLIB_STYPE_BEACON);
-}
-
 static int IsPassiveChannel(struct rtllib_device *rtllib, u8 channel)
 {
 	if (channel > MAX_CHANNEL_NUMBER) {
@@ -2491,7 +2486,7 @@ static inline void rtllib_process_probe_response(
 	short renew;
 	struct rtllib_network *network = kzalloc(sizeof(struct rtllib_network),
 						 GFP_ATOMIC);
-	u16 frame_ctl = le16_to_cpu(beacon->header.frame_ctl);
+	__le16 frame_ctl = beacon->header.frame_ctl;
 
 	if (!network)
 		return;
@@ -2521,14 +2516,14 @@ static inline void rtllib_process_probe_response(
 		netdev_dbg(ieee->dev, "Dropped '%s' ( %pM) via %s.\n",
 			   escape_essid(info_element->data, info_element->len),
 			   beacon->header.addr3,
-			   is_beacon(frame_ctl) ? "BEACON" : "PROBE RESPONSE");
+			   ieee80211_is_beacon(frame_ctl) ? "BEACON" : "PROBE RESPONSE");
 		goto free_network;
 	}
 
 	if (!rtllib_legal_channel(ieee, network->channel))
 		goto free_network;
 
-	if (WLAN_FC_GET_STYPE(frame_ctl) == RTLLIB_STYPE_PROBE_RESP) {
+	if (ieee80211_is_probe_resp(frame_ctl)) {
 		if (IsPassiveChannel(ieee, network->channel)) {
 			netdev_info(ieee->dev,
 				    "GetScanInfo(): For Global Domain, filter probe response at channel(%d).\n",
@@ -2561,7 +2556,7 @@ static inline void rtllib_process_probe_response(
 			else
 				ieee->current_network.buseprotection = false;
 		}
-		if (is_beacon(frame_ctl)) {
+		if (ieee80211_is_beacon(frame_ctl)) {
 			if (ieee->link_state >= MAC80211_LINKED)
 				ieee->link_detect_info.NumRecvBcnInPeriod++;
 		}
@@ -2597,7 +2592,7 @@ static inline void rtllib_process_probe_response(
 		netdev_dbg(ieee->dev, "Adding '%s' ( %pM) via %s.\n",
 			   escape_essid(network->ssid, network->ssid_len),
 			   network->bssid,
-			   is_beacon(frame_ctl) ? "BEACON" : "PROBE RESPONSE");
+			   ieee80211_is_beacon(frame_ctl) ? "BEACON" : "PROBE RESPONSE");
 
 		memcpy(target, network, sizeof(*target));
 		list_add_tail(&target->list, &ieee->network_list);
@@ -2607,7 +2602,7 @@ static inline void rtllib_process_probe_response(
 		netdev_dbg(ieee->dev, "Updating '%s' ( %pM) via %s.\n",
 			   escape_essid(target->ssid, target->ssid_len),
 			   target->bssid,
-			   is_beacon(frame_ctl) ? "BEACON" : "PROBE RESPONSE");
+			   ieee80211_is_beacon(frame_ctl) ? "BEACON" : "PROBE RESPONSE");
 
 		/* we have an entry and we are going to update it. But this
 		 *  entry may be already expired. In this case we do the same
@@ -2628,7 +2623,7 @@ static inline void rtllib_process_probe_response(
 	}
 
 	spin_unlock_irqrestore(&ieee->lock, flags);
-	if (is_beacon(frame_ctl) &&
+	if (ieee80211_is_beacon(frame_ctl) &&
 	    is_same_network(&ieee->current_network, network,
 	    (network->ssid_len ? 1 : 0)) &&
 	    (ieee->link_state == MAC80211_LINKED)) {
-- 
2.42.0

