Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D35A40
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 07:59:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id z13-20020a7bc7cd000000b003b5054c6f9bso652568wmk.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=+2gTXudbFaEDqFSZKdJzEpImqFqMwgoqZI1SWFaKvoU=;
        b=Wd9p6N5JlB2AtDka4P5mggBIYMiGYKkoJi231qAac/YwZlbcnVGTaCZEKD1coETBT8
         x0/SwfIRWhWR25dqCNPWyGCtV47IKQZMJT/Epb/k4rS1jYQs9dzqzDSOTow9O6V98/+A
         t7UYGwbImHh6t7SkDEKWlqPR2/IdIpsQnm1tuPXY6a+JUauEK0PRVjScDRcuCJe9qX4K
         AYXRuNVrFS7BbakEl/UkSQl03WPGM6DcofkqiorE72+KXsM0x0es5alvEo5pA81RD3OK
         t0eyBTrSjge3pL5gIer6oNTIOVtqaaxziUd1JFsmf1Yq8UDtqerMYI5xZ1/eWQYSNK4k
         32GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=+2gTXudbFaEDqFSZKdJzEpImqFqMwgoqZI1SWFaKvoU=;
        b=am2YrYozbcKdt0lTBT0WjVu3qSvK5MXoDAmuFi7crGZw/Tl2aFKA73zhpu3Rpf2N11
         w6fUtTtkK8eCUlfokoUFw1d78SxlUJI70YDsAb57S86i9IuatpH/5/1R5hLjYG9Ot1PO
         bNy9hK/3qOVrVMcKN3sHMvwEaTQGv0yWbc940IdR96eiBeprKb2R2ZQP1AD12Xa5Rqpc
         UE8ymD6mEpA2ASXxjZrpC0kutpFZ+CIIzpvWY5Lg800XXPFSg/MUj+dS0Pe2WsR7mEkl
         I0tD7AkdVMa3WKp9YPfgE0BAkIMrKiuYzK6X9Df4NqslWWHdch4CRMrOQ0JxQ2DNafjj
         ZTxA==
X-Gm-Message-State: ACrzQf24gtZIADMpb1hPLKB+oPI+z2txu7dmt0Wv8Iv5692p3vH9XYwx
	z3cLy0QQTAzEUEsU9ce848M=
X-Google-Smtp-Source: AMsMyM4UKNQeMjfWu0Gd0HSyPGCtloG6Km8WTujcpiROymUVzqFLhPTySLf/BxDn9uW7cxzqQhwijQ==
X-Received: by 2002:a05:600c:1caa:b0:3a8:4066:981d with SMTP id k42-20020a05600c1caa00b003a84066981dmr5759117wms.54.1664351988371;
        Wed, 28 Sep 2022 00:59:48 -0700 (PDT)
Received: from localhost.localdomain ([105.184.124.137])
        by smtp.googlemail.com with ESMTPSA id d16-20020adff850000000b0022ae59d472esm3500167wrq.112.2022.09.28.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 00:59:47 -0700 (PDT)
From: Joash Naidoo <joash.n09@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	dan.carpenter@oracle.com,
	straube.linux@gmail.com,
	paskripkin@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Joash Naidoo <joash.n09@gmail.com>
Subject: [PATCH v4] staging: r8188eu: fix too many leading tabs
Date: Wed, 28 Sep 2022 09:53:24 +0200
Message-Id: <20220928075324.1605-1-joash.n09@gmail.com>
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
Changes in V4:
    - Fix compiler warning introduced: mixing declarations and code
Changes in v3:
    - Fix flipped condition mistake
    - move skb NULL check before dereferencing it
Changes in v2:
    - Flip additional nested if conditions and don't reverse the last if statement
    - Move declarations to start of function
    - Separate converting __constant_htons to htons to another patch
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 75 +++++++++++++----------
 1 file changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index bca20fe5c..d4bcec152 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -601,42 +601,51 @@ struct dhcpMessage {
 
 void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 {
+	__be16 protocol;
+	struct iphdr *iph;
+	struct udphdr *udph;
+	struct dhcpMessage *dhcph;
+	u32 cookie;
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
+	protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
+	iph = (struct iphdr *)(skb->data + ETH_HLEN);
+	udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
+	/*  DHCP request */
+	dhcph =
+		(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
+	cookie = be32_to_cpu((__be32)dhcph->cookie);
+
+	if (priv->ethBrExtInfo.dhcp_bcst_disable)
+		return;
+
+	if (protocol != htons(ETH_P_IP)) /*  IP */
+		return;
+
+	if (iph->protocol != IPPROTO_UDP) /*  UDP */
+		return;
+
+	if ((udph->source != __constant_htons(CLIENT_PORT)) ||
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

