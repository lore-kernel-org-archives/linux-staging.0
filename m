Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2FE2FAD
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 15:52:42 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id n18so2680594pgm.12
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7joQz/hOZYHbWQ9qAx5++37t6jQRt6wCbSFQEQk4D+4=;
        b=U4JNeZa2IJQ3lNZ25s0B9ssli4sJSz30z/iSzkApoIxvb0Ne3wwBiGh2rpE/QKtReZ
         ByOzgP6uMZDSkO5k6TwR1IodurtURiC1IiYiC9zswcpBuxY4WxVqrYrNTYoRDpeXDZnX
         KT76J6AXxrUaROmR8MUhVUvIWRSUOqSSXX4UBlCzkPYWyKHXP6TCC5cSvnuOA01nORNW
         qPHExQTNoKYicBYK3ehzKnSLjrsqfPLzlcO8m7phKEmuLGB60nDhBPngSTMEO6bN8/nq
         NcbKf1EmlsC3UdRP8D3JdXCTVydF9HZn0/zsybXf7fNLYgJWxl8dY4MI7YwQX2penW99
         pwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7joQz/hOZYHbWQ9qAx5++37t6jQRt6wCbSFQEQk4D+4=;
        b=HigcbhDtUnkwsIV5SppYj8Gtn67s+JgpF3NGnoWU22k/bz2+ZNRSWmgi0FLPr9jPwy
         j5DNAvcjMfn7bzxk+0uumgL0RSz4zZT3yEC12+IfLsaaAurqdKRuDItEnjQ/tLWHwI2N
         U3bWbUK9L7Nh2JPxskoktFiU3uRJ1M0JyxMPdCHTZ9W90dt3Po7ddas4lHBLChZ8mgmy
         4mbpSphHGp4d0SF+y7Il/cBDxq4oyL5jol5q2WLhi8QEkPmeGanQZaFC3op3xQZW9SB5
         zW+gkBBD7Jkio9bv5+nZ0t1MoIbC94FM9HCuPgLJqf7HDV2Cp7hs7SEtwN2CbHXmG+7m
         MEfw==
X-Gm-Message-State: AOAM53244nGwsTXPavOuzpmaxqEr+iQPQZEb+5l3yttcVkt/s1u8UwcI
	FVnUcrFE50jAHq3/4xXUMVM=
X-Google-Smtp-Source: ABdhPJzZ4nccoyG4Ic1nRVbpyrH2juSNM44U7HNyj4JeHDQfXwFXgte8i4EmtUTRRmozJVBYpsQj4Q==
X-Received: by 2002:a63:100e:: with SMTP id f14mr9671256pgl.188.1629301961761;
        Wed, 18 Aug 2021 08:52:41 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id e26sm159272pfj.46.2021.08.18.08.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 08:52:41 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bjorn@helgaas.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] staging: r8188eu: clean up endianness issues
Date: Wed, 18 Aug 2021 21:22:36 +0530
Message-Id: <8a3fca82d9ec5dde9e42d40f0268a324cc87ebc6.1629301854.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix these sparse warnings:

> rtw_br_ext.c:73:23: warning: restricted __be16 degrades to integer

Here tag->tag_len is be16, use ntohs()

> rtw_br_ext.c:601:57: warning: incorrect type in assignment (different base types)
> rtw_br_ext.c:601:57:    expected unsigned short
> rtw_br_ext.c:601:57:    got restricted __be16 [usertype]

> rtw_br_ext.c:664:45: warning: cast to restricted __be16
> rtw_br_ext.c:771:84: warning: incorrect type in argument 3 (different base types)
> rtw_br_ext.c:771:84:    expected unsigned int [usertype] len

Cast MAGIC_CODE as unsigned short

> rtw_br_ext.c:771:84:    got restricted __be16 [usertype] payload_len
> rtw_br_ext.c:773:110: warning: incorrect type in argument 2 (different base types)
> rtw_br_ext.c:773:110:    expected int len
> rtw_br_ext.c:773:110:    got restricted __be16 [usertype] payload_len

> rtw_br_ext.c:836:54: warning: cast to restricted __be32

Unnecessary double cast?

> rtw_br_ext.c:839:70: warning: restricted __be16 degrades to integer
> rtw_br_ext.c:845:70: warning: invalid assignment: |=
> rtw_br_ext.c:845:70:    left side has type unsigned short
> rtw_br_ext.c:845:70:    right side has type restricted __be16

dhcp->flag is u16

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index e8eea95a52e3..8eb7475726e1 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -70,7 +70,7 @@ static int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
 	struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
 	int data_len;
 
-	data_len = tag->tag_len + TAG_HDR_LEN;
+	data_len = ntohs(tag->tag_len) + TAG_HDR_LEN;
 	if (skb_tailroom(skb) < data_len) {
 		_DEBUG_ERR("skb_tailroom() failed in add SID tag!\n");
 		return -1;
@@ -598,7 +598,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 
 						/*  insert the magic_code+client mac in relay tag */
 						pMagic = (unsigned short *)tag->tag_data;
-						*pMagic = htons(MAGIC_CODE);
+						*pMagic = (unsigned short)MAGIC_CODE;
 						memcpy(tag->tag_data+MAGIC_CODE_LEN, skb->data+ETH_ALEN, ETH_ALEN);
 
 						/* Add relay tag */
@@ -661,7 +661,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 					}
 
 					pMagic = (unsigned short *)tag->tag_data;
-					if (ntohs(*pMagic) != MAGIC_CODE) {
+					if (*pMagic != (unsigned short)MAGIC_CODE) {
 						DEBUG_ERR("Can't find MAGIC_CODE in %s packet!\n",
 							(ph->code == PADO_CODE ? "PADO" : "PADS"));
 						return -1;
@@ -768,9 +768,9 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 						struct icmp6hdr  *hdr = (struct icmp6hdr *)(skb->data + ETH_HLEN + sizeof(*iph));
 						hdr->icmp6_cksum = 0;
 						hdr->icmp6_cksum = csum_ipv6_magic(&iph->saddr, &iph->daddr,
-										iph->payload_len,
+										ntohs(iph->payload_len),
 										IPPROTO_ICMPV6,
-										csum_partial((__u8 *)hdr, iph->payload_len, 0));
+										csum_partial((__u8 *)hdr, ntohs(iph->payload_len), 0));
 					}
 				}
 			}
@@ -833,16 +833,16 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
 					struct dhcpMessage *dhcph =
 						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
-					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
+					u32 cookie = dhcph->cookie;
 
 					if (cookie == DHCP_MAGIC) { /*  match magic word */
-						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
+						if (!(dhcph->flags & BROADCAST_FLAG)) {
 							/*  if not broadcast */
 							register int sum = 0;
 
 							DEBUG_INFO("DHCP: change flag of DHCP request to broadcast.\n");
 							/*  or BROADCAST flag */
-							dhcph->flags |= htons(BROADCAST_FLAG);
+							dhcph->flags |= BROADCAST_FLAG;
 							/*  recalculate checksum */
 							sum = ~(udph->check) & 0xffff;
 							sum += be16_to_cpu(dhcph->flags);

base-commit: cbfa6f33e3a685c329d78e06b0cf1dcb23c9d849
-- 
2.32.0

