Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8022C87
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 17:32:28 +0000 (UTC)
Received: from dslb-084-059-234-221.084.059.pools.vodafone-ip.de ([84.59.234.221] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqf59-00083N-OV; Fri, 26 Nov 2021 18:32:19 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/8] staging: r8188eu: remove code to get int in pipe handle
Date: Fri, 26 Nov 2021 18:32:01 +0100
Message-Id: <20211126173205.21352-5-martin@kaiser.cx>
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

After the previous cleanup, ffaddr2pipehdl is called only by
rtw_write_port. This function will never ask for the pipe handle
of the interrupt in pipe. We can remove the related code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtl8188e_recv.h | 1 -
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c  | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_recv.h b/drivers/staging/r8188eu/include/rtl8188e_recv.h
index 3aa28b3ccb30..bc30eb4634bb 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_recv.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_recv.h
@@ -9,7 +9,6 @@
 #define RECV_BLK_SZ 512
 #define RECV_BLK_CNT 16
 #define RECV_BLK_TH RECV_BLK_CNT
-#define RECV_INT_IN_ADDR		0x81
 
 #define NR_PREALLOC_RECV_SKB (8)
 
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 5c659caa0975..d1cb33d3e6a7 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -12,9 +12,7 @@ unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
 	unsigned int pipe = 0, ep_num = 0;
 	struct usb_device *pusbd = pdvobj->pusbdev;
 
-	if (addr == RECV_INT_IN_ADDR) {
-		pipe = usb_rcvbulkpipe(pusbd, pdvobj->RtInPipe[1]);
-	} else if (addr < HW_QUEUE_ENTRY) {
+	if (addr < HW_QUEUE_ENTRY) {
 		ep_num = pdvobj->Queue2Pipe[addr];
 		pipe = usb_sndbulkpipe(pusbd, ep_num);
 	}
-- 
2.20.1

