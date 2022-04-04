Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5D17A;
	Mon,  4 Apr 2022 14:39:26 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id j12so7232523wrb.5;
        Mon, 04 Apr 2022 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4e0THtH7HznDcWSwiMPH5m54e1RQzNhsqL65CUDNWCc=;
        b=m0FPiCI/2iSJfaW0JLY1BQ9yaPDiWcVCMxC48R1jFyV2Uo2PXe6Jb59KM+IefL9Fzg
         N9jM86q5XZM2sIY2NZ9YlzvheAs1NPUjPPEvknZo1dQeLCydt+xvhGDxPRnyV0/qE/jJ
         eUYo3lSpV7S8M9QddHSnBde1ZGqO5c7q5u0CJudSNTfWONtA9zxQZ1tZRyyXDplUjYt9
         l7e1TXq50hZRaQO7tAka/ww/U+bK+witTmF7RZKjO3x5mVMbr2xgfV4cBA0btVqK2q3K
         et3nYXPGsOxW1VTIzDeAujQSghd5ZiokrlZk3h18kotHEAPxk68uU+qGVXIMAGiX46ui
         byiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4e0THtH7HznDcWSwiMPH5m54e1RQzNhsqL65CUDNWCc=;
        b=QxmvLWxieI4Nm6YuGEVv+dISH86xdYuABjrmotIDOczuvnftIarQ9uZAIqPcRAug0k
         DOO4lDHAD9CcYuUkNPu/6vJ27CUOa1SEUN+2Gk44TBbXGXDqrjsQmMBpDKW/v4t0VmkV
         aVAUOzGBl23KG8F14ObwoWMs43d1QBi8um6L1mvgqIf2aLJO0QHoEptLpKGGjXad6nP0
         D/v1Rd+EQZ6AJXhqob0FebrMHBGx76dyTx5H8a+kZzwrYcmWrfKtdZXzdn350WYz4CHW
         qPIR3CBEQkpMG77qMr8uwg/dA9wTA7zGot/aJ44/tiAIzwdFUSj42iklddFlrHKX7C8p
         8MrQ==
X-Gm-Message-State: AOAM531vTg7wSJPzoj538f6igCVTFkr7/KIE8nTJaFHEjhFbgStIS1ZH
	RaE2uqwNxWyXz1wZ0qoAbec=
X-Google-Smtp-Source: ABdhPJz/cBmXoYIm2iieMeipG7my0PpjLNQJYJJOye42uAfdsxGGcgrk3YvBbBAk1w64GHs+C+Fq9w==
X-Received: by 2002:a05:6000:1687:b0:205:80b7:afca with SMTP id y7-20020a056000168700b0020580b7afcamr16584445wrd.665.1649083164246;
        Mon, 04 Apr 2022 07:39:24 -0700 (PDT)
Received: from alaa-emad ([41.42.174.117])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5406000000b001f049726044sm9447984wrv.79.2022.04.04.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 07:39:23 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH 1/2] staging: r8188eu: add space around arithmatic sign
Date: Mon,  4 Apr 2022 16:39:16 +0200
Message-Id: <860d8e222e2b695ce5cb4f48aa46a7f66e05d8e4.1649082939.git.eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

CHECK: spaces preferred around that '+' , '-' and '*'

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 58 +++++++++++------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index d68611ef22f8..7c664f80fa99 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -87,19 +87,19 @@ static int skb_pull_and_merge(struct sk_buff *skb, unsigned char *src, int len)
 	int tail_len;
 	unsigned long end, tail;
 
-	if ((src+len) > skb_tail_pointer(skb) || skb->len < len)
+	if ((src + len) > skb_tail_pointer(skb) || skb->len < len)
 		return -1;
 
 	tail = (unsigned long)skb_tail_pointer(skb);
-	end = (unsigned long)src+len;
+	end = (unsigned long)src + len;
 	if (tail < end)
 		return -1;
 
-	tail_len = (int)(tail-end);
+	tail_len = (int)(tail - end);
 	if (tail_len > 0)
-		memmove(src, src+len, tail_len);
+		memmove(src, src + len, tail_len);
 
-	skb_trim(skb, skb->len-len);
+	skb_trim(skb, skb->len - len);
 	return 0;
 }
 
@@ -117,7 +117,7 @@ static void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr,
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_IPV4;
-	memcpy(networkAddr+7, (unsigned char *)ipAddr, 4);
+	memcpy(networkAddr + 7, (unsigned char *)ipAddr, 4);
 }
 
 static void __nat25_generate_pppoe_network_addr(unsigned char *networkAddr,
@@ -126,8 +126,8 @@ static void __nat25_generate_pppoe_network_addr(unsigned char *networkAddr,
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_PPPOE;
-	memcpy(networkAddr+1, (unsigned char *)sid, 2);
-	memcpy(networkAddr+3, (unsigned char *)ac_mac, 6);
+	memcpy(networkAddr + 1, (unsigned char *)sid, 2);
+	memcpy(networkAddr + 3, (unsigned char *)ac_mac, 6);
 }
 
 static  void __nat25_generate_ipv6_network_addr(unsigned char *networkAddr,
@@ -136,17 +136,17 @@ static  void __nat25_generate_ipv6_network_addr(unsigned char *networkAddr,
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_IPV6;
-	memcpy(networkAddr+1, (unsigned char *)ipAddr, 16);
+	memcpy(networkAddr + 1, (unsigned char *)ipAddr, 16);
 }
 
 static unsigned char *scan_tlv(unsigned char *data, int len, unsigned char tag, unsigned char len8b)
 {
 	while (len > 0) {
-		if (*data == tag && *(data+1) == len8b && len >= len8b*8)
-			return data+2;
+		if (*data == tag && *(data + 1) == len8b && len >= len8b * 8)
+			return data + 2;
 
-		len -= (*(data+1))*8;
-		data += (*(data+1))*8;
+		len -= (*(data + 1)) * 8;
+		data += (*(data + 1)) * 8;
 	}
 	return NULL;
 }
@@ -158,7 +158,7 @@ static int update_nd_link_layer_addr(unsigned char *data, int len, unsigned char
 
 	if (icmphdr->icmp6_type == NDISC_ROUTER_SOLICITATION) {
 		if (len >= 8) {
-			mac = scan_tlv(&data[8], len-8, 1, 1);
+			mac = scan_tlv(&data[8], len - 8, 1, 1);
 			if (mac) {
 				memcpy(mac, replace_mac, 6);
 				return 1;
@@ -166,7 +166,7 @@ static int update_nd_link_layer_addr(unsigned char *data, int len, unsigned char
 		}
 	} else if (icmphdr->icmp6_type == NDISC_ROUTER_ADVERTISEMENT) {
 		if (len >= 16) {
-			mac = scan_tlv(&data[16], len-16, 1, 1);
+			mac = scan_tlv(&data[16], len - 16, 1, 1);
 			if (mac) {
 				memcpy(mac, replace_mac, 6);
 				return 1;
@@ -174,7 +174,7 @@ static int update_nd_link_layer_addr(unsigned char *data, int len, unsigned char
 		}
 	} else if (icmphdr->icmp6_type == NDISC_NEIGHBOUR_SOLICITATION) {
 		if (len >= 24) {
-			mac = scan_tlv(&data[24], len-24, 1, 1);
+			mac = scan_tlv(&data[24], len - 24, 1, 1);
 			if (mac) {
 				memcpy(mac, replace_mac, 6);
 				return 1;
@@ -182,7 +182,7 @@ static int update_nd_link_layer_addr(unsigned char *data, int len, unsigned char
 		}
 	} else if (icmphdr->icmp6_type == NDISC_NEIGHBOUR_ADVERTISEMENT) {
 		if (len >= 24) {
-			mac = scan_tlv(&data[24], len-24, 2, 1);
+			mac = scan_tlv(&data[24], len - 24, 2, 1);
 			if (mac) {
 				memcpy(mac, replace_mac, 6);
 				return 1;
@@ -190,7 +190,7 @@ static int update_nd_link_layer_addr(unsigned char *data, int len, unsigned char
 		}
 	} else if (icmphdr->icmp6_type == NDISC_REDIRECT) {
 		if (len >= 40) {
-			mac = scan_tlv(&data[40], len-40, 2, 1);
+			mac = scan_tlv(&data[40], len - 40, 2, 1);
 			if (mac) {
 				memcpy(mac, replace_mac, 6);
 				return 1;
@@ -396,7 +396,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			tmp = be32_to_cpu(iph->saddr);
 			__nat25_generate_ipv4_network_addr(networkAddr, &tmp);
 			/* record source IP address and , source mac address into db */
-			__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
+			__nat25_db_network_insert(priv, skb->data + ETH_ALEN, networkAddr);
 			return 0;
 		default:
 			return -1;
@@ -421,7 +421,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			arp_ptr += arp->ar_hln;
 			sender = (unsigned int *)arp_ptr;
 			__nat25_generate_ipv4_network_addr(networkAddr, sender);
-			__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
+			__nat25_db_network_insert(priv, skb->data + ETH_ALEN, networkAddr);
 			return 0;
 		default:
 			return -1;
@@ -458,22 +458,22 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 							    sizeof(tag_buf))
 								return -1;
 
-							memcpy(tag->tag_data+MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN,
+							memcpy(tag->tag_data + MAGIC_CODE_LEN + RTL_RELAY_TAG_LEN,
 								pOldTag->tag_data, old_tag_len);
 
-							if (skb_pull_and_merge(skb, (unsigned char *)pOldTag, TAG_HDR_LEN+old_tag_len) < 0)
+							if (skb_pull_and_merge(skb, (unsigned char *)pOldTag, TAG_HDR_LEN + old_tag_len) < 0)
 								return -1;
 
-							ph->length = htons(ntohs(ph->length)-TAG_HDR_LEN-old_tag_len);
+							ph->length = htons(ntohs(ph->length) - TAG_HDR_LEN - old_tag_len);
 						}
 
 						tag->tag_type = PTT_RELAY_SID;
-						tag->tag_len = htons(MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN+old_tag_len);
+						tag->tag_len = htons(MAGIC_CODE_LEN + RTL_RELAY_TAG_LEN + old_tag_len);
 
 						/*  insert the magic_code+client mac in relay tag */
 						pMagic = (unsigned short *)tag->tag_data;
 						*pMagic = htons(MAGIC_CODE);
-						memcpy(tag->tag_data+MAGIC_CODE_LEN, skb->data+ETH_ALEN, ETH_ALEN);
+						memcpy(tag->tag_data + MAGIC_CODE_LEN, skb->data + ETH_ALEN, ETH_ALEN);
 
 						/* Add relay tag */
 						if (__nat25_add_pppoe_tag(skb, tag) < 0)
@@ -486,7 +486,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 							return -2;
 
 						if (priv->pppoe_connection_in_progress == 0)
-							memcpy(priv->pppoe_addr, skb->data+ETH_ALEN, ETH_ALEN);
+							memcpy(priv->pppoe_addr, skb->data + ETH_ALEN, ETH_ALEN);
 
 						priv->pppoe_connection_in_progress = WAIT_TIME_PPPOE;
 					}
@@ -496,11 +496,11 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			} else {	/*  session phase */
 				__nat25_generate_pppoe_network_addr(networkAddr, skb->data, &ph->sid);
 
-				__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
+				__nat25_db_network_insert(priv, skb->data + ETH_ALEN, networkAddr);
 
 				if (!priv->ethBrExtInfo.addPPPoETag &&
 				    priv->pppoe_connection_in_progress &&
-				    !memcmp(skb->data+ETH_ALEN, priv->pppoe_addr, ETH_ALEN))
+				    !memcmp(skb->data + ETH_ALEN, priv->pppoe_addr, ETH_ALEN))
 					priv->pppoe_connection_in_progress = 0;
 			}
 			return 0;
@@ -548,7 +548,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 		case NAT25_INSERT:
 			if (memcmp(&iph->saddr, "\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0", 16)) {
 				__nat25_generate_ipv6_network_addr(networkAddr, (unsigned int *)&iph->saddr);
-				__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
+				__nat25_db_network_insert(priv, skb->data + ETH_ALEN, networkAddr);
 
 				if (iph->nexthdr == IPPROTO_ICMPV6 &&
 						skb->len > (ETH_HLEN +  sizeof(*iph) + 4)) {
-- 
2.35.1

