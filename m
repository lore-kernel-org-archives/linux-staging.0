Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF773FD129
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293444; cv=none; b=lNMh8HC7mWUmluradxkLx9GxOfzxdjeFxfMvcLrFHz02Lwgx8mND+DVWhGxz2Z4gMa25wzRCwhZ1I8xlX3Inl01SgMvXUZjVKANpRf0t3bsf2U4FAuppsJPBFMvuK4ZugJUWzNrk1udMQY75iyxyzk5/G3AU+nWKlJ8Cudikk3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293444; c=relaxed/simple;
	bh=Gy6LP6bTRRXFbNIKjCgrGt/GweJLEAumLYk+CZRrsVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hORTXwM3aA+F3G3GhpR0F4jJIseHAHG52t3aGlD3gqcm2A3PV8JATXUZ12avO47+giEMQrLbWE4RpXPC0VGS7IBNo1W6H8JFmKBQBKpYqG1UsD6pBf0FtBPc5zcdPsSOakVAsJjUSVeI9VbWEQ00iBIZwn6dOqQFGGYd93cn2H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+uZuhjA; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+uZuhjA"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81ed2a00f12so49130797b3.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784293442; x=1784898242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIFe0KJ7fkUFEDjA2U2ZbKOXvc0zQfi8RIzitq0Adio=;
        b=K+uZuhjADZaKQDWpjdufYEJX6Wf/xPrBLaEOs9UT1Ve8tblvawlIj8dEGD7L9EqU+p
         7LH9NdDuuunzCVdYOVeCEt+gYg0tYRJvUfSlt6se8oaFz1H8zFh9L/y1o2yMMmUVSQix
         86KZzC03gOsEbCt3lpL/FE3Io/eDIfYmHscjSogSSOKCJUAoJRYAKE6YAH0eq4KG99hq
         fuqymZhn3Q3gNTikHRBedp7giI+mwegvZK5Wk662keR198oigYD0xkZnHRcbmWB43Pk4
         ReD5IsDFKTDieHvl7/cX+1++/aVj3lZljw6v5/+n85ve3ML8F5K3cdmKSE3DDA9iXyH3
         kUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784293442; x=1784898242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIFe0KJ7fkUFEDjA2U2ZbKOXvc0zQfi8RIzitq0Adio=;
        b=Z7KxwnG4suIp8CT7HY/ypllUU1IgzEtKDyBb6XEjWjWJr9w1WqqSzSDop3vDul5rnT
         DLPEuM9Q8JNOf6ofGBONhBwfx1BjDb8IJGYLQS4ATKRjhannnabptWrZr0j/rxU8fHD4
         79GbLJ0Few2S7Iyi5g0GLQKcJ03JPsf6NEbnXjPrQJ5rHxRhAnwywh5RKjxHWJ/fvHlX
         X8LvabIOblejn6AekNZkHo7aZX4DQn0pD6Hf5bYGdVGXQTltBhhdCMQr3F95O76r5ht5
         39Fae4zGgqLKiViQyKm/EpUU7Q1yoEmkm0CCs6vTooulBwkesOkx/v7gd1efX4lRzasN
         8sMQ==
X-Gm-Message-State: AOJu0YzMLPp8KyqDO/aKhR4Y08gY2KMI4RpXy8yRQDIk8GS1bIxavwdC
	AtLA2vSmPeUfS+VFW75yKnGCsyN8QWDU/5Y3wk3eJPB50goQNQ0lHIZu
X-Gm-Gg: AfdE7ckKVpcAVlOkpcib5M7NqH0D1uPs1HWB8lEi3n4TK5kiNDbodsQ0P532QyDdE4b
	RRMEx3tOtO3X4chI8ArMgoRFxHjvZUhrjAnZVUT9y4yFHBipmqLPJqJ2L+hX/W7BsG57gCFRtN1
	20QGDox7HeinaeJ7qZEmg6QURZsP3VYhT8LLjocMX7UrLh9gh34FHFhjco3mJzbIxVb9NhhqcoJ
	8FzyfWkwbPr1QVFkcCUnq22AJ2Ee29xZcpEk2WG+nN9L+G3Agi1LqQkT+CDgZ36oYDyOPdn3KkG
	c+XzX7tl2698Bmk7qwdk5vxMdqZRcEE0gteCXx0mFkTEgdic3woodi7efJ4oOPAqL6/AlP3XONp
	QsZ65RobFylg9/5uEn2bhj5OLXu46k7YOBmTjno8J7jBtNawGW4KCsvHmjfrv+/dUoUhk3jPqth
	oFgpk5f7DC1TF013WER5A=
X-Received: by 2002:a53:a4c8:0:b0:667:a382:baf3 with SMTP id 956f58d0204a3-6683bd4d642mr506910d50.75.1784293441776;
        Fri, 17 Jul 2026 06:04:01 -0700 (PDT)
Received: from fedora.taild6b28d.ts.net ([200.55.79.212])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6683b56fbf3sm1281400d50.8.2026.07.17.06.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:04:00 -0700 (PDT)
Sender: TheySaidThisWouldntFit <mariano.ignacio.baragiola@gmail.com>
From: Mariano Baragiola <mbaragiola@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: validate monitor transmit frame lengths
Date: Fri, 17 Jul 2026 10:03:56 -0300
Message-ID: <20260717130356.2544481-1-mbaragiola@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715225938.1403192-1-mbaragiola@linux.com>
References: <20260715225938.1403192-1-mbaragiola@linux.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_cfg80211_monitor_if_xmit_entry() removes the radiotap header and
then reads the 802.11 frame control field without checking that a base
802.11 header remains.

The data path also pulls the calculated 802.11, QoS and SNAP header
span before confirming that the skb contains it. A truncated frame can
therefore cause out-of-bounds reads or leave insufficient data for the
Ethernet address writes.

Reject frames that do not contain the base 802.11 header and data
frames that do not contain their complete calculated header span.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Mariano Baragiola <mbaragiola@linux.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 6a97afd89dc7..bed8192ab44f 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2033,6 +2033,8 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 
 	/* Skip the ratio tap header */
 	skb_pull(skb, rtap_len);
+	if (unlikely(skb->len < dot11_hdr_len))
+		goto fail;
 
 	dot11_hdr = (struct ieee80211_hdr *)skb->data;
 	frame_control = le16_to_cpu(dot11_hdr->frame_control);
@@ -2045,6 +2047,8 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 			qos_len = 2;
 		if ((frame_control & 0x0300) == 0x0300)
 			dot11_hdr_len += 6;
+		if (unlikely(skb->len < dot11_hdr_len + qos_len + snap_len))
+			goto fail;
 
 		memcpy(dst_mac_addr, dot11_hdr->addr1, sizeof(dst_mac_addr));
 		memcpy(src_mac_addr, dot11_hdr->addr2, sizeof(src_mac_addr));
-- 
2.55.0

