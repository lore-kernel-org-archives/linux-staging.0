Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EED6FBB
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 20:56:44 +0000 (UTC)
Received: from dslb-178-004-206-224.178.004.pools.vodafone-ip.de ([178.4.206.224] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFLfj-0001pw-H5; Tue, 10 Jan 2023 21:56:39 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: reformat usb_write_port_complete
Date: Tue, 10 Jan 2023 21:56:24 +0100
Message-Id: <20230110205626.183516-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230110205626.183516-1-martin@kaiser.cx>
References: <20230110205626.183516-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This trivial patch reformats the usb_write_port_complete function.
Hopefully, this makes the code a bit easier to read.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 8494b80a08e5..7da13b87d726 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -38,14 +38,13 @@ void rtw_read_port_cancel(struct adapter *padapter)
 static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 {
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)purb->context;
-	struct adapter	*padapter = pxmitbuf->padapter;
-	struct xmit_priv	*pxmitpriv = &padapter->xmitpriv;
+	struct adapter *padapter = pxmitbuf->padapter;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	if (pxmitbuf->flags == HIGH_QUEUE_INX)
 		rtw_chk_hi_queue_cmd(padapter);
 
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped ||
-	    padapter->bWritePortCancel)
+	if (padapter->bSurpriseRemoved || padapter->bDriverStopped || padapter->bWritePortCancel)
 		goto check_completion;
 
 	switch (purb->status) {
@@ -66,13 +65,9 @@ static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 
 check_completion:
 	rtw_sctx_done_err(&pxmitbuf->sctx,
-			  purb->status ? RTW_SCTX_DONE_WRITE_PORT_ERR :
-			  RTW_SCTX_DONE_SUCCESS);
-
+			  purb->status ? RTW_SCTX_DONE_WRITE_PORT_ERR : RTW_SCTX_DONE_SUCCESS);
 	rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
-
 	tasklet_hi_schedule(&pxmitpriv->xmit_tasklet);
-
 }
 
 u32 rtw_write_port(struct adapter *padapter, u32 addr, u32 cnt, u8 *wmem)
-- 
2.30.2

