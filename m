Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A972C82
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 17:32:26 +0000 (UTC)
Received: from dslb-084-059-234-221.084.059.pools.vodafone-ip.de ([84.59.234.221] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqf56-00083N-4S; Fri, 26 Nov 2021 18:32:16 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/8] staging: r8188eu: rtw_read_port needs no cnt parameter
Date: Fri, 26 Nov 2021 18:31:58 +0100
Message-Id: <20211126173205.21352-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211126173205.21352-1-martin@kaiser.cx>
References: <20211126173205.21352-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cnt parameter in the rtw_read_port function is not used.
Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c   | 2 +-
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 8 ++++----
 drivers/staging/r8188eu/include/rtw_io.h    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 0b1aaa162c21..030438073661 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -937,7 +937,7 @@ unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
 	/* issue Rx irp to receive data */
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 	for (i = 0; i < NR_RECVBUFF; i++) {
-		if (!rtw_read_port(Adapter, precvpriv->ff_hwaddr, 0, (unsigned char *)precvbuf)) {
+		if (!rtw_read_port(Adapter, precvpriv->ff_hwaddr, (unsigned char *)precvbuf)) {
 			status = _FAIL;
 			goto exit;
 		}
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index e4a9350376bf..92fcc4441ee9 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -401,7 +401,7 @@ static void usb_read_port_complete(struct urb *purb, struct pt_regs *regs)
 	if (purb->status == 0) { /* SUCCESS */
 		if ((purb->actual_length > MAX_RECVBUF_SZ) || (purb->actual_length < RXDESC_SIZE)) {
 			precvbuf->reuse = true;
-			rtw_read_port(adapt, precvpriv->ff_hwaddr, 0, (unsigned char *)precvbuf);
+			rtw_read_port(adapt, precvpriv->ff_hwaddr, (unsigned char *)precvbuf);
 			DBG_88E("%s()-%d: RX Warning!\n", __func__, __LINE__);
 		} else {
 			rtw_reset_continual_urb_error(adapter_to_dvobj(adapt));
@@ -415,7 +415,7 @@ static void usb_read_port_complete(struct urb *purb, struct pt_regs *regs)
 
 			precvbuf->pskb = NULL;
 			precvbuf->reuse = false;
-			rtw_read_port(adapt, precvpriv->ff_hwaddr, 0, (unsigned char *)precvbuf);
+			rtw_read_port(adapt, precvpriv->ff_hwaddr, (unsigned char *)precvbuf);
 		}
 	} else {
 		DBG_88E("###=> usb_read_port_complete => urb status(%d)\n", purb->status);
@@ -436,7 +436,7 @@ static void usb_read_port_complete(struct urb *purb, struct pt_regs *regs)
 		case -EPROTO:
 		case -EOVERFLOW:
 			precvbuf->reuse = true;
-			rtw_read_port(adapt, precvpriv->ff_hwaddr, 0, (unsigned char *)precvbuf);
+			rtw_read_port(adapt, precvpriv->ff_hwaddr, (unsigned char *)precvbuf);
 			break;
 		case -EINPROGRESS:
 			DBG_88E("ERROR: URB IS IN PROGRESS!/n");
@@ -447,7 +447,7 @@ static void usb_read_port_complete(struct urb *purb, struct pt_regs *regs)
 	}
 }
 
-u32 rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *rmem)
+u32 rtw_read_port(struct adapter *adapter, u32 addr, u8 *rmem)
 {
 	struct urb *purb = NULL;
 	struct recv_buf	*precvbuf = (struct recv_buf *)rmem;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index c6a078210eeb..0e896d0b56a7 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -224,7 +224,7 @@ u8 rtw_read8(struct adapter *adapter, u32 addr);
 u16 rtw_read16(struct adapter *adapter, u32 addr);
 u32 rtw_read32(struct adapter *adapter, u32 addr);
 void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
-u32 rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
+u32 rtw_read_port(struct adapter *adapter, u32 addr, u8 *pmem);
 void rtw_read_port_cancel(struct adapter *adapter);
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
-- 
2.20.1

