Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817847C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 03:14:07 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id h63so23330173iof.12
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 20:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northvilleschools.net; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=tx0S3IoWKwhBblgXlSk6eBT885Zq+4pfcJ7ztGcossU=;
        b=QqQjkH3EtCEzRB3DKA9ZBkqDexr43NHDlVfYhH87ZKsMQNE1foRYtUP/dKASISz0jU
         WXeqYfLgkG28RXOjiu0sDswqCYH6Qy+Mfk6k0FrxXGiBPs4wWbY9Ctry4OBQRc7ZEWIZ
         RRfKpISO8icHhEyWp/v7MMKCCpr7/cobnyiptbjSQLq7yJcNmEJj6z0d0bIXBS3qbbef
         awgn/5vkcZUwJ4nk8w6pRjqpT+kUIW4TwyAEtQ0/YgAHoFLyfiYmZ//90J2vuNfZwgI7
         hnZ1D7sxlIjtTbe0ka8nYAjedsVs1HJak7sNMnqD67C1knyIrcOReomHJSRsgCzx2lMh
         SKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tx0S3IoWKwhBblgXlSk6eBT885Zq+4pfcJ7ztGcossU=;
        b=JC/FRqlKbw01MXB3N8rVMpRKMtbiaOO6oaCYIzLLREdd+WiSJ4JXOpECX+bnX9EJll
         sl+Ihv4Db9NcDf3rJnQf0mecdq6yo/BuuVqOLwf4PDinROrnRBNgkWrpzewU5m1LUznY
         8WqZ+Qt7t/aqTOuwljfQ/xE9UL7VWJCBSdNo5J/sTb9qLeG3Y0a0aVcUFFCp9qHFYAoP
         nKUe+0AsOO3VH3k26h7QfC3WmJHRVAun2igmbydZZ8jIz4U4gcdqleIYvyPtE9c40NPf
         ziw/ZRbYdv/Nfd+OJ8y5FixScK67fF5qc/fpqITeWQctXu20FpNYCM9wogwgyutix2lQ
         XJfQ==
X-Gm-Message-State: AOAM532lqjyo0jkktXVrfruZDKWVnaQcm4zxvrO5IqAaa1kybuGSDqU9
	O97ZD/z36ObsKtnWzRoGwEr1Ag==
X-Google-Smtp-Source: ABdhPJxz1kNiwMvaB7buRSeau/6CVisXBu1tQl0Gx5bHwm86vNcKXCj0Clz5qEp6FP6wuPBmMCSq8A==
X-Received: by 2002:a02:7115:0:b0:2fa:a6d9:9e10 with SMTP id n21-20020a027115000000b002faa6d99e10mr16234152jac.293.1648610046447;
        Tue, 29 Mar 2022 20:14:06 -0700 (PDT)
Received: from sckzor-linux (d4-50-247-168.col.wideopenwest.com. [50.4.168.247])
        by smtp.gmail.com with ESMTPSA id y11-20020a92d80b000000b002c880174e40sm8191734ilm.57.2022.03.29.20.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 20:14:06 -0700 (PDT)
Date: Tue, 29 Mar 2022 23:14:05 -0400
From: Charlie Sands <sandsch@northvilleschools.net>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Fix sparse endianness warnings.
Message-ID: <YkPK/QmLAp3BkygY@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes sparse warnings about the endianness of different
integers in the driver.

Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
---
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

