Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E15648
	for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 05:13:38 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id g3so21261580wrq.13
        for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 22:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=LQj4x2kJKlqlUKTiwOiXLQk0/4XYgqe/eXrFwRGV8PI=;
        b=ADWh8/FP4Ufe0teuEzRdCaj4x+TVFukhUBm2EszcI18eK/t7FShNztasDEuUUe39UZ
         ZCkSryfs43CcckI8E+Z8C4IjIcwWKTFl3hd1UZJfceQ9vSYglrV8xbOoXdJ3Fz+dT9CJ
         WIqb3F1EmrsE/96uqRJSuUN81EOKIzPOyKs+0n7/oUuOhpiCPVye33pwv/D8VWwxexT0
         rO97zzQZM9pyBXf4KnIeh3LFdGb8Z2d/59Xlos8UJYjkCvTKbB4UHYUCcxXmrFTVThsQ
         ZCpzhZByIlrGjFO+QHypC56Q5vkkedY+1gPR2lqbkTDR5/8zqQWMvDTrmOlb8W36x8HN
         zHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=LQj4x2kJKlqlUKTiwOiXLQk0/4XYgqe/eXrFwRGV8PI=;
        b=q/om5R8Zwqe/zzVh/jpY7oPmHmuhNKP0dPDsNfgr4PBipbSh4OKo9WCXBL+WWHsRUv
         e3d9srf7oymeA2jSk/6luHiKECe9Uz/Ozh1EclurUM6Bfr/r5x6rqHoBV5RKX5QeXdSm
         Nq6Ye72qfK6o4xywdr+jOkaNzY2mhE4Nm2bBHwoSSJyac0A5PucAmkrOtjLYUzKPZ3V+
         4GCMW0qWvNR/Onykeg+uVQOhb2wA58HA9XZqb0FL+SUFIpMaz1jZFqjF7sLaDnHSYF1a
         1YnsblvvGtjOx8aJ9C1rNszB+DDYVlj6Gn27tRFpwDhz7dCqjT7LXaXXqH84d7P8+qkH
         QzLA==
X-Gm-Message-State: ACrzQf23tUlwiI4d0QG7PjXSzxYGfCq16y8yldxfmY1N/2NCvZ5sTNa6
	O7yc0SJwcmaQJ924ZyzvlQU=
X-Google-Smtp-Source: AMsMyM4eYaN1s9re7w2q2DoTvcn5aATCk3Mz5wAXOpPvtb2Nj9GTT79jD5H22OWaNBP1V1zp1HAvKg==
X-Received: by 2002:a5d:6b0e:0:b0:22a:2cb1:6605 with SMTP id v14-20020a5d6b0e000000b0022a2cb16605mr7001496wrw.552.1663478017002;
        Sat, 17 Sep 2022 22:13:37 -0700 (PDT)
Received: from localhost.localdomain ([105.184.84.223])
        by smtp.googlemail.com with ESMTPSA id 7-20020a05600c228700b003a604a29a34sm8153158wmf.35.2022.09.17.22.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 22:13:36 -0700 (PDT)
From: Joash Naidoo <joash.n09@gmail.com>
To: larry.finger@lwfinger.net,
	phil@philpotter.co.uk,
	paskripkin@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Joash Naidoo <joash.n09@gmail.com>
Subject: [PATCH] staging: r8188eu: fix too many leading tabs
Date: Sun, 18 Sep 2022 07:07:28 +0200
Message-Id: <20220918050728.3746-1-joash.n09@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style fix. Fix too many leading tabs and line length. Convert
__constant_htons to htons

Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 66 ++++++++++++-----------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index bca20fe5c..8e951fc0e 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -604,37 +604,41 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
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
+	if (priv->ethBrExtInfo.dhcp_bcst_disable)
+		return;
+
+	__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
+
+	if (protocol != htons(ETH_P_IP)) /*  IP */
+		return;
+
+	struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
+
+	if (iph->protocol != IPPROTO_UDP) /*  UDP */
+		return;
+
+	struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
+
+	if ((udph->source == htons(CLIENT_PORT)) &&
+	    (udph->dest == htons(SERVER_PORT))) { /*  DHCP request */
+		struct dhcpMessage *dhcph =
+			(struct dhcpMessage *)((size_t)udph +
+						   sizeof(struct udphdr));
+		u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
+
+		if (cookie == DHCP_MAGIC) { /*  match magic word */
+			if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
+				/*  if not broadcast */
+				register int sum = 0;
+
+				/*  or BROADCAST flag */
+				dhcph->flags |= htons(BROADCAST_FLAG);
+				/*  recalculate checksum */
+				sum = ~(udph->check) & 0xffff;
+				sum += be16_to_cpu(dhcph->flags);
+				while (sum >> 16)
+					sum = (sum & 0xffff) + (sum >> 16);
+				udph->check = ~sum;
 			}
 		}
 	}
-- 
2.35.1

