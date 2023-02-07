Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8EE7485
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 19:23:46 +0000 (UTC)
Received: from dslb-178-004-202-208.178.004.pools.vodafone-ip.de ([178.4.202.208] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pPTZ7-0002XK-Dy; Tue, 07 Feb 2023 20:23:41 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 7/7] staging: r8188eu: bagg_pkt parameter is not used
Date: Tue,  7 Feb 2023 20:23:19 +0100
Message-Id: <20230207192319.294203-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230207192319.294203-1-martin@kaiser.cx>
References: <20230207192319.294203-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bagg_pkt parameter in function update_txdesc is not used, it can be
removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index 5aa33fc4041d..3ffab4953a5c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -137,7 +137,7 @@ static void fill_txdesc_phy(struct pkt_attrib *pattrib, __le32 *pdw)
 	}
 }
 
-static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bagg_pkt)
+static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz)
 {
 	uint	qsel;
 	u8 data_rate, pwr_status, offset;
@@ -319,7 +319,7 @@ static s32 rtw_dump_xframe(struct adapter *adapt, struct xmit_frame *pxmitframe)
 			sz = pattrib->last_txcmdsz;
 		}
 
-		pull = update_txdesc(pxmitframe, mem_addr, sz, false);
+		pull = update_txdesc(pxmitframe, mem_addr, sz);
 
 		if (pull) {
 			mem_addr += PACKET_OFFSET_SZ; /* pull txdesc head */
@@ -489,7 +489,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt)
 		rtw_xmit_complete(adapt, pxmitframe);
 
 		/*  (len - TXDESC_SIZE) == pxmitframe->attrib.last_txcmdsz */
-		update_txdesc(pxmitframe, pxmitframe->buf_addr, pxmitframe->attrib.last_txcmdsz, true);
+		update_txdesc(pxmitframe, pxmitframe->buf_addr, pxmitframe->attrib.last_txcmdsz);
 
 		/*  don't need xmitframe any more */
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
@@ -529,7 +529,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt)
 		pfirstframe->pkt_offset--;
 	}
 
-	update_txdesc(pfirstframe, pfirstframe->buf_addr, pfirstframe->attrib.last_txcmdsz, true);
+	update_txdesc(pfirstframe, pfirstframe->buf_addr, pfirstframe->attrib.last_txcmdsz);
 
 	/* 3 4. write xmit buffer to USB FIFO */
 	ff_hwaddr = rtw_get_ff_hwaddr(pfirstframe);
-- 
2.30.2

