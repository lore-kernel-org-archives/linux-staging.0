Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BB041F34B
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168546; cv=none; b=D5c+OYjTR0dpfQ84/9YV5XJoXy1EqLa6en8HoLYuC4ufuM215bomVU7iJt1uoKY5z1QLCyWXybLJ+F8zqs/9B4TyLo+Zx2Rl9vFZ+jjwtKGSpIuf6pKjy7W7v246lteTw0wbUKPTuU9zCReDnWSpzial6KmvnRr8w5mJZBzdRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168546; c=relaxed/simple;
	bh=NT59An7OjrACd1bRhxel17hkY4n4fCUgWW0vek5W9pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfKUsmEfVu1i8FYpT1oBSfSFk0H49zMUjeGRDyEgzFFdMQMmDs0OvhthW4E5cKTUJo4ZxhsMbCwzHsTyK46eodiEv2tL3UcEdB6SJtgG/EiGDr/QhrF3/+yExgl/i2128mgGtwjZKHkTRML/4YTuo+ybEQFQPUa1NqM4kIDp14M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRL1zjeA; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRL1zjeA"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38101f85591so64673a91.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 09:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785168543; x=1785773343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfi6muhTpsZUY0xskbOOIF3D0r/nPgzr4Ssnap4JkLs=;
        b=nRL1zjeAgAsSAbLPKOSMaCFibJRR/OQRtOurE1FQjcrEBruaSV0JXiWhSFTLZLSAMR
         17JWc8ZYzz/i4LT8vt8yi9lNM2MVXRG0JYt+OVv5AuUX7L4f8JV+dKCokapfvRGO7v7S
         E66hLT3RchwiXyaKQnohyrZX1EOe/hpoLRyibqwbChqJRL2G8xZOeiTp/7hGdAWegNHv
         eDjpBWh1xW40KtdPeav36huvXzK5lKeGbVCjhvXgg1fpHmMirJyFnhjNk0KoPKbNwJz9
         QOpRNf7vrkv3sArp72NchoxCuzXWJv72etqMq9oZMN3+zby7jpkGZWO0QCP4ih3FF0mw
         mUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785168543; x=1785773343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfi6muhTpsZUY0xskbOOIF3D0r/nPgzr4Ssnap4JkLs=;
        b=RGKouk8HhrmgkEeCUjMccS5yDdyrjJlZnEUYHLRf+MgimuxLVx7erk3lcYbRXT+o45
         bdptcptoMXY6TxVbAWhBxJXlSgh9fDGeFr3D442jlbPXI72/sZ9UTZB7tMIxdBoMIr5W
         rnNMwB21TKNDsThG5Rs+Uw2ycbe/Vy+eEcWP8NL0dqm6hO2VCEh7bT+xdwE/mVkf4+1K
         zNXPS/Vw3Km7p/hthjKmzmRc8vwloEQGOnvyjYb2DQC+HC9s5SQzwJHOBB5IQlXrn15m
         PXgzqjKmJ5GoWYiWsiQ13x09jpIhi9P2J+GLk/d58GnWm6Dq+MwJA/PpS162UHkAZPNd
         8ykg==
X-Gm-Message-State: AOJu0Yx2ed9Se8WksJWlIFivazwvVWPbk8ueUzGhhv0DN7v/8QvC50Mq
	pGzPVbKHMSaZuLj6EtGXHFgOHrT4X/jLPs8gE0b1xgpb+eVrxSQcXu29
X-Gm-Gg: AR+sD10+PtYPxuN4tZjlNEMpq394ohXVP6VRcaLLRGiAvfuKGqwqizIMwS6d1KoMaWY
	qDmd2Mb7z2yQoTkvIUirb3eOaS8d3WP7W2fp8P3MHU0xuNlYaQlU7lq4YINRF6sLCNnN0TLoMPq
	xhxKv8NOmWir0mp0fbhRY3vXO2MVOFdk3MMhDKtslodjf+lNNRsFUypPaSYghn8p2mfoGYM6VXf
	RP5OssCVOUa6RCuMFEZRYMsvxsq1RccvH/Ota8+vqEExjkQE/TpuPAHgjwDY0ckBsxzUHylfAXS
	tgeWo2JOHHzb1GQJZnIwQ4m+wSatlpLZ/N5qcgJfZRrpvtzXmXRfMGOJXqJxTkKKZwTfrF8ls26
	82T9ZEJE1kpTEvThqrEWlxdNoAmhJaksC5+UaHELXvtk7LLaGp2tsGIYmVK6LSOJ8aqqu+UdNxh
	M/8GI3UbtJ9Y8ir2KikhVOKcyf5HvFNj2czPO43MpoM0bVShUYNfztrcyUBTMQijQyqEyztyuHu
	pU=
X-Received: by 2002:a17:90b:1b0c:b0:385:39ac:fe4b with SMTP id 98e67ed59e1d1-38f644d3bacmr68922a91.17.1785168543363;
        Mon, 27 Jul 2026 09:09:03 -0700 (PDT)
Received: from fedora.fibertel.com.ar ([200.55.79.212])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm51660351c88.10.2026.07.27.09.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:09:02 -0700 (PDT)
Sender: TheySaidThisWouldntFit <mariano.ignacio.baragiola@gmail.com>
From: Mariano Baragiola <mbaragiola@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: validate monitor transmit frame lengths
Date: Mon, 27 Jul 2026 13:08:59 -0300
Message-ID: <20260727160859.1917096-1-mbaragiola@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717132437.2556215-1-mbaragiola@linux.com>
References: <20260717130356.2544481-1-mbaragiola@linux.com> <20260717132437.2556215-1-mbaragiola@linux.com>
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
Changes in v4:
- Remove unlikely() from both new length checks in response to Greg
  Kroah-Hartman's review; no measurements exist to justify the annotations.

Changes in v3:
- Add the revision history below the separator.

Changes in v2:
- Add the Fixes tag as requested by Dan Carpenter.

 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 6a97afd89dc7..6404044d2185 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2033,6 +2033,8 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 
 	/* Skip the ratio tap header */
 	skb_pull(skb, rtap_len);
+	if (skb->len < dot11_hdr_len)
+		goto fail;
 
 	dot11_hdr = (struct ieee80211_hdr *)skb->data;
 	frame_control = le16_to_cpu(dot11_hdr->frame_control);
@@ -2045,6 +2047,8 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 			qos_len = 2;
 		if ((frame_control & 0x0300) == 0x0300)
 			dot11_hdr_len += 6;
+		if (skb->len < dot11_hdr_len + qos_len + snap_len)
+			goto fail;
 
 		memcpy(dst_mac_addr, dot11_hdr->addr1, sizeof(dst_mac_addr));
 		memcpy(src_mac_addr, dot11_hdr->addr2, sizeof(src_mac_addr));
-- 
2.55.0
