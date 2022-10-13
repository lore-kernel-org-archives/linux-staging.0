Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356527B
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 00:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC23EC433D7;
	Thu, 13 Oct 2022 00:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620193;
	bh=KpnnWPP1OE+ebkDCcqGFFLm7Mvkg7iBOomUlwMr6yc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hsy5lzFOMGLcRxkiFcMQZVtDuRgTPbz4kQH6kzAMCq8GJ21Ga+zXuRv679o7Efsqf
	 uxoiko5gC8jHi9/m+DIGouZaYrkLD30L6aNl5/QQSYkojtrXU1L+thiMdrSfKrFreE
	 MUXmUTaUWQU6le5IPiYvaq6fM7T1a4pQzLZYhRkZBWALjr7WTJsXbRfP+Xb++8U6f6
	 cazDA+Mr1zV5bd1ld2KJ+AbiC46c40e6MJHNfjrlR9G12c7+K4jggi27nTRFEi7RAb
	 YU4xGNnpYr+nWRUG34cIAzzNTBIrWy9dcb2JEjiKLy/EG2/9d7Jbkboa65WaLQ9XUw
	 aJRzOSizpW0Kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: GUO Zihua <guozihua@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	skumark1902@gmail.com,
	fmdefrancesco@gmail.com,
	asif.kgauri@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 15/67] staging: rtl8712: Fix return type for implementation of ndo_start_xmit
Date: Wed, 12 Oct 2022 20:14:56 -0400
Message-Id: <20221013001554.1892206-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001554.1892206-1-sashal@kernel.org>
References: <20221013001554.1892206-1-sashal@kernel.org>
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

[ Upstream commit 307d343620e1fc7a6a2b7a1cdadb705532c9b6a5 ]

CFI (Control Flow Integrity) is a safety feature allowing the system to
detect and react should a potential control flow hijacking occurs. In
particular, the Forward-Edge CFI protects indirect function calls by
ensuring the prototype of function that is actually called matches the
definition of the function hook.

Since Linux now supports CFI, it will be a good idea to fix mismatched
return type for implementation of hooks. Otherwise this would get
cought out by CFI and cause a panic.

Use enums from netdev_tx_t as return value instead, then change return
type to netdev_tx_t.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
Link: https://lore.kernel.org/r/20220905130230.11230-1-guozihua@huawei.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/rtl8712/xmit_linux.c | 6 +++---
 drivers/staging/rtl8712/xmit_osdep.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
index 4a93839bf947..e84b9fa231cd 100644
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -140,7 +140,7 @@ void r8712_xmit_complete(struct _adapter *padapter, struct xmit_frame *pxframe)
 	pxframe->pkt = NULL;
 }
 
-int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
+netdev_tx_t r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
 {
 	struct xmit_frame *xmitframe = NULL;
 	struct _adapter *adapter = netdev_priv(netdev);
@@ -165,11 +165,11 @@ int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
 	}
 	xmitpriv->tx_pkts++;
 	xmitpriv->tx_bytes += xmitframe->attrib.last_txcmdsz;
-	return 0;
+	return NETDEV_TX_OK;
 _xmit_entry_drop:
 	if (xmitframe)
 		r8712_free_xmitframe(xmitpriv, xmitframe);
 	xmitpriv->tx_drop++;
 	dev_kfree_skb_any(pkt);
-	return 0;
+	return NETDEV_TX_OK;
 }
diff --git a/drivers/staging/rtl8712/xmit_osdep.h b/drivers/staging/rtl8712/xmit_osdep.h
index b76021b568f8..1ad42658c883 100644
--- a/drivers/staging/rtl8712/xmit_osdep.h
+++ b/drivers/staging/rtl8712/xmit_osdep.h
@@ -34,7 +34,7 @@ struct sta_xmit_priv;
 struct xmit_frame;
 struct xmit_buf;
 
-int r8712_xmit_entry(_pkt *pkt, struct  net_device *pnetdev);
+netdev_tx_t r8712_xmit_entry(_pkt *pkt, struct  net_device *pnetdev);
 void r8712_SetFilter(struct work_struct *work);
 int r8712_xmit_resource_alloc(struct _adapter *padapter,
 			      struct xmit_buf *pxmitbuf);
-- 
2.35.1

