Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4CB4A1F
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 11:57:53 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n35-20020a05600c502300b003b4924c6868so3592407wmr.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 04:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=xaG1gjIVVxrkpXK8X9vj5dIiFv/roHfD5/YWv+AhTFA=;
        b=HJGGnbuzYJbIbK20mXjAm2fPL4nSHQV56ai2fXHHksGIiLG3ZOJXtBbOV2yEfe0AKI
         w/NoCiHuDDSnP2BoG9KxI0eCsBC0ECWfSeq9D+cf9jsXgiFaviAyb4yP1pc1sjAIJxyq
         TXhtcydudtXcIhWudOGcPkAi6BFl8ofeaX2w2Bmx/QVCwd+kfcS+f1pXNypr1QPciLgt
         Chtr0eF58FOIlNYWwfQ3KfHUQyVc5LiuZGeGET1uf5CrDGw0bbvmyvfeeI4NtU+7kXpo
         5gRc6/If+OBjTbWAkjb9DSga1IDWZSQvB8NL8ldB5JMVb/qyaP6R7H1xVBKX18gVe1In
         xA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=xaG1gjIVVxrkpXK8X9vj5dIiFv/roHfD5/YWv+AhTFA=;
        b=U/NZVDHtL/D6YjcU8V4Hj/JRayQIaame4ES5zSvcJJ0uS27iuAUj0sUu0J8LS/Pnt1
         qOTNRsMIRry3o4pKdOZEofXFCWcW1aJAYbUQfPdVl/zoCjCYWrbWS6MeBbOd8pTsBCS9
         YJzakSAxZlhAi4MnNQNMsHcSoew1Vpoj2ae4Ll41pEEF+aivkzu140fWW9uWAv4VWs2Z
         yK8zxdQgy5UaKEXBgecJjoI9K/AVXWrBd6FXr5X3oLIyK5o/n22bxB0bHWm2gramcQ1o
         WUHIFy6yLWjKiwl7nrTrN4J85JGxJHbMY6MI/o8RwpsjMhk+zuE+kKteiYe7lPknMiA2
         dYUw==
X-Gm-Message-State: ACrzQf1fkcQdF1ZvTTVz0NXiSUV6mBknOSiLLCn67FbsuHkZcBnof80u
	MAko9a44IlUjWW/uhxwCjMc=
X-Google-Smtp-Source: AMsMyM71G48JLkC2jdKEXrMDZiL/M4GWHx2Kg/krvNa6lFhqjg5shRVUzX/2UwB1/x9EymKfPHPxZQ==
X-Received: by 2002:a05:600c:3acd:b0:3b4:88ba:a75f with SMTP id d13-20020a05600c3acd00b003b488baa75fmr11822874wms.140.1663588671892;
        Mon, 19 Sep 2022 04:57:51 -0700 (PDT)
Received: from localhost.localdomain ([105.184.152.245])
        by smtp.googlemail.com with ESMTPSA id 12-20020a05600c24cc00b003b339438733sm13250169wmu.19.2022.09.19.04.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 04:57:51 -0700 (PDT)
From: Joash Naidoo <joash.n09@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	paskripkin@gmail.com,
	dan.carpenter@oracle.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Joash Naidoo <joash.n09@gmail.com>
Subject: [PATCH v2] staging: r8188eu: fix too many leading tabs
Date: Mon, 19 Sep 2022 13:51:11 +0200
Message-Id: <20220919115111.2421-1-joash.n09@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style fix. Fix too many leading tabs and line length.

Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
---
Changes in v2:
    - Flip additional nested if conditions and don't reverse the last if statement
    - Move declarations to start of function
    - Separate converting __constant_htons to htons to another patch
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 69 ++++++++++++-----------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index bca20fe5c..2fec3bf39 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -601,42 +601,45 @@ struct dhcpMessage {
 
 void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 {
+	__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
+	struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
+	struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
+	/*  DHCP request */
+	struct dhcpMessage *dhcph =
+		(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
+	u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
+
 	if (!skb)
 		return;
 
-	if (!priv->ethBrExtInfo.dhcp_bcst_disable) {
-		__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
-
-		if (protocol == __constant_htons(ETH_P_IP)) { /*  IP */
-			struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
-
-			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
-				struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
-
-				if ((udph->source == __constant_htons(CLIENT_PORT)) &&
-				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
-					struct dhcpMessage *dhcph =
-						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
-					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
-
-					if (cookie == DHCP_MAGIC) { /*  match magic word */
-						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
-							/*  if not broadcast */
-							register int sum = 0;
-
-							/*  or BROADCAST flag */
-							dhcph->flags |= htons(BROADCAST_FLAG);
-							/*  recalculate checksum */
-							sum = ~(udph->check) & 0xffff;
-							sum += be16_to_cpu(dhcph->flags);
-							while (sum >> 16)
-								sum = (sum & 0xffff) + (sum >> 16);
-							udph->check = ~sum;
-						}
-					}
-				}
-			}
-		}
+	if (priv->ethBrExtInfo.dhcp_bcst_disable)
+		return;
+
+	if (protocol != htons(ETH_P_IP)) /*  IP */
+		return;
+
+	if (iph->protocol != IPPROTO_UDP) /*  UDP */
+		return;
+
+	if ((udph->source != __constant_htons(CLIENT_PORT)) &&
+	    (udph->dest != __constant_htons(SERVER_PORT)))
+		return;
+
+	if (cookie != DHCP_MAGIC) /*  match magic word */
+		return;
+
+	if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
+		/*  if not broadcast */
+		register int sum = 0;
+
+		/*  or BROADCAST flag */
+		dhcph->flags |= htons(BROADCAST_FLAG);
+		/*  recalculate checksum */
+		sum = ~(udph->check) & 0xffff;
+		sum += be16_to_cpu(dhcph->flags);
+		while (sum >> 16)
+			sum = (sum & 0xffff) + (sum >> 16);
+		udph->check = ~sum;
 	}
 }
 
-- 
2.35.1

