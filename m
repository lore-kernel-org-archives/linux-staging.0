Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE74748C
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 18:19:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-401ce65dfc4so9127685e9.0
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694283583; x=1694888383; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IOE6XlBntSncTLlCWMl5brTZ/7LxZLVyWM/OgQDv3Gg=;
        b=RqXmrN79APppyShsJH+nUz4WunL2AzjcVyJWBD+7oOlw3CFhJdbd9W0fqPsKD3ddns
         W6pmA0sNBuRcmmqr/Iu8DArpCiwdX0vkW06X9gACxD+GkFj31xQmfpcAhBvpRC6wqIey
         /jgbF1nQShxd96xUp9GFOy9OSrK8CZkusfcui2Nl2tjqDG+VZi2ygf+RfDUavSYdmfk+
         zzK1vOHajRQftImUHg34Yq4muwvT++IF20xoHiQUdmrPPkQsTk2CpJr7z+Q9lQbhpZa7
         NTd+8Qa9leKQE74b+SPZtPCz9Fl2axH9OvXl7QYvw5xzzXJbmIUY9UW5TwONVfK1DoNJ
         R7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694283583; x=1694888383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOE6XlBntSncTLlCWMl5brTZ/7LxZLVyWM/OgQDv3Gg=;
        b=NpYVuKwSvLGWxLLVCUHtVze1xioug5bHp68cRJby6bAZd4c8HOk0PZZ4st8d1LD8eV
         EEZGkTgUzFHz7LWK+0AXSLu3oLQ1rWlJoTKc8RfascR+ulcJyauJf8Vr7+Rpv2AO5BAV
         hohxbeuLP3KAtojQQrs+8QnFhNdWJb5vgKKTvSEgPCnmBRfEc9Zbe0cSDnblqAnZB9jF
         IqPZzIfaeDn9fUMeRlorgOKkWHpaL27XeedgKccD0knqhJ0ftKDXGWGpHkLSFzWugB2V
         S+iR7IjAABA4sHH20EytxOjv7jgiCbaWJk4PaQF1jPWwL+DszEDBKGJEg51XeJWzhSyW
         qJwA==
X-Gm-Message-State: AOJu0YwjOP+8oh2MxThxwbLCjp67CYw3UnPKWAs24rkaZCzix0Q7XDGS
	riFe6Dy0DEB94FbLrh09zkY=
X-Google-Smtp-Source: AGHT+IFTaKn85G8pHUiSw+ZLVsc2X6tVt+VxCw1j0vbNFp+QI4MF4bXya63MafT83wdsJ3tc09V5yQ==
X-Received: by 2002:a05:600c:3b03:b0:401:7d3b:cc84 with SMTP id m3-20020a05600c3b0300b004017d3bcc84mr5186831wms.0.1694283582616;
        Sat, 09 Sep 2023 11:19:42 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d484d000000b0031f3b04e7cdsm5372378wrs.109.2023.09.09.11.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 11:19:42 -0700 (PDT)
Date: Sat, 9 Sep 2023 20:19:40 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] staging: rtl8192e: Use standard function in
 rtllib_process_probe_response()
Message-ID: <f06e976555d2f045effabb3ccfea1a2cf133088d.1694282907.git.philipp.g.hortmann@gmail.com>
References: <cover.1694282907.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694282907.git.philipp.g.hortmann@gmail.com>

Replace proprietary is_beacon() with ieee80211_is_beacon() and
proprietary "WLAN_FC_GET_STYPE(frame_ctl) == RTLLIB_STYPE_PROBE_RESP"
with standard function to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
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
2.41.0

