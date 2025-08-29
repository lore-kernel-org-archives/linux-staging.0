Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA280338F42
	for <linux-staging@lists.linux.dev>; Fri, 29 Aug 2025 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756487006; cv=none; b=GKBV2Enz7OezTpbXad+3JafmrYp8NOXyT+MHHkynCPSd2dz9Y79owAB9zgemRpyhQOvgwozWszrgEoRPrixMnr1v+xJj8zIgt7VE17FWcndpE4csiCnnewh0FVr4fhbv5aBVtDY65oyiGguBZWDChVR35YE7RoFimou50SpZtMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756487006; c=relaxed/simple;
	bh=Yj8GgQHcYPk/8MsvzXwtntET1t6AOwHTh+SqGAGuHME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbzqfmW7k1B0Rksrrcpu2PnvKsrpnetQW867UhvZTDDoZtZ6X2KrPlEyoBaJMvYsHHE+PHHzpoTDk4blbcqazFigsv+MZS5DRiyFdF34aPTQCyi8jZS8RrwkkAObAmKYNMEitYAbkHTkUR97dUOskC1Vu2fwybndLTSlJ8rQ04g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZ9wICJ3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZ9wICJ3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7d485204so15118795e9.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Aug 2025 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756487003; x=1757091803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HtyHKJospcVS3KeZgDUFjTDLC4HdU0sb/TKr8pa13yo=;
        b=XZ9wICJ3JLb0mbIyrbM2se6KGoh2/ZjHhs5glZVbPVoXTiVByT6dvv3Qiadnnqe+Sl
         JstFH6etP0vdfpxBpByE3kkNyWTytjWKYDXeNopwIHyo9EZEZnSXIRTxBv9/iD6HbaCb
         S7nw1/XBgCqu8+5LzHTK3r5nhmN8g9UkeXC14LcjVWitcsSmwJYCqi72tGPsWj78V3AX
         UjUFF3RJA2h70d+B7WwF0vraB1i4HypYmcaixthgBAk0ERgVQDlHgLU+puZZAgySZz9m
         pOta30dnki22+FHKxapHxzwIpLDMSIIsmLrzUUpSFk47/JtP3N1VaRMiKHByzAZc4EA9
         44ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756487003; x=1757091803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtyHKJospcVS3KeZgDUFjTDLC4HdU0sb/TKr8pa13yo=;
        b=Pu8v9mPqPn+AUG6WIi0YmwNz+JpV4j2xlbal8An/xat/tRaT5nLhbLoTEKyyzec1Ah
         pqVUNtM4HkoBuDh1QVKocZz1wBWh+r9nyF5KgmTAl9/W8FWXoatevpmNIKwtV4gyCiVz
         wrP6anNMZZBeUArc3zwnRhJFIJiWNOhPXhLDGa4vVTnzjbeehyEND3765CT6Le8m8hdm
         dXN50J6FZXli5/KhhaPzuGKO9o9LgfUBt0BwvvCKHL8+b7717JSAcktRNfAVipXCR2ef
         OIWM497Wn7FLWeLHO0LLzlEcNUwEjmFCw4N+CLWebAR0sQkfToHYbtOHHchuxSQ2nVKK
         /i3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPwkaqepV9oQcBiE582TZvJ9jAXBFU+HW4UeOUssaa56MzPPT20ajdKV330cIRMpMnp9yiAvp6r43Cz+Xf@lists.linux.dev
X-Gm-Message-State: AOJu0YzCdVVDoBNoVnFYig40TYT2sIKJjRS2ZWxswke4H6pmjraUrga8
	shVJWc9GKVLx11LO2lO2hk/K7an8tXpSwS04QAU/rwNGMyBDhoB2sXMl
X-Gm-Gg: ASbGncvWu8oTYWsFs1jJ2d84U1HF+j3/INJUgh0nVn8YQkGyC6THQGVMt3KaaYrJ+Gj
	eHRcW8+7RIyLEqOpWWUfD46DV2RQf/TnUzjMgb9GN6745ZXyIQ2jcBGoas5ijl4XSMJCVtnAmEN
	CGYGiHCoyL1YOqC9Se0WgfEubrOmjZMJRNmfhjbBnWn0RA4O7Pt2EHwdgpU24MT+QUixSPvK5eU
	Wf6Z4vJ9HJKuCdyl20Tajb4ybr2WVaNj+VnvuM8aEupOWaBn2UqiDoVXCJ8DtxcdjCFE0M0n5+E
	lhhmzwFmonrvZDBmE1sYRKayzfiwH6n9u7la3KgLkHqYcJC0YB3m216gicl0RY2rlftP2LV+0/C
	IbI7bZ9MU+Sd5m5sj0TyTfOH3bxduzK/9oiHLW/xI5VMbKMHi1cMo
X-Google-Smtp-Source: AGHT+IFPc1usQCZpsMYEW51GA55Xzjx6ZOJe2CfG3CWIp2XhTtt+tKp3QU3F7m0uivA1qrJQ69morw==
X-Received: by 2002:a05:600c:4f03:b0:458:a7b5:9f6c with SMTP id 5b1f17b1804b1-45b5ec68358mr186451705e9.11.1756487002648;
        Fri, 29 Aug 2025 10:03:22 -0700 (PDT)
Received: from simo-Alienware-Area-51m-R2.. ([41.143.13.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0c344f6e3sm2915756f8f.35.2025.08.29.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 10:03:21 -0700 (PDT)
From: Mohammed GUERMOUD <mohammed.guermoud@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed GUERMOUD <mohammed.guermoud@gmail.com>
Subject: [PATCH] staging: octeon: Clean up dead code in ethernet-tx.c
Date: Fri, 29 Aug 2025 18:02:53 +0100
Message-ID: <20250829170253.16737-1-mohammed.guermoud@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple blocks of non-functional code disabled via '#if 0'.

The removed code was a placeholder for incomplete hardware offload
features, as indicated by `FIXME` comments. Remove this dead
code to simplify the driver.

Signed-off-by: Mohammed GUERMOUD <mohammed.guermoud@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.c | 40 ----------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 261f8dbdc382..c659b69bac24 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -574,42 +574,14 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 
 	if (skb->protocol == htons(ETH_P_IP)) {
 		work->word2.s.ip_offset = 14;
-#if 0
-		work->word2.s.vlan_valid = 0;	/* FIXME */
-		work->word2.s.vlan_cfi = 0;	/* FIXME */
-		work->word2.s.vlan_id = 0;	/* FIXME */
-		work->word2.s.dec_ipcomp = 0;	/* FIXME */
-#endif
 		work->word2.s.tcp_or_udp =
 		    (ip_hdr(skb)->protocol == IPPROTO_TCP) ||
 		    (ip_hdr(skb)->protocol == IPPROTO_UDP);
-#if 0
-		/* FIXME */
-		work->word2.s.dec_ipsec = 0;
-		/* We only support IPv4 right now */
-		work->word2.s.is_v6 = 0;
-		/* Hardware would set to zero */
-		work->word2.s.software = 0;
-		/* No error, packet is internal */
-		work->word2.s.L4_error = 0;
-#endif
 		work->word2.s.is_frag = !((ip_hdr(skb)->frag_off == 0) ||
 					  (ip_hdr(skb)->frag_off ==
 					      cpu_to_be16(1 << 14)));
-#if 0
-		/* Assume Linux is sending a good packet */
-		work->word2.s.IP_exc = 0;
-#endif
 		work->word2.s.is_bcast = (skb->pkt_type == PACKET_BROADCAST);
 		work->word2.s.is_mcast = (skb->pkt_type == PACKET_MULTICAST);
-#if 0
-		/* This is an IP packet */
-		work->word2.s.not_IP = 0;
-		/* No error, packet is internal */
-		work->word2.s.rcv_error = 0;
-		/* No error, packet is internal */
-		work->word2.s.err_code = 0;
-#endif
 
 		/*
 		 * When copying the data, include 4 bytes of the
@@ -619,12 +591,6 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		memcpy(work->packet_data, skb->data + 10,
 		       sizeof(work->packet_data));
 	} else {
-#if 0
-		work->word2.snoip.vlan_valid = 0;	/* FIXME */
-		work->word2.snoip.vlan_cfi = 0;	/* FIXME */
-		work->word2.snoip.vlan_id = 0;	/* FIXME */
-		work->word2.snoip.software = 0;	/* Hardware would set to zero */
-#endif
 		work->word2.snoip.is_rarp = skb->protocol == htons(ETH_P_RARP);
 		work->word2.snoip.is_arp = skb->protocol == htons(ETH_P_ARP);
 		work->word2.snoip.is_bcast =
@@ -632,12 +598,6 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		work->word2.snoip.is_mcast =
 		    (skb->pkt_type == PACKET_MULTICAST);
 		work->word2.snoip.not_IP = 1;	/* IP was done up above */
-#if 0
-		/* No error, packet is internal */
-		work->word2.snoip.rcv_error = 0;
-		/* No error, packet is internal */
-		work->word2.snoip.err_code = 0;
-#endif
 		memcpy(work->packet_data, skb->data, sizeof(work->packet_data));
 	}
 
-- 
2.43.0

