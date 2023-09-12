Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11B33D2
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 19:28:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-400e8ab9325so17067235e9.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 12:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694546893; x=1695151693; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QexNkjG2mXAQpwTtJAKwU4X2ozG1nmIWtcTUMqxmunQ=;
        b=Hqcpzq2aLSeViGDfOYcgYyvRHXzxJfK3zwDduTXiVXv1+4xW81DS2qqE11qqhoA3pM
         wxOwhjybdL/kWLQLbFa+VqtVbVS7bIipG8+k24MKWYqXMy0abKrs5VH9Sav1UDsZaevp
         K4fLw+d0bAWHB+PokV+q42vr+UrH/Srfx5yG7/yJI1A/YbVRw5QSOhxhTCK6/AahOGUB
         Ph2yKikFjDtyXbmR7F+rct5SOpzYRYtFredgL2SSdQwOgwKNSf9we8rwqlzVHH7S7odH
         fSkLTvl74SdYniKmBhSfT975SL/XIoJQPb0F0nnOz4oiCq9ZVLUgNA37Q6rIQhF01T08
         6ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546893; x=1695151693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QexNkjG2mXAQpwTtJAKwU4X2ozG1nmIWtcTUMqxmunQ=;
        b=bfWcoo7JlH21aQSFsf6fjst1M+H+TBX+wYGs2xbu8/KOptBTqQergYuyxN3mGJ53IA
         jctr+ExRk+tgz1/r+5QiG0mL+VPZT1D+uoEqK0hhJEvM1Nh/YXitFcOY0y5zo5rQquZQ
         QNVKLCU2gEiIoksKF5FnD9/ZPrHVl9QbRabPR+NibKHCdzacwftRBr57RavUPdYuO2Kg
         APXylQHFeE8e7QkUsJHRq0bPoKfxlkXIuOXw3eVcGEQY468wTm+4X5Yax49NrXhBz8OD
         ykp6ajPevc3gbcWFC1etz0VoU83U6PB1MoB8Q1wOZwOhSnK56mq7yOmaNE5DC5cWpb0n
         0UVQ==
X-Gm-Message-State: AOJu0YyCgYUJ8nRXgN+xBotscJMc3w4T26+FcgD5RuqTMJSgtsimOryO
	Zxb01t2eyrgtvQ6QNCi6lac=
X-Google-Smtp-Source: AGHT+IH68pBqYN80DtFu8zyIcWe17Nc6RH+PYlPdLDPrbaEQOisy1yO0gD54tU+ecnJ1j9qp+WCo1w==
X-Received: by 2002:a05:600c:3b9b:b0:3fe:dd78:8fbc with SMTP id n27-20020a05600c3b9b00b003fedd788fbcmr298664wms.3.1694546893101;
        Tue, 12 Sep 2023 12:28:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c028c00b003fee6e170f9sm13702848wmk.45.2023.09.12.12.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:28:12 -0700 (PDT)
Date: Tue, 12 Sep 2023 21:28:11 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] staging: rtl8192e: Use standard ieee80211 function in
 rtllib_rx_mgt()
Message-ID: <26cb0a7758186090a618a134c21e237594bbc525.1694546300.git.philipp.g.hortmann@gmail.com>
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

Replace WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)) and comparison
with standard function to avoid proprietary code and to increase
readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Unchanged
---
 drivers/staging/rtl8192e/rtllib_rx.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 9f944eefa41e..108238aa61d9 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2644,14 +2644,11 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 {
 	struct rtllib_hdr_4addr *header = (struct rtllib_hdr_4addr *)skb->data;
 
-	if ((WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)) !=
-	    RTLLIB_STYPE_PROBE_RESP) &&
-	    (WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)) !=
-	    RTLLIB_STYPE_BEACON))
+	if (!ieee80211_is_probe_resp(header->frame_ctl) &&
+	    (!ieee80211_is_beacon(header->frame_ctl)))
 		ieee->last_rx_ps_time = jiffies;
 
-	switch (WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl))) {
-	case RTLLIB_STYPE_BEACON:
+	if (ieee80211_is_beacon(header->frame_ctl)) {
 		netdev_dbg(ieee->dev, "received BEACON\n");
 		rtllib_process_probe_response(
 				ieee, (struct rtllib_probe_response *)header,
@@ -2661,20 +2658,15 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 		    ieee->iw_mode == IW_MODE_INFRA &&
 		    ieee->link_state == MAC80211_LINKED))
 			schedule_work(&ieee->ps_task);
-
-		break;
-
-	case RTLLIB_STYPE_PROBE_RESP:
+	} else if (ieee80211_is_probe_resp(header->frame_ctl)) {
 		netdev_dbg(ieee->dev, "received PROBE RESPONSE\n");
 		rtllib_process_probe_response(ieee,
 			      (struct rtllib_probe_response *)header, stats);
-		break;
-	case RTLLIB_STYPE_PROBE_REQ:
+	} else if (ieee80211_is_probe_req(header->frame_ctl)) {
 		netdev_dbg(ieee->dev, "received PROBE REQUEST\n");
 		if ((ieee->softmac_features & IEEE_SOFTMAC_PROBERS) &&
 		    (ieee->iw_mode == IW_MODE_ADHOC &&
 		    ieee->link_state == MAC80211_LINKED))
 			rtllib_rx_probe_rq(ieee, skb);
-		break;
 	}
 }
-- 
2.42.0

