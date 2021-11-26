Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5392C82
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 17:32:28 +0000 (UTC)
Received: from dslb-084-059-234-221.084.059.pools.vodafone-ip.de ([84.59.234.221] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqf58-00083N-Cd; Fri, 26 Nov 2021 18:32:18 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/8] staging: r8188eu: get the rcv bulk pipe handle directly
Date: Fri, 26 Nov 2021 18:32:00 +0100
Message-Id: <20211126173205.21352-4-martin@kaiser.cx>
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

There's no point in calling ffaddr2pipehdl from rtw_read_port if the
endpoint address is constant. We can call usb_rcvbulkpipe ourselves
to get the pipe handle.

We can now remove RECV_BULK_IN_ADDR.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c     | 2 +-
 drivers/staging/r8188eu/include/rtl8188e_recv.h | 1 -
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c  | 4 +---
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 6af55cd6c061..d66a4b394610 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -507,7 +507,7 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 	purb = precvbuf->purb;
 
 	/* translate DMA FIFO addr to pipehandle */
-	pipe = ffaddr2pipehdl(pdvobj, RECV_BULK_IN_ADDR);
+	pipe = usb_rcvbulkpipe(pusbd, pdvobj->RtInPipe[0]);
 
 	usb_fill_bulk_urb(purb, pusbd, pipe,
 			  precvbuf->pbuf,
diff --git a/drivers/staging/r8188eu/include/rtl8188e_recv.h b/drivers/staging/r8188eu/include/rtl8188e_recv.h
index 2ab395ef579b..3aa28b3ccb30 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_recv.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_recv.h
@@ -9,7 +9,6 @@
 #define RECV_BLK_SZ 512
 #define RECV_BLK_CNT 16
 #define RECV_BLK_TH RECV_BLK_CNT
-#define RECV_BULK_IN_ADDR		0x80
 #define RECV_INT_IN_ADDR		0x81
 
 #define NR_PREALLOC_RECV_SKB (8)
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index ef2ea68ae873..5c659caa0975 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -12,9 +12,7 @@ unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
 	unsigned int pipe = 0, ep_num = 0;
 	struct usb_device *pusbd = pdvobj->pusbdev;
 
-	if (addr == RECV_BULK_IN_ADDR) {
-		pipe = usb_rcvbulkpipe(pusbd, pdvobj->RtInPipe[0]);
-	} else if (addr == RECV_INT_IN_ADDR) {
+	if (addr == RECV_INT_IN_ADDR) {
 		pipe = usb_rcvbulkpipe(pusbd, pdvobj->RtInPipe[1]);
 	} else if (addr < HW_QUEUE_ENTRY) {
 		ep_num = pdvobj->Queue2Pipe[addr];
-- 
2.20.1

