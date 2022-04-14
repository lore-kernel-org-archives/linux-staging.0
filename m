Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2031E17C8
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:36:08 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 14 Apr
 2022 18:34:59 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 14 Apr
 2022 18:34:57 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Haowen Bai <baihaowen@meizu.com>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: rtl8192e: Fix signedness bug in rtllib_rx_assoc_resp()
Date: Thu, 14 Apr 2022 18:34:50 +0800
Message-ID: <1649932490-13622-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

function rtllib_rx_assoc_resp () unsigned errcode receive auth_parse()'s
errcode -ENOMEM.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 4b6c2295a3cf..57f70cc8cb81 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1764,7 +1764,7 @@ static void rtllib_softmac_check_all_nets(struct rtllib_device *ieee)
 	spin_unlock_irqrestore(&ieee->lock, flags);
 }
 
-static inline u16 auth_parse(struct net_device *dev, struct sk_buff *skb,
+static inline s16 auth_parse(struct net_device *dev, struct sk_buff *skb,
 			     u8 **challenge, int *chlen)
 {
 	struct rtllib_authentication *a;
@@ -2278,7 +2278,7 @@ rtllib_rx_assoc_resp(struct rtllib_device *ieee, struct sk_buff *skb,
 
 static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 {
-	u16 errcode;
+	s16 errcode;
 	u8 *challenge;
 	int chlen = 0;
 	bool bSupportNmode = true, bHalfSupportNmode = false;
-- 
2.7.4

