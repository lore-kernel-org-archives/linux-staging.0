Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9BF9EB
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998541; cv=none; b=KbREpED0nFYL4FkfNLP8n5KXtqWPGAIMDZMJwbhLPNIF0C2tTUdEuYfioSVPPyKASVjAN88Eiq4fzcKq5TS9hqWIzyVm2mSzZRfJF0U1wItqNaE4OqU1EYxbZK2NEQouVmU5yOL19lf/UAkaupUSmNfbDxx26smybSRf3tEVGgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998541; c=relaxed/simple;
	bh=t8bUqFZN1owoEoHVvTQ4d2z8i0LYblqwDfyn4BS8DSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bMVB644twZfGB4330bGbeBlxuMvKu0oDsjddYfZCFyL9iu4tLdyqJZVIsyZzI8v4Zoloh5aLEpxfnEvSbUmdogQkyMIJugQJpiDa1vfw9MxYpQSwmbENzPyes0vWaBrS2Yg6aM4FTjzDizc7iEis7OvJc3zfdsSjkMiMMQZsBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=NEvZXqwW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="NEvZXqwW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f7028196f2so6599165ad.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998539; x=1718603339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBV/g926v6WU268d43iPrmXQkFNUHSMZ6p/vRmizITE=;
        b=NEvZXqwWo/1ziXA8ykEASfXAvRE8P1j/DcHCENEDcgmsyjicUDAuDnlk8V8XBaM1oK
         x4K6QO2hdEXqNbGDh9mtyUNaVpZdimHCqqSXlN92JGg5j6xbquIhv7qL/ExW4uDCAsJb
         0Dd6BqRQk7x4wDPPJbKGloUmsYxXTGajr++y+22TK8c1Hue5aWE63qHUkGeEoAfzTT+Q
         KyqdaDAbTOmPbmaaqew2IxXWbQ1Ka6xFCsEq2XriiYz4iH1MMyV+0bZaj5BCesdmxB4w
         U71esMb8bIp6UaOXnT+KqA3nok5eB7lx3QITpH+EToKTafmsDKoE/0t44RGZ5J7iUFXQ
         W2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998539; x=1718603339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBV/g926v6WU268d43iPrmXQkFNUHSMZ6p/vRmizITE=;
        b=tnAFX93BPLLzD/+4n9+oUQ0qe8yQCeK6ed22k2ghcm6IcPf2z8HH9zqkdI+iIyTmAL
         pJooTsXGVTCbVxI4uqTujzqtS+RAPpdR3f8q1I0CE0yo1lR7aPQoHN0pVpbeCSVJObZ9
         K3IyL0JX+0GFZfzVIoLYZii66qLny15k0jzGzmqsMJKstOahMmpDaAHjDSetaAChfVaU
         8Zzur3PJ5HzNTZ3dvqH71/5y7OZ27NcgKdrW4hMsYvHR/LFvn7i6ylfCh9o9oSXFglfm
         0DiEy3/ONGE7hSJJYarHJ7JLjHM/BHr9KLQiZvWsB4VvsRtAJAUk5ipapvIHWMQ91KDG
         GEFQ==
X-Gm-Message-State: AOJu0YzesL3OZRQ0iNWo+oSu1eL8x017ofIirnuSxMqGSD435c/h9VpM
	jYWogNNdyPVmF0ALU4qzMXWyoeYxSW3YiJaOnEnYd2SKdEPFwzlW5FMB9PjwHWo=
X-Google-Smtp-Source: AGHT+IHjXzYTyqNnCOBveV6jWpuqnfHdjUVpEylW4oFwYpVmuRo5xWs1vZQkRQS7r0zRpzUVfC9BoA==
X-Received: by 2002:a17:903:2347:b0:1f7:187f:cb5b with SMTP id d9443c01a7336-1f7187fcd7bmr11855255ad.64.1717998539001;
        Sun, 09 Jun 2024 22:48:59 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:48:58 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/24] Staging: rtl8192e: Rename variable bIsMulticast
Date: Sun,  9 Jun 2024 22:44:27 -0700
Message-Id: <20240610054449.71316-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bIsMulticast to is_multicast
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 87d1ff943617..8856191a1228 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -538,7 +538,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 	u8 src[ETH_ALEN];
 	struct lib80211_crypt_data *crypt = NULL;
 	struct cb_desc *tcb_desc;
-	u8 bIsMulticast = false;
+	u8 is_multicast = false;
 	u8 IsAmsdu = false;
 	bool	bdhcp = false;
 
@@ -655,14 +655,14 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			ether_addr_copy(header.addr3, dest);
 	}
 
-	bIsMulticast = is_multicast_ether_addr(header.addr1);
+	is_multicast = is_multicast_ether_addr(header.addr1);
 
 	header.frame_control = cpu_to_le16(fc);
 
 	/* Determine fragmentation size based on destination (multicast
 	 * and broadcast are not fragmented)
 	 */
-	if (bIsMulticast) {
+	if (is_multicast) {
 		frag_size = MAX_FRAG_THRESHOLD;
 		qos_ctl |= QOS_CTL_NOTCONTAIN_ACK;
 	} else {
@@ -774,7 +774,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			/* The last fragment has the remaining length */
 			bytes = bytes_last_frag;
 		}
-		if ((qos_activated) && (!bIsMulticast)) {
+		if ((qos_activated) && (!is_multicast)) {
 			frag_hdr->seq_ctrl =
 				 cpu_to_le16(rtllib_query_seqnum(ieee, skb_frag,
 								 header.addr1));
@@ -809,7 +809,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			skb_put(skb_frag, 4);
 	}
 
-	if ((qos_activated) && (!bIsMulticast)) {
+	if ((qos_activated) && (!is_multicast)) {
 		if (ieee->seq_ctrl[UP2AC(skb->priority) + 1] == 0xFFF)
 			ieee->seq_ctrl[UP2AC(skb->priority) + 1] = 0;
 		else
-- 
2.30.2

