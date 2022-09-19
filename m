Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CE34C79
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 13:29:28 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id r133-20020a1c448b000000b003b494ffc00bso4118353wma.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 06:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=66mscY4W7V/CinkWJsi5qp32dxvSvKEU5HuP+pXVsbk=;
        b=oCwGq4mG1H+nVmFpGo2S1OpzOBB76dsglV46nEEMUNZBeVi2DnL/HOjVpN1HRusg7c
         m6/JDTXM0oUjvjSbbmzp8eu1jKemvqSVbrBj/dXllQ4XCO0kag5F95OceSM+lwN+eekZ
         TbXXR+qxkiMN/nm0uHkAScTNFiCijqRcrv0xK85u7/2V9KuExBnnwY0rDbaxGNilFoIa
         CAeCz5/K5H0s6g4l1SuFOUBovc+eRd3x5EyRWAqas/KhZteY9amwzF6jMfAcp+xnV1wA
         vIbyXpHqXlQXXHspBEIs2Bw3zokCo+IwlvrsuCdJdXwZ9QlJz83mrUSpsdLO+ZkYy9Ic
         2UUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=66mscY4W7V/CinkWJsi5qp32dxvSvKEU5HuP+pXVsbk=;
        b=jf7G6ad01pnmJWWf3LQYU//KG844TIT69KvAxAZZG+qO43ovjtWj+bLqv6UteZ1jtN
         hElmQbtTuZEXWL9jHCcqjttt6JZL1hnQQQVNTS2uRPmvz/PH+rL1B9rll9Fow+tr31hp
         bN+OnWFpdQQvr76VaiiooC+JT4S+Z7D+2AXlu3eQtB/6Cdm0JxDa08YhKCa6fWFcPGtY
         EsEF7DevV6r8fXe7KLp8USLjYRl9m9nagKCWvTtKugAqXO2hlWli4KnlQU4B/rig4qMO
         icEzs7staMN2OzcT1Zse4OPzlg8afvtj42Z6S4AvfNErcH/xMWCYDyjcj/dqRGbUjXn0
         pG5g==
X-Gm-Message-State: ACrzQf3lquxI0wRGr8om+cDArGdFVv8X0bEiju5HAHiAZNgu+Cz9L2Q9
	L6rKi2FZEH8VdPLBdUKUQss=
X-Google-Smtp-Source: AMsMyM7lHZFLu3bDJTpvEmEwuRF6aFmD3YkEEYC5cY9R5igZ4KfA28WTVLUfYlkkCjRcr3cWZqjYdA==
X-Received: by 2002:a05:600c:4fd2:b0:3b4:cab9:44f0 with SMTP id o18-20020a05600c4fd200b003b4cab944f0mr7079188wmq.73.1663594167282;
        Mon, 19 Sep 2022 06:29:27 -0700 (PDT)
Received: from localhost.localdomain ([105.184.152.245])
        by smtp.googlemail.com with ESMTPSA id a21-20020a05600c225500b003b4924493bfsm17685351wmm.9.2022.09.19.06.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 06:29:26 -0700 (PDT)
From: Joash Naidoo <joash.n09@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	paskripkin@gmail.com,
	dan.carpenter@oracle.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Joash Naidoo <joash.n09@gmail.com>
Subject: [PATCH v3] staging: r8188eu: fix too many leading tabs
Date: Mon, 19 Sep 2022 15:23:10 +0200
Message-Id: <20220919132310.1494-1-joash.n09@gmail.com>
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
Changes in v3:
    - Fix flipped condition mistake
    - move skb NULL check before dereferencing it
Changes in v2:
    - Flip additional nested if conditions and don't reverse the last if statement
    - Move declarations to start of function
    - Separate converting __constant_htons to htons to another patch
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 69 ++++++++++++-----------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index bca20fe5c..833488dd5 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -604,39 +604,42 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
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
+	__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
+	struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
+	struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
+	/*  DHCP request */
+	struct dhcpMessage *dhcph =
+		(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
+	u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
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

