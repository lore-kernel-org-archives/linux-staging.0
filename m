Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5385C9C
	for <linux-staging@lists.linux.dev>; Mon, 12 Sep 2022 21:45:53 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id b14-20020a056902030e00b006a827d81fd8so8360493ybs.17
        for <linux-staging@lists.linux.dev>; Mon, 12 Sep 2022 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=6+LQgns1/8zpG0OHFak8nK3Ilwf0pwSl1GyfLOUBAHY=;
        b=gGOw60e1rpYD6TuAGwTn1INOvUIO0roMQJqMvPDtHZ3UQnwRVcEe1E2Lonygj2xPXW
         T7VejqP7YEWDwcM2Fw0dM+LChi/7jSBzA8TxU4xpos+N5cIog+peVDWDKeJJTVWPFwbx
         KAhGqy4z6vXHqHuPEjqQWoPc0RbECfptY8slGI/T1vLbxRPMgkcxAzNu5UEZQV4IrNZy
         wxpNB52VWIn4D0coKpwbjPGUtTqJK/KzpKl8wsoUZH/yBsIJRHbZsQAY824PpzXO/GZj
         /wBhdzOvhDBBGqNi8VTCSjsE8Bq36E8sjeH3OlfjWBmBFmFLCdf4rr6irACkZCe9I/GC
         sgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=6+LQgns1/8zpG0OHFak8nK3Ilwf0pwSl1GyfLOUBAHY=;
        b=Kz3IiuZs3nVlnk6YMQWky1teFKJv1EWsjLS/mtFwyk9QvdWT/MUvy9JvDJOWcCxIQ9
         MQa5xZeU8X/PFWr0BAZssFO0YT1svmdt2Y1CBOEM66dd13VONWyNA8IxztEskohQLNOl
         9l8c2dMbeKJblBZlVAN7dU5JkQ3Y8BBBlop6Q+x+KejwQRRMrnlUzYGnkBAGgRtnyf0x
         eqeYVf/IKdlVz02iqi7yDkcnnlUWl5CPvnAS2nio+ERo5uc5+D2dR1MenJXniWDJbhvu
         0e4CyCEVY1EcTteimQ/JnVwGt1mtnjgFSTf7XnK7xrGt/zHQe6ZBYIejlbBcO/PzA5+V
         qJ3w==
X-Gm-Message-State: ACgBeo3ZK5q6BmScogAtcvH/NOKpg9cSNv44SpogKxXSxg+mu9ewuBz4
	iG62Q8AVdnXHMyzxyEZOuLD9mNQQ6g==
X-Google-Smtp-Source: AA6agR5Wo0VhogpTx5DxeN1niodvB4431b9kJDUIXpDf7IRaH1XfCA4O7LgT46IBvWJGD/4wLke+g5aO3w==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a25:b790:0:b0:66f:7978:f166 with SMTP id
 n16-20020a25b790000000b0066f7978f166mr23452698ybh.17.1663019152781; Mon, 12
 Sep 2022 14:45:52 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:45:44 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214548.929144-1-nhuck@google.com>
Subject: [PATCH] Staging: rtl8192e: Fix return type of rtllib_xmit
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Felix Schlepper <f3sch.git@outlook.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of rtllib_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 42f81b23a144..1b665afd309e 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -543,7 +543,7 @@ static u8 rtllib_current_rate(struct rtllib_device *ieee)
 		return ieee->rate & 0x7F;
 }
 
-static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 {
 	struct rtllib_device *ieee = (struct rtllib_device *)
 				     netdev_priv_rsl(dev);
@@ -946,13 +946,13 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			if ((*ieee->hard_start_xmit)(txb, dev) == 0) {
 				stats->tx_packets++;
 				stats->tx_bytes += le16_to_cpu(txb->payload_size);
-				return 0;
+				return NETDEV_TX_OK;
 			}
 			rtllib_txb_free(txb);
 		}
 	}
 
-	return 0;
+	return NETDEV_TX_OK;
 
  failed:
 	spin_unlock_irqrestore(&ieee->lock, flags);
@@ -962,7 +962,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 
 }
 
-int rtllib_xmit(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t rtllib_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	memset(skb->cb, 0, sizeof(skb->cb));
 	return rtllib_xmit_inter(skb, dev);
-- 
2.37.2.789.g6183377224-goog

