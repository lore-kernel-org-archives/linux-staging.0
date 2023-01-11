Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECBC17EF
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 10:02:21 +0000 (UTC)
Received: from dslb-188-096-145-172.188.096.pools.vodafone-ip.de ([188.96.145.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFXvu-0000gP-3P; Wed, 11 Jan 2023 11:02:10 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: remove NULL check for usb_kill_urb
Date: Wed, 11 Jan 2023 11:02:01 +0100
Message-Id: <20230111100201.251905-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_kill_urb handles a NULL parameter. There's no need for NULL checks
before we call usb_kill_urb.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 62106d2f82ad..583533631133 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -29,8 +29,7 @@ void rtw_read_port_cancel(struct adapter *padapter)
 
 	for (i = 0; i < NR_RECVBUFF; i++) {
 		precvbuf->reuse = true;
-		if (precvbuf->purb)
-			usb_kill_urb(precvbuf->purb);
+		usb_kill_urb(precvbuf->purb);
 		precvbuf++;
 	}
 }
@@ -153,15 +152,13 @@ void rtw_write_port_cancel(struct adapter *padapter)
 	padapter->bWritePortCancel = true;
 
 	for (i = 0; i < NR_XMITBUFF; i++) {
-		if (pxmitbuf->pxmit_urb)
-			usb_kill_urb(pxmitbuf->pxmit_urb);
+		usb_kill_urb(pxmitbuf->pxmit_urb);
 		pxmitbuf++;
 	}
 
 	pxmitbuf = (struct xmit_buf *)padapter->xmitpriv.pxmit_extbuf;
 	for (i = 0; i < NR_XMIT_EXTBUFF; i++) {
-		if (pxmitbuf->pxmit_urb)
-			usb_kill_urb(pxmitbuf->pxmit_urb);
+		usb_kill_urb(pxmitbuf->pxmit_urb);
 		pxmitbuf++;
 	}
 }
-- 
2.30.2

