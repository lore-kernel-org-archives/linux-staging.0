Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F090C7B
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 00:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC27C43145;
	Thu, 13 Oct 2022 00:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620369;
	bh=rSA5IDO+roESaDkQG4hoqT0sBncPJCP6+KrZ4dAwCxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B01RkYci6NMceC5hk0ymh9YJzdN3qTbSxtE2yzZkv+28tGPksLkRsHkIk0fKl3UR2
	 sNHSWVIpotggeS9JQpldmjh/A0ZrtTN0cGdQuYJdaNYNUO1yW+9sYRODdWbYPxZp7I
	 5BZ26KauIgjONXSoHdtBneQlJ4RJIDlqKj4J7cS2o/BKZTPwY+cTqN4eh65HywcP3K
	 2TUIe41ita9cfQvJLhPM1rMel0dte6Nj6fxOzGNBg2W5TK81U190PDwk30VzWsTerh
	 9ydDNjbg9xMJgJ3eGHMkp+Yxue8b2iJZO/JOtxPt9hEgjk+UqLrBwKpATQjvDe3f45
	 cxei9lHDmY23g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: GUO Zihua <guozihua@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	philipp.g.hortmann@gmail.com,
	yangyingliang@huawei.com,
	yogi.kernel@gmail.com,
	dave@stgolabs.net,
	f3sch.git@outlook.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.19 16/63] staging: rtl8192e: Fix return type for implementation of ndo_start_xmit
Date: Wed, 12 Oct 2022 20:17:50 -0400
Message-Id: <20221013001842.1893243-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001842.1893243-1-sashal@kernel.org>
References: <20221013001842.1893243-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: GUO Zihua <guozihua@huawei.com>

[ Upstream commit 513d9a61156d79dd0979c4ad400c8587f52cbb9d ]

CFI (Control Flow Integrity) is a safety feature allowing the system to
detect and react should a potential control flow hijacking occurs. In
particular, the Forward-Edge CFI protects indirect function calls by
ensuring the prototype of function that is actually called matches the
definition of the function hook.

Since Linux now supports CFI, it will be a good idea to fix mismatched
return type for implementation of hooks. Otherwise this would get
cought out by CFI and cause a panic.

Use enums from netdev_tx_t as return value instead, then change return
type to netdev_tx_t. Note that rtllib_xmit_inter() would return 1 only
on allocation failure and the queue is stopped if that happens, meeting
the documented requirement if NETDEV_TX_BUSY should be returned by
ndo_start_xmit.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
Link: https://lore.kernel.org/r/20220905130053.10731-1-guozihua@huawei.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0ecd81a81866..b4b606f552fb 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1938,7 +1938,7 @@ int rtllib_encrypt_fragment(
 	struct sk_buff *frag,
 	int hdr_len);
 
-int rtllib_xmit(struct sk_buff *skb,  struct net_device *dev);
+netdev_tx_t rtllib_xmit(struct sk_buff *skb,  struct net_device *dev);
 void rtllib_txb_free(struct rtllib_txb *txb);
 
 /* rtllib_rx.c */
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 37715afb0210..71c9e29449c6 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -964,9 +964,9 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 
 }
 
-int rtllib_xmit(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t rtllib_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	memset(skb->cb, 0, sizeof(skb->cb));
-	return rtllib_xmit_inter(skb, dev);
+	return rtllib_xmit_inter(skb, dev) ? NETDEV_TX_BUSY : NETDEV_TX_OK;
 }
 EXPORT_SYMBOL(rtllib_xmit);
-- 
2.35.1

