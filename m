Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945A610A
	for <linux-staging@lists.linux.dev>; Mon,  6 Feb 2023 20:18:19 +0000 (UTC)
Received: from ipservice-092-217-084-033.092.217.pools.vodafone-ip.de ([92.217.84.33] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pP7wG-0007ps-Sf; Mon, 06 Feb 2023 21:18:08 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/6] staging: r8188eu: use standard error codes in rtw_read_port
Date: Mon,  6 Feb 2023 21:17:56 +0100
Message-Id: <20230206201800.139195-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206201800.139195-1-martin@kaiser.cx>
References: <20230206201800.139195-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the driver-specific _SUCCESS and _FAIL error codes in
rtw_read_port. Return 0 for success or a negative error code as
we do elsewhere in the kernel.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 13 ++++++-------
 drivers/staging/r8188eu/include/rtw_io.h    |  2 +-
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 225a422ede4f..9611b19ab55b 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -406,7 +406,7 @@ static void usb_read_port_complete(struct urb *purb)
 	}
 }
 
-u32 rtw_read_port(struct adapter *adapter, struct recv_buf *precvbuf)
+int rtw_read_port(struct adapter *adapter, struct recv_buf *precvbuf)
 {
 	struct urb *purb = NULL;
 	struct dvobj_priv	*pdvobj = adapter_to_dvobj(adapter);
@@ -416,13 +416,12 @@ u32 rtw_read_port(struct adapter *adapter, struct recv_buf *precvbuf)
 	unsigned int pipe;
 	size_t tmpaddr = 0;
 	size_t alignment = 0;
-	u32 ret = _SUCCESS;
 
 	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
-		return _FAIL;
+		return -EPERM;
 
 	if (!precvbuf)
-		return _FAIL;
+		return -ENOMEM;
 
 	if (!precvbuf->reuse || !precvbuf->pskb) {
 		precvbuf->pskb = skb_dequeue(&precvpriv->free_recv_skb_queue);
@@ -434,7 +433,7 @@ u32 rtw_read_port(struct adapter *adapter, struct recv_buf *precvbuf)
 	if (!precvbuf->reuse || !precvbuf->pskb) {
 		precvbuf->pskb = netdev_alloc_skb(adapter->pnetdev, MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ);
 		if (!precvbuf->pskb)
-			return _FAIL;
+			return -ENOMEM;
 
 		tmpaddr = (size_t)precvbuf->pskb->data;
 		alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
@@ -458,9 +457,9 @@ u32 rtw_read_port(struct adapter *adapter, struct recv_buf *precvbuf)
 
 	err = usb_submit_urb(purb, GFP_ATOMIC);
 	if ((err) && (err != (-EPERM)))
-		ret = _FAIL;
+		return err;
 
-	return ret;
+	return 0;
 }
 
 void rtl8188eu_xmit_tasklet(unsigned long priv)
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 6b1de4f0e287..e1718f739cc9 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -19,7 +19,7 @@
 int __must_check rtw_read8(struct adapter *adapter, u32 addr, u8 *data);
 int __must_check rtw_read16(struct adapter *adapter, u32 addr, u16 *data);
 int __must_check rtw_read32(struct adapter *adapter, u32 addr, u32 *data);
-u32 rtw_read_port(struct adapter *adapter, struct recv_buf *precvbuf);
+int rtw_read_port(struct adapter *adapter, struct recv_buf *precvbuf);
 void rtw_read_port_cancel(struct adapter *adapter);
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
-- 
2.30.2

