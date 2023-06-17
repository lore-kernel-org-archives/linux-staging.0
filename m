Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D99467
	for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 13:57:40 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-516a0105121so402937a12.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687010259; x=1689602259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4r2Rtc1JlVK6mjrCqEQPoG1o3UJwlNrd+dUsSDnAhaQ=;
        b=OFCUBOB3tK8YMrZMCEcFDUX4/K/2+8MBIzkNowyo5rwwGwogE00yabvNwhldZXFld7
         78d8PJrJZsbgA2s6gHcDaFbpWNKmFtFzONEqrN+NFbeSahi044PZjCsR5wdTo2P/41ob
         gO7W0Htt9aLTtaQFbf+QnXwxjf+GMoBiGiK8Ra1So3t2/CzWjzAV7Dx5b7EyAQuVGKjS
         G4vzHl5k0WMCQABZKJAUpMmaaqL6HJvuO0vUVZw8KVMVhIZJJlqVDeq75KFzyV0WHymN
         3e3x8lIq/irH2blBobdLpMAlaH/XSTkn4XEgigdsYyO3sFt4jYYM1QnUCg7nqZPIkSD7
         Ru/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687010259; x=1689602259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4r2Rtc1JlVK6mjrCqEQPoG1o3UJwlNrd+dUsSDnAhaQ=;
        b=OCD7ySkxtOyX+t9acywCyoYa7obaBB1nmdjvySQmmgLOrl2V6sMlmZs2DgHl+fgqZx
         Aoorca30avJzXvmkPbu0I9m/tsZSMPDCdqD5Hf3QmKRZBz4UwaURJzNnJB0mR+yfhBXe
         PrOhseycDhD8dYsvVcnPzdf5BJzOqvq5KcHnncICmbUZI3UbovuDrHOOpbAowihaDbUk
         LIzY+tP0WH+rRAD1JxXtYgJQ1L68Wbm0afnsBLiKgDD7lChTDNHkisd2hmPiek6lsJfn
         cqMNUROnvjeKX5QMt//u/phy5yAxvQcebJt63wJsDgFzaB9p7Urxx2wbYMuk7HwymEPZ
         Hdjg==
X-Gm-Message-State: AC+VfDwNHl4fLCfjBXHfEcIKZUCuC0hK/5TaPHwLtHAUiU/5QrkmoCM8
	D7H6Gz0mBy3xKMQpHqnY7wCpTxuJASM=
X-Google-Smtp-Source: ACHHUZ50FsWViSO2cGEkWjo137Ny+m44WLwNQqPVWPyikdsi3flHqz/EclpjGYkjnnGXhnY387emtQ==
X-Received: by 2002:a17:906:244:b0:982:caf8:7358 with SMTP id 4-20020a170906024400b00982caf87358mr3996330ejl.5.1687010258783;
        Sat, 17 Jun 2023 06:57:38 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id la4-20020a170906ad8400b00984822540c9sm2411486ejb.96.2023.06.17.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 06:57:38 -0700 (PDT)
Date: Sat, 17 Jun 2023 15:57:36 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] staging: rtl8192e: Rename RTLLIB_LINKED_SCANNING
Message-ID: <25b97cd436c636e750c50f0c03386fcc46e56610.1687007788.git.philipp.g.hortmann@gmail.com>
References: <cover.1687007788.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687007788.git.philipp.g.hortmann@gmail.com>

Rename RTLLIB_LINKED_SCANNING to MAC80211_LINKED_SCANNING to align with
rtlwifi driver.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_ethtool.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h               | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c       | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c    | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ethtool.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ethtool.c
index 1625d1326599..fab8932e67da 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ethtool.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ethtool.c
@@ -28,7 +28,7 @@ static u32 _rtl92e_ethtool_get_link(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	return ((priv->rtllib->link_state == MAC80211_LINKED) ||
-		(priv->rtllib->link_state == RTLLIB_LINKED_SCANNING));
+		(priv->rtllib->link_state == MAC80211_LINKED_SCANNING));
 }
 
 const struct ethtool_ops rtl819x_ethtool_ops = {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7758bfd90283..cdd167de127f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1153,7 +1153,7 @@ enum rtl_link_state {
 	 * logically linked, but it is doing a syncro site survey
 	 * then it will be back to LINKED state.
 	 */
-	RTLLIB_LINKED_SCANNING,
+	MAC80211_LINKED_SCANNING,
 };
 
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index d99b98a39cc7..7494c7e6fff6 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -513,7 +513,7 @@ static void rtllib_softmac_scan_syncro(struct rtllib_device *ieee, u8 is_mesh)
 		 *    will set the state to MAC80211_LINKED, so we stop
 		 *    scanning
 		 * 2- We are linked and the root uses run iwlist scan.
-		 *    So we switch to RTLLIB_LINKED_SCANNING to remember
+		 *    So we switch to MAC80211_LINKED_SCANNING to remember
 		 *    that we are still logically linked (not interested in
 		 *    new network events, despite for updating the net list,
 		 *    but we are temporarly 'unlinked' as the driver shall
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index c1d1bf4d720a..be82f0a655e8 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -96,7 +96,7 @@ int rtllib_wx_get_wap(struct rtllib_device *ieee,
 	spin_lock_irqsave(&ieee->lock, flags);
 
 	if (ieee->link_state != MAC80211_LINKED &&
-		ieee->link_state != RTLLIB_LINKED_SCANNING &&
+		ieee->link_state != MAC80211_LINKED_SCANNING &&
 		ieee->wap_set == 0)
 
 		eth_zero_addr(wrqu->ap_addr.sa_data);
@@ -185,7 +185,7 @@ int rtllib_wx_get_essid(struct rtllib_device *ieee, struct iw_request_info *a,
 	}
 
 	if (ieee->link_state != MAC80211_LINKED &&
-		ieee->link_state != RTLLIB_LINKED_SCANNING &&
+		ieee->link_state != MAC80211_LINKED_SCANNING &&
 		ieee->ssid_set == 0) {
 		ret = -1;
 		goto out;
@@ -323,7 +323,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 
 	rtllib_stop_all_queues(ieee);
 	rtllib_stop_send_beacons(ieee);
-	ieee->link_state = RTLLIB_LINKED_SCANNING;
+	ieee->link_state = MAC80211_LINKED_SCANNING;
 	ieee->link_change(ieee->dev);
 	/* wait for ps packet to be kicked out successfully */
 	msleep(50);
-- 
2.40.1

