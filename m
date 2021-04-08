Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DF56D13
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 19:56:45 +0000 (UTC)
Received: from ipservice-092-217-074-086.092.217.pools.vodafone-ip.de ([92.217.74.86] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUalf-0005PV-PE; Thu, 08 Apr 2021 21:56:43 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/12] staging: rtl8188eu: remove prototype for non-existing function
Date: Thu,  8 Apr 2021 21:55:51 +0200
Message-Id: <20210408195601.4762-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408195601.4762-1-martin@kaiser.cx>
References: <20210408195601.4762-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no usb_read_port_cancel function in this driver. Remove its
prototype.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/usb_ops_linux.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/include/usb_ops_linux.h b/drivers/staging/rtl8188eu/include/usb_ops_linux.h
index 0262ace52e71..bd9c7716c440 100644
--- a/drivers/staging/rtl8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/rtl8188eu/include/usb_ops_linux.h
@@ -17,7 +17,6 @@ u16 usb_read16(struct adapter *adapter, u32 addr);
 u32 usb_read32(struct adapter *adapter, u32 addr);
 
 u32 usb_read_port(struct adapter *adapter, u32 addr, struct recv_buf *precvbuf);
-void usb_read_port_cancel(struct adapter *adapter);
 
 int usb_write8(struct adapter *adapter, u32 addr, u8 val);
 int usb_write16(struct adapter *adapter, u32 addr, u16 val);
-- 
2.20.1

