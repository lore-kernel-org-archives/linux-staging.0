Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654C1364B3
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 21:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItV7rxWg"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-523029050d0so522173a12.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 13:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700861477; x=1701466277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DyqSTfLJlN88c/SvS3E14EIDuuTHtFX/UzdV/6o/zM8=;
        b=ItV7rxWg8YZ+cIJZf4JH8X7SyIalcvOSAQz7K4woxDK+gTINZFWiKMuju0Odj1gZTN
         ddmfb39U4AN+cV6NDvjY681va0iUO+tza5IGD4p+OyDofuzytXGS9vVB0pw5WzerZkQq
         aQSMn1Xk6bQBfF6o4YILNRTAUX4veFjFHiWEO0gPYdNOmu9OXnntSa5qr5sKlJq9DSlG
         PjtYg9NJMOvI8DcxeXMbB48NtL56gWRAS6/VjxvbczdfBpKnf/zP+qNSVF7kcy5bkN3s
         FAhL1U9h9s+1x48juKLkf7VozGoxC08BPzg9FXtPUaHuIKKzDA4FeoVElK06ZRxJ8T/y
         pAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700861477; x=1701466277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyqSTfLJlN88c/SvS3E14EIDuuTHtFX/UzdV/6o/zM8=;
        b=sH7fh3qluIkMdZOcVDcBkMNIMWSN0yciZbqFBV8dvosp82u5vbcLUaPWRTs9NHje/i
         Q62b3kLXuku8/L5ectkSfmoelul6J8C3r8rlFltEV6Q2cz4svAF7v9bxf12vyalbXjSN
         tbr1F3Kf+yzqdyg0dTJzTQjR2ULG+UvwocZ22efgitfxPnw0nSty1FmVyXTEyOSbWkxV
         4av8tMbne7ACN0Y/D0eKq66BuYLq/QrrKWj6772oz8MU7rk5G1br7rPiCZvXHa7dTKrg
         aU/TY3MxLo2NxbZb5LXWlBbaptGx7+UewJ1O4OLJ16sRdt0gmxVZiw5adEekOMha29nV
         X+uw==
X-Gm-Message-State: AOJu0YwKUEqnZG/9npznjKYn2cIoGXXHqgp44gQPeb/GhMw7yfFBcdgF
	PPG73kjP0pzzKwu1Z8UuQ+OXLwSLTs8=
X-Google-Smtp-Source: AGHT+IHrHPi58qXc5j3ILPT28jROxOczly3sw4sv0zRu2cJGZpENgvHS5Q9O1WF07W3ItU9Ud4N6BA==
X-Received: by 2002:a05:6402:17db:b0:542:1ba5:68a4 with SMTP id s27-20020a05640217db00b005421ba568a4mr2990119edy.1.1700861476770;
        Fri, 24 Nov 2023 13:31:16 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id t24-20020aa7d718000000b0053ff311f388sm2196289edq.23.2023.11.24.13.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 13:31:16 -0800 (PST)
Date: Fri, 24 Nov 2023 22:31:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] staging: rtl8192e: Remove unused function
 rtllib_probe_resp()
Message-ID: <be709ffea087df6f960075a51c0eab89f86ef8b2.1700860759.git.philipp.g.hortmann@gmail.com>
References: <cover.1700860758.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700860758.git.philipp.g.hortmann@gmail.com>

Remove unused function rtllib_probe_resp().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 146 ----------------------
 1 file changed, 146 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 8c7ad56d4402..d20970652432 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -632,152 +632,6 @@ rtllib_authentication_req(struct rtllib_network *beacon,
 	return skb;
 }
 
-static struct sk_buff *rtllib_probe_resp(struct rtllib_device *ieee,
-					 const u8 *dest)
-{
-	u8 *tag;
-	int beacon_size;
-	struct rtllib_probe_response *beacon_buf;
-	struct sk_buff *skb = NULL;
-	int encrypt;
-	int atim_len, erp_len;
-	struct lib80211_crypt_data *crypt;
-
-	char *ssid = ieee->current_network.ssid;
-	int ssid_len = ieee->current_network.ssid_len;
-	int rate_len = ieee->current_network.rates_len + 2;
-	int rate_ex_len = ieee->current_network.rates_ex_len;
-	int wpa_ie_len = ieee->wpa_ie_len;
-	u8 erpinfo_content = 0;
-
-	u8 *tmp_ht_cap_buf = NULL;
-	u8 tmp_ht_cap_len = 0;
-	u8 *tmp_ht_info_buf = NULL;
-	u8 tmp_ht_info_len = 0;
-	struct rt_hi_throughput *ht_info = ieee->ht_info;
-	u8 *tmp_generic_ie_buf = NULL;
-	u8 tmp_generic_ie_len = 0;
-
-	if (rate_ex_len > 0)
-		rate_ex_len += 2;
-
-	if (ieee->current_network.capability & WLAN_CAPABILITY_IBSS)
-		atim_len = 4;
-	else
-		atim_len = 0;
-
-	if ((ieee->current_network.mode == WIRELESS_MODE_G) ||
-	   (ieee->current_network.mode == WIRELESS_MODE_N_24G &&
-	   ieee->ht_info->bCurSuppCCK)) {
-		erp_len = 3;
-		erpinfo_content = 0;
-		if (ieee->current_network.buseprotection)
-			erpinfo_content |= ERP_UseProtection;
-	} else {
-		erp_len = 0;
-	}
-
-	crypt = ieee->crypt_info.crypt[ieee->crypt_info.tx_keyidx];
-	encrypt = crypt && crypt->ops &&
-		((strcmp(crypt->ops->name, "R-WEP") == 0 || wpa_ie_len));
-	if (ieee->ht_info->current_ht_support) {
-		tmp_ht_cap_buf = (u8 *)&(ieee->ht_info->SelfHTCap);
-		tmp_ht_cap_len = sizeof(ieee->ht_info->SelfHTCap);
-		tmp_ht_info_buf = (u8 *)&(ieee->ht_info->SelfHTInfo);
-		tmp_ht_info_len = sizeof(ieee->ht_info->SelfHTInfo);
-		HTConstructCapabilityElement(ieee, tmp_ht_cap_buf,
-					     &tmp_ht_cap_len, encrypt, false);
-		HTConstructInfoElement(ieee, tmp_ht_info_buf, &tmp_ht_info_len,
-				       encrypt);
-
-		if (ht_info->reg_rt2rt_aggregation) {
-			tmp_generic_ie_buf = ieee->ht_info->sz_rt2rt_agg_buf;
-			tmp_generic_ie_len =
-				 sizeof(ieee->ht_info->sz_rt2rt_agg_buf);
-			HTConstructRT2RTAggElement(ieee, tmp_generic_ie_buf,
-						   &tmp_generic_ie_len);
-		}
-	}
-
-	beacon_size = sizeof(struct rtllib_probe_response) + 2 +
-		ssid_len + 3 + rate_len + rate_ex_len + atim_len + erp_len
-		+ wpa_ie_len + ieee->tx_headroom;
-	skb = dev_alloc_skb(beacon_size);
-	if (!skb)
-		return NULL;
-
-	skb_reserve(skb, ieee->tx_headroom);
-
-	beacon_buf = skb_put(skb, (beacon_size - ieee->tx_headroom));
-	ether_addr_copy(beacon_buf->header.addr1, dest);
-	ether_addr_copy(beacon_buf->header.addr2, ieee->dev->dev_addr);
-	ether_addr_copy(beacon_buf->header.addr3, ieee->current_network.bssid);
-
-	beacon_buf->header.duration_id = 0;
-	beacon_buf->beacon_interval =
-		cpu_to_le16(ieee->current_network.beacon_interval);
-	beacon_buf->capability =
-		cpu_to_le16(ieee->current_network.capability &
-		WLAN_CAPABILITY_IBSS);
-	beacon_buf->capability |=
-		cpu_to_le16(ieee->current_network.capability &
-		WLAN_CAPABILITY_SHORT_PREAMBLE);
-
-	if (ieee->current_network.capability & WLAN_CAPABILITY_SHORT_SLOT_TIME)
-		beacon_buf->capability |=
-			cpu_to_le16(WLAN_CAPABILITY_SHORT_SLOT_TIME);
-
-	crypt = ieee->crypt_info.crypt[ieee->crypt_info.tx_keyidx];
-	if (encrypt)
-		beacon_buf->capability |= cpu_to_le16(WLAN_CAPABILITY_PRIVACY);
-
-	beacon_buf->header.frame_control = cpu_to_le16(IEEE80211_STYPE_PROBE_RESP);
-	beacon_buf->info_element[0].id = MFIE_TYPE_SSID;
-	beacon_buf->info_element[0].len = ssid_len;
-
-	tag = (u8 *)beacon_buf->info_element[0].data;
-
-	memcpy(tag, ssid, ssid_len);
-
-	tag += ssid_len;
-
-	*(tag++) = MFIE_TYPE_RATES;
-	*(tag++) = rate_len - 2;
-	memcpy(tag, ieee->current_network.rates, rate_len - 2);
-	tag += rate_len - 2;
-
-	*(tag++) = MFIE_TYPE_DS_SET;
-	*(tag++) = 1;
-	*(tag++) = ieee->current_network.channel;
-
-	if (atim_len) {
-		u16 val16;
-		*(tag++) = MFIE_TYPE_IBSS_SET;
-		*(tag++) = 2;
-		val16 = ieee->current_network.atim_window;
-		memcpy((u8 *)tag, (u8 *)&val16, 2);
-		tag += 2;
-	}
-
-	if (erp_len) {
-		*(tag++) = MFIE_TYPE_ERP;
-		*(tag++) = 1;
-		*(tag++) = erpinfo_content;
-	}
-	if (rate_ex_len) {
-		*(tag++) = MFIE_TYPE_RATES_EX;
-		*(tag++) = rate_ex_len - 2;
-		memcpy(tag, ieee->current_network.rates_ex, rate_ex_len - 2);
-		tag += rate_ex_len - 2;
-	}
-
-	if (wpa_ie_len) {
-		memcpy(tag, ieee->wpa_ie, ieee->wpa_ie_len);
-		tag += ieee->wpa_ie_len;
-	}
-	return skb;
-}
-
 static struct sk_buff *rtllib_null_func(struct rtllib_device *ieee, short pwr)
 {
 	struct sk_buff *skb;
-- 
2.42.0

