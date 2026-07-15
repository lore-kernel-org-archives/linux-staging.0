Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A2334C3C
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 22:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784156383; cv=none; b=THHPOUtv7L7n/4SEmtJ3QieqTQR21u+VY+QXHnsrC6aSgpfib5dhxPiNjNbbNUOq7bHNYfqyOd9R+KJj8OzmhPT/dLPaHMpWLOjgnMM/EkvajAmibukrixjq6R4MqTZbSNJ9YcbiQJWcY8XhQ8pZ4zjVuwN2qavriwA8Fs7Dc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784156383; c=relaxed/simple;
	bh=SU2hoRPG+1k7cGHNPohtItOA1d+nMq2sxOhtFrmxPIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J2YEMRH25LawtReEtEUylBhD5V2CpaGCWJzTs9nAcYdvsBKOTTOU6RNSKI3zyRyogcKYj3AEZn3NE3OU84sOh35ExF+tB10tjgeCQ2NKYGoeQ/0r6cWqY8T5aVbMP2TdMaZqHPX0VpWUJswW3iFMkNOy6Z+1T7yOfuh8uiXt9QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxZP9yvv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxZP9yvv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacb8416a1so26457485ad.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 15:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784156381; x=1784761181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNT2j80oL+vOQNj5bsDBuwhde81jFRTGR6LJsB2wnZY=;
        b=fxZP9yvvIThXb5pZ+VbZPeS8WZFa4qMHbNNNG+S9S9uVAgXJns+4DuqFEWqdNSUS1M
         hmf0ZhUDwJbGK4Dr7up0CyZzudtN2l0PnSNEax3Ns1QdkyO9KuLYzIoH9iIxX3muGQC1
         D2D1MOgmTaYx9HIh2SX2DX8SBqVeweFP4uxVwvmyqXonX5n9DgdWQCdKyED7U+ClJ7f6
         +vdtaKpPjX8ip3UQMHt48+IWu1iXUvZ7lAm2Rk9NZjPJLEUilgw85B8w0wQWTeZWBVe6
         MbqtxopO6hWWFLZxQSc2qjdrHOvtkUS065du4GT3c7sicML+Y0VUsdgN4sHA4C0YihEL
         0ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784156381; x=1784761181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNT2j80oL+vOQNj5bsDBuwhde81jFRTGR6LJsB2wnZY=;
        b=es0Mx+mFsG8g1caxq0R1TGxhRyfXQTaEa78q9UyLVsyUv9FxDsd6uspEobl+l+uwzq
         njL8ntd5c5SxnF8Sd0ofAN2Obmyl189hJngoYBExj/zRJhz+TkKQ6o3ITRyk+8EgGHC8
         OTh6MkUOIJfbZVHBLAp4DXXwpx8rXyVoeqOWAQgYr0JGt/Nepb9AXCCOSsna74Fe5BHw
         /Ji7gCF5u636A09ciX8Q/HuRg8RZ/0LA4iqXFZ+SEZiWGe6Mt7QGI8zGi0TNGiaWHpr/
         fMhdWLrMQI2lai8FPcdOerJss3uHQorPy+DQO1tHgn+y0hod7n0Sguqi6lMrS4AQR4rf
         o+DA==
X-Gm-Message-State: AOJu0YwH5gOnBl4RSnmvkjoqcdc1PuwXcZGs5GVjACRm/+4vXj0TZlws
	M8MT/MCXFrE0AiC5qM77U+jjXnXg/gA57GGd79+jxGeM4rkqMKcTbyhh
X-Gm-Gg: AfdE7cmfTUJH0Qq+Nq/5KUIuAoWDVDt7hjg3r+ZGyjIyNedukiiiBj4GqME3PtZx3VF
	6ZjSUU3NCItD2UFqwGoBeyZT/LdFp3oQcUrn2q1JKmW8H2Dl4G4N30zTj4G3BEjGtPrjF5+B8zg
	LKA/6OiyLM4WFM4vnwBattqve4N4ovbu7/rlYLTzn42O+++IwukqYC7qC+R28uwfHJvgzHHHIsn
	4nEbou0gSPxbBfBzBGVZ6kNwtj+C4e0DTqN9aCiLkoC5eS/pTDMbthzh2X7CYfdiPGfP0Kci0Nt
	xTpFdDpFcGxdp8eVDK2aZkLDjGr4AWeVKpwqQPay6GLdWsSKbXO3iYSDmA8iO1B4fL/sXPiC/e9
	ChO+eiiRpVXswg9RXcGy6lFU6TCGNBeS9F3SwOV+v4KYNZ0Zd0gu2MOMXP1ZOZGuV7xR43ZSEKY
	NOZCntUtAsaBmstQMmo6HQ
X-Received: by 2002:a05:6a21:6b83:b0:3bf:7bf7:7903 with SMTP id adf61e73a8af0-3c1102d7d04mr22331467637.15.1784156381411;
        Wed, 15 Jul 2026 15:59:41 -0700 (PDT)
Received: from fedora.taild6b28d.ts.net ([190.183.80.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42a155bsm4772473c88.7.2026.07.15.15.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:59:40 -0700 (PDT)
Sender: TheySaidThisWouldntFit <mariano.ignacio.baragiola@gmail.com>
From: Mariano Baragiola <mbaragiola@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Mariano Baragiola <mbaragiola@linux.com>
Subject: [PATCH] staging: rtl8723bs: validate monitor transmit frame lengths
Date: Wed, 15 Jul 2026 19:59:38 -0300
Message-ID: <20260715225938.1403192-1-mbaragiola@linux.com>
X-Mailer: git-send-email 2.55.0
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

