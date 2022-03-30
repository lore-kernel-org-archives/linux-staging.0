Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7047C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 18:52:56 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id b16so25933970ioz.3
        for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 11:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northvilleschools.net; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=csFzrGs94hc9ejuvCE+fZueUzzUfTyueT4QFad6sO7A=;
        b=kbnhEsKnagC3ws+rlRgd+RU28wvTNGRtMhsWmEWwmbYiqPqptlBL+A9mL7v0airgXu
         nctI+WMn3dDObMW9CsUdJpTlbW4vKrL5pBUyx2pjSAtqZVv+f4VoIF+urD25EjG4nG9u
         zLzFJIR4zoloxEVaPi2GQ7QjUEqZ9P2Zo2he6oaRZpKVsIm/s2LjMtk1F6dvaljt9fHj
         O23mashsppwcbvWYUVZkgQs9nBEuiiElBXVO4KUIO2L6k/7d83gLBgZfI/FJ1ci/tLVu
         sdfVNmsRF/qL4/DMVmAdkYk56XSbbKN/ryP/n2Us/yIx2PBPQQg8HII6vraxFFJ72lWN
         sMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=csFzrGs94hc9ejuvCE+fZueUzzUfTyueT4QFad6sO7A=;
        b=lRyU8DI7NgGNKYniL0bhy52GSonHt5xbPKN0rpoHxcTly4mXqH5eqqLxy2PQH+M++1
         Ulh7QBqBTXW056Y/RpCRrQ7g3l/qGqfrBk8iER+pOWo7XxrdEEUBvupPI53nORrpPrUN
         6oBMOh9xOilQ5Phj8Gmj650Swx1LHKG7LC6EYLjMaD49KhXJn15+I39SDa6blcMy1M6s
         XofilzMpLum7wuYkyLKdj4u/nOHczQdcz3YsV8HYNcFqRVZxK0Fto6k4p3IkogY2ksn5
         HqEv9rNFO/Yr0txCS4jdy43QizzULli7e7gTPV+fUqdKYhm9+21/S954ItDj3MOS3PZ6
         FUaQ==
X-Gm-Message-State: AOAM530/P3hhWq5Sia631G+F0sdEydlWU6lTzDIsO3a7c8OvbRdn+AEk
	XRzcNFiSSeBZU/LdzV5ILeZzyQ==
X-Google-Smtp-Source: ABdhPJzf+QgapgXK+iZ4oLIAi54xyUI7HuBOe15v2PKWDvHqC3zBMwB3TdP35jII066WX2V1hkbzwQ==
X-Received: by 2002:a6b:14a:0:b0:649:a974:9042 with SMTP id 71-20020a6b014a000000b00649a9749042mr12139250iob.81.1648666375278;
        Wed, 30 Mar 2022 11:52:55 -0700 (PDT)
Received: from sckzor-linux (d4-50-247-168.col.wideopenwest.com. [50.4.168.247])
        by smtp.gmail.com with ESMTPSA id k5-20020a6bf705000000b00649a2634725sm11587364iog.17.2022.03.30.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 11:52:54 -0700 (PDT)
Date: Wed, 30 Mar 2022 14:52:53 -0400
From: Charlie Sands <sandsch@northvilleschools.net>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH V2] staging: r8188eu: Fix sparse endianness warnings
Message-ID: <YkSnBW70kruOyN9h@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes sparse warnings about the endianness of different
pieces of data in the driver.

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for
RTL8188eu driver")
Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
---
V2: Added the "fixes" line to the commit at the request of Dan Carpenter.

 drivers/staging/r8188eu/core/rtw_br_ext.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index d68611ef22f8..ed41c4e30262 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -70,7 +70,7 @@ static int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
 	struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
 	int data_len;
 
-	data_len = tag->tag_len + TAG_HDR_LEN;
+	data_len = be16_to_cpu(tag->tag_len) + TAG_HDR_LEN;
 	if (skb_tailroom(skb) < data_len)
 		return -1;
 
@@ -432,7 +432,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 		/*                Handle PPPoE frame                 */
 		/*---------------------------------------------------*/
 		struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
-		unsigned short *pMagic;
+		__be16 *pMagic;
 
 		switch (method) {
 		case NAT25_CHECK:
@@ -471,7 +471,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 						tag->tag_len = htons(MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN+old_tag_len);
 
 						/*  insert the magic_code+client mac in relay tag */
-						pMagic = (unsigned short *)tag->tag_data;
+						pMagic = (__be16 *)tag->tag_data;
 						*pMagic = htons(MAGIC_CODE);
 						memcpy(tag->tag_data+MAGIC_CODE_LEN, skb->data+ETH_ALEN, ETH_ALEN);
 
@@ -557,9 +557,11 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 						struct icmp6hdr  *hdr = (struct icmp6hdr *)(skb->data + ETH_HLEN + sizeof(*iph));
 						hdr->icmp6_cksum = 0;
 						hdr->icmp6_cksum = csum_ipv6_magic(&iph->saddr, &iph->daddr,
-										iph->payload_len,
+										be16_to_cpu(iph->payload_len),
 										IPPROTO_ICMPV6,
-										csum_partial((__u8 *)hdr, iph->payload_len, 0));
+										csum_partial((__u8 *)hdr,
+										be16_to_cpu(iph->payload_len),
+										0));
 					}
 				}
 			}
-- 
2.35.1

