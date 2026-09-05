Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442AE4B04B6
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622548; cv=none; b=QHBWyiLJU6lCjF5IoVyIqNu3CseNMnUDnZYhfcj/IsC//Ao3BmwHIPNtB+2Y9k0yugkiFNsBbm2qRS4y6ZZ7gv0wtJq+0rvz4IE/FZdrt1G89FpVkGFVxKSIyeX1ZiVtK3ErReR39UuYFXIVyD8evtqiCQYhA+vSjhnLQ8Q/H2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622548; c=relaxed/simple;
	bh=GvmssypO3wFrEaIA/09y7tkUfGE1ozQEU6tFnebwajA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3IQN7wyVNPGPq3AzLDbOr8rAYzH1b0ky87DAwyNcjPd5OLmhBwXA3Cr1c5dBfhEPEINWrH0ouh4Fs+LZAUw8KeCwfxe4YyD9Drb8R1rQyHrsMOc8iIxpmeYh1P4n6RNBf3I+nn5pO1WbySkjeuotF7HZOvUOuR7bJZOUpDnpnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwvEt8De; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwvEt8De"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39931869b4aso94178a91.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788622545; x=1789227345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm42doHswCi3RtZeu7IIEEdGs2pytFeZf/X0boG9eKM=;
        b=VwvEt8DevZgh8YOzL7G1DxXdNatpTGY4CnfxdXAewPzObgrbIeGcCdBb5J5V/kLXHU
         LkUVeTrHNquDPnoem4X4sHxcdCdVViKXuQDVlZVkPtJqEgHBhmTgqWjUZkGMc8IJYo7o
         Va8Czy0O/6htjCUdRAxFtnT1GSO/EFy7+6JHF9jbKcvZ61TbMAPPuvaR1ilV6RH68IPh
         Vmg+whJxtayiJbMx/Da57FsfrilrfKZivIarJKEMY5dWRPR5Xy+2p1ybbuF9GxRZXSEy
         GplCqZWXjlHQUYd2LZtX0hwB7gCOMHVH5QmIrMI/E2LZXv+EoxWVGruNUIiTFQ6bAmg3
         oCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622545; x=1789227345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lm42doHswCi3RtZeu7IIEEdGs2pytFeZf/X0boG9eKM=;
        b=c/G0IDBH4IHUnnUsM+XIBdbd9t3bpN9ZZLFY6Gl/Fa3La0fUSbSJjr+uFFdHyaK285
         qSu6upgCh1swzWlsOX5F5hRnOch2+t4IYtQH2FcMdfSqC1mF4D376dWOWKvVL9sXFNTp
         XkYVQoScDOGWdlxBBD08A6YPt4o/Qe0qoClrynWDjIW012fLLZ/PoVayqpYHJfbMnvp6
         qQ7mVb0ynj1zrppuDEhElMegKJznhceF5L2V52h/lcvEsVcF5+wZc3MmoTUwJgOYu2XE
         61gq/7In7+rxYuZCfoIBA1KySVgeGn66LMIPFHV1QTULeV4Jp9a0fGng75FIwaY8bMMq
         kcbw==
X-Forwarded-Encrypted: i=1; AKwUvBzYOl4oPhJmQof2e7Y20wunJogWyBFYN+hZ+5PVpyCp5LVYVA4BR7kHrFlPNaHxAkWZhSok+Yi7bol7GxCj@lists.linux.dev
X-Gm-Message-State: AFuF++nQI0zhTJ2ob0NqLP/bAfstgDxkrFq9Sg3elED4nC9Vu1NLMcxH
	yLdVpr5KOEv66YyJ1lBDR3ZGK877uRJZ8S+6E2HYt4VybUEiO1KFFVod
X-Gm-Gg: AYBFou3o3vulUaf9AfrzjU9FpN7RFIWjZB87SAKYefE129/epmhnp/QtMp10w+cF0vk
	eOGNGpTnaHqnIGD1tcIDnzRfb5HmGqkQP3341/vx535fzyy2zD8g8hqiCsd/Q6dx23oAUJTcreN
	FFT3y9wTeMH2ZfLEh/XyuJVKUH1rmBrxASn0j8LJQEck0VrtoiSNeIuPKAGAHKrNInFPko2U54h
	o1YZXY2bJKB0T/NaxR1x1joR7zQz860i9wWZ89KsbwHedBSXZrRBAUJ4yHa0tY842Tix3mpg6em
	BJ7Fn/F4XTehh2nzCjSagYkPxGOXRCqyRQrXAR8D4p7cIwJ2rmL+A/8HCRPZsCuo5RiguVZixwn
	MheQzevPVUKKLE3ZHo7YhQXfN/xMcgew/Eu3VlehXzbbTi1U+9Y6jxkKPYm8ArPcWq4vXYuXYzS
	AkN9HREYiZ9vDbWtfhIKi57fnwT1bYaOX/lgDZLyS0AoTBLeoQAgXzb0AEpLECCnseXgoRaU3hG
	358OzIl0ZIUfosNQgw9s1t+o9Lokf25w+0o2KFGKQsWZGI7DQnYmqqXUK0MgX3GJUOosfx16icG
X-Received: by 2002:a17:90b:528c:b0:38e:7069:7117 with SMTP id 98e67ed59e1d1-39b3d3f7890mr7019686a91.0.1788622544549;
        Sat, 05 Sep 2026 08:35:44 -0700 (PDT)
Received: from fedora.iiita.ac.in ([103.119.35.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm10493484a91.11.2026.09.05.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:35:44 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	ayushmukkanwar@gmail.com,
	sashiko-bot@kernel.org
Subject: [PATCH 2/2] staging: octeon: fix out-of-bounds reads in tx path
Date: Sat,  5 Sep 2026 21:05:30 +0530
Message-ID: <20260905153530.36693-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
References: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. cvm_oct_xmit() and cvm_oct_xmit_pow() blindly trust
skb->protocol == htons(ETH_P_IP) and dereference the IP header
without verifying if the packet is long enough or if the header
is in the linear skb data area.
Fix by checking if skb_headlen is larger than
skb_network_offset + size of ip header.

2. cvm_oct_xmit_pow() copies packet data into a fixed size
hardware buffer using a hardcoded memcpy() size. If a packet
is smaller than it, memcpy() will read past the end of the
skb buffer. Fix this by using min_t() so that it does not read
past the end of the skb.

Fixes: 80ff0fd3ab64 ("Staging: Add octeon-ethernet driver files.")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260615172734.42038-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Note: This patch has only been compile tested. No runtime testing was
performed as I do not have access to Octeon hardware.

 drivers/staging/octeon/ethernet-tx.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 5e536827f87a..452bc9fc8a5d 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -361,6 +361,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	/* Check if we can use the hardware checksumming */
 	if ((skb->protocol == htons(ETH_P_IP)) &&
+		(skb_network_offset(skb) >= 0) &&
+		(skb_network_offset(skb) + sizeof(struct iphdr) <= skb_headlen(skb)) &&
 	    (ip_hdr(skb)->version == 4) &&
 	    (ip_hdr(skb)->ihl == 5) &&
 	    ((ip_hdr(skb)->frag_off == 0) ||
@@ -571,6 +573,14 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 	work->packet_ptr.s.back = (copy_location - packet_buffer) >> 7;
 
 	if (skb->protocol == htons(ETH_P_IP)) {
+		if (unlikely(!pskb_may_pull(skb, ETH_HLEN + sizeof(struct iphdr)))) {
+			cvmx_fpa_free(packet_buffer, CVMX_FPA_PACKET_POOL, 0);
+			cvmx_fpa_free(work, CVMX_FPA_WQE_POOL, 1);
+			dev->stats.tx_dropped++;
+			dev_kfree_skb_any(skb);
+			return NETDEV_TX_OK;
+		}
+
 		work->word2.s.ip_offset = 14;
 		work->word2.s.tcp_or_udp =
 		    (ip_hdr(skb)->protocol == IPPROTO_TCP) ||
@@ -587,7 +597,7 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		 * does.
 		 */
 		memcpy(work->packet_data, skb->data + 10,
-		       sizeof(work->packet_data));
+		       min_t(unsigned int, skb->len - 10, sizeof(work->packet_data)));
 	} else {
 		work->word2.snoip.is_rarp = skb->protocol == htons(ETH_P_RARP);
 		work->word2.snoip.is_arp = skb->protocol == htons(ETH_P_ARP);
@@ -596,7 +606,8 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		work->word2.snoip.is_mcast =
 		    (skb->pkt_type == PACKET_MULTICAST);
 		work->word2.snoip.not_IP = 1;	/* IP was done up above */
-		memcpy(work->packet_data, skb->data, sizeof(work->packet_data));
+		memcpy(work->packet_data, skb->data,
+		       min_t(unsigned int, skb->len, sizeof(work->packet_data)));
 	}
 
 	/* Submit the packet to the POW */
-- 
2.54.0

