Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D03998B1
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294684; cv=none; b=axRg8uJm9QEacR1PbmFnvWzvqmLwWBVpU4gLO6Xco4nT9De/mm3LXE5HWnTSV4PGxMl6g/HiUOHi+ZkJ3SbfdnMESJY13KzfT9qXJefYD3sE0ixF9s/JCBsfQIrYGVwtqup+gikgxN7GqEEJcpCyZtjgHfjaTFt0fgD2f8H/bwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294684; c=relaxed/simple;
	bh=zHrocxawbHnLmYIGh+kT6m6mpetDhpSUtduYpZn6oCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JgvpV3JtQjh+DvIbOAxmqtK2iAexGj9n0v5BwBgbf9jmk8Q+ZyZ6ohgyHuD51uSIcLBc9fPkx9hVgul2Yx4zuXxH3TZbq6fXDUN3AwPtJbbrXiKA9DzgcCTKluVorNdDA/bxPGaSPtNU62fNWah9UF0kc6p6r93M1vj1Mp6m5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSokN2B/; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSokN2B/"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ed2a06b9eso27088457b3.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784294682; x=1784899482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC2eFXiKhfQX8/UEwaZtP5Exk/E4acTG2O8F6pLoCEY=;
        b=FSokN2B/x6Dumfqh0B8/MSy6U1eldvrFeAQVmN71ebAXBv8t1Go3SPl4DXZR2z35KE
         9ckOBT24X62b07I9nRzdZtSAPMEAN04XC3y23qWYYzPasRuDDxengwNglId0jMT/CdKP
         1gvW9dbvvs0fhSFV+KULue6vZkPtsYuvSlQTuMz5LitohkKHF/q73XW8tF8/CB0FaTYt
         D2HcuPX0AXXLul+Ac2rom+QbRlPQc83ZnriMwGnoNAf0xlT8nFEU0gzHg9+bj9AM6Pbf
         8qSKaz8AodxNcpLjhxoapST1t+K8s5LGoSTNQJwO+0MhcW5lcmXHRpgs1TLYGCTlNwp5
         5zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294682; x=1784899482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bC2eFXiKhfQX8/UEwaZtP5Exk/E4acTG2O8F6pLoCEY=;
        b=RWkTZgJTzZ+xEfcmRJi2dgbiBT3+d+wYZa1TAprC/gXVFw7W69x7TEEeJFoIQp5RKL
         msZQYaMku10q1o76j8LuKBJ+7ZeBP/LGntc8O46GsHsrwvIn8vLi+BEkh9eOJ6wkexsZ
         KZhjwNh/VwDa8hPLCfjqd+dXyGd6lNERc08wXbCf7w5YOI0t5s6VDcXY3FgdMj/to3YK
         5Hfkwsu+nTztf7kZyIpWbP1GA9CWze4fohAcd0M7QSgpeCaC4QX6MSIo1Puce/yDqJi2
         RCzkr4YGmG6zB/+rVxvV0yLRqRawRSPo2xEAh3rPu7d3i3gBStqj/vFGaESbH83/5yJv
         Lx1g==
X-Gm-Message-State: AOJu0Yyn3BB1DrefOBWK4YLL3uELIMxsYB5ydkxt+ekLQRWscvUOCQrc
	3oJ4POkKyIughdtT660C1H/Lh2f17gAzHnWYiZ4XiV8e/d6w7jZjPw5qVDjR4w==
X-Gm-Gg: AfdE7cmmQSqMl6NZAHhp86g3MCP4vrwg5wATJkZYrPzEKOoGtlUgAXs/U6zw5GdSqMl
	yTE42hQ3q/tXEO5hsRG1BlaAfn7i18KE1UEGBeejc8dmy+B5/45Fiw+HVOmLOcRMTt+dq+9Sfnw
	UgzUXWixkWkD/gP1SS2px204KLWTweD3yDaX+lsGXQhlA7moW1guIyGeu3DxOKNGt54n78xGFJO
	YSXc5OyWhR27p6P4wcQe6kUJ8Aa/5raldPNJRzC9/hhaJOe7tDOlkmacqwbLONwrLUtxhGpTgXv
	/OfA9vPgl9f/9RgXYEVOklC95ZEnkMyqgj+Mc9Kr68qTifc3f1oe41wFjaktQEUz6DbE+9ZkjCv
	ivEIZ26kcTVeWraYfe33DcNrVbs6tW5V+N+F+frumTe7DmuFCbBtAl0pLppvFHkY8+/vpXpRnoa
	cZv/tYEX+jlBKnh9IWYxVSLJUQcnt5SQ==
X-Received: by 2002:a05:690c:6183:b0:81c:f6b8:8f98 with SMTP id 00721157ae682-81ef22c891amr7988127b3.11.1784294681709;
        Fri, 17 Jul 2026 06:24:41 -0700 (PDT)
Received: from fedora.taild6b28d.ts.net ([200.55.79.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef42eb72asm8899467b3.47.2026.07.17.06.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:24:40 -0700 (PDT)
Sender: TheySaidThisWouldntFit <mariano.ignacio.baragiola@gmail.com>
From: Mariano Baragiola <mbaragiola@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: validate monitor transmit frame lengths
Date: Fri, 17 Jul 2026 10:24:37 -0300
Message-ID: <20260717132437.2556215-1-mbaragiola@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717130356.2544481-1-mbaragiola@linux.com>
References: <20260717130356.2544481-1-mbaragiola@linux.com>
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
Changes in v3:
- Add the below-separator changelog as requested by Greg K-H patch-bot.

Changes in v2:
- Add the Fixes tag as requested by Dan Carpenter.

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

