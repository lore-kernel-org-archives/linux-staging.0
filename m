Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347737B
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 00:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86C3C433C1;
	Thu, 13 Oct 2022 00:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620722;
	bh=H095wDJZy22Yx//vvJfLaItqq3IkL0saxFO+T8NGZJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=stVbZN8no31GFPB0pOKMokNecD9j/2Hm+XEdutHB1o2JXXF+QZm8Sppt+D00cpLuX
	 o2da4Sbmtk8kySGu4xBSKDweTb4OTmoNEOiG3SmMqPXq1buCA2OvZlFAJf/GNUcU/w
	 v8zTrnA0t90RXu8px//EHGmowj6dHHUB7508j7MPQXnCP8j8Mr3sucMiMdT80Dv31C
	 OhLNTYVlmuxUAja3q7lgSNW+EVUElXheXK1Ar/f1aUYAnJ8raIBC6WVFpRtcI29OG+
	 xVJEjBEyhu8mEUcdr8wvqRdgD72JyknEFI3UpQm2OgLO/yhR/mgOtR6Qi2yqnngW4l
	 WXmxxo0YmGz/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: GUO Zihua <guozihua@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	fmdefrancesco@gmail.com,
	skumark1902@gmail.com,
	asif.kgauri@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 06/27] staging: rtl8712: Fix return type for implementation of ndo_start_xmit
Date: Wed, 12 Oct 2022 20:24:38 -0400
Message-Id: <20221013002501.1895204-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013002501.1895204-1-sashal@kernel.org>
References: <20221013002501.1895204-1-sashal@kernel.org>
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
index 1f67d86c606f..8ec8edbb7fd8 100644
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -147,7 +147,7 @@ void r8712_xmit_complete(struct _adapter *padapter, struct xmit_frame *pxframe)
 	pxframe->pkt = NULL;
 }
 
-int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
+netdev_tx_t r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
 {
 	struct xmit_frame *xmitframe = NULL;
 	struct _adapter *adapter = netdev_priv(netdev);
@@ -172,11 +172,11 @@ int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
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
index 21f6b31e0f50..3f2f5edd2d91 100644
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

