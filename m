Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BEF7480
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 20:56:46 +0000 (UTC)
Received: from dslb-178-004-206-224.178.004.pools.vodafone-ip.de ([178.4.206.224] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFLfl-0001pw-3j; Tue, 10 Jan 2023 21:56:41 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: r8188eu: always process urb status
Date: Tue, 10 Jan 2023 21:56:26 +0100
Message-Id: <20230110205626.183516-5-martin@kaiser.cx>
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

Remove the if clause in usb_write_port_complete and process the urb
status regardless of bSurpriseRemoved, bDriverStopped and
bWritePortCancel.

The only possible results of urb status processing are updates to
bSurpriseRemoved and bDriverStopped. All of the three status variable are
set to true only if the whole USB processing has to be stopped (when the
driver is unloaded or when the system goes to sleep).

It's no problem if one of the "stop everything" variables is already set
and the urb status processing sets another one.

This patch removes the last goto in usb_write_port_complete. It's also
part of the ongoing effort to limit the use of the "stop everything"
variables.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 3fd080091340..62106d2f82ad 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -44,9 +44,6 @@ static void usb_write_port_complete(struct urb *purb)
 	if (pxmitbuf->flags == HIGH_QUEUE_INX)
 		rtw_chk_hi_queue_cmd(padapter);
 
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped || padapter->bWritePortCancel)
-		goto check_completion;
-
 	switch (purb->status) {
 	case 0:
 	case -EINPROGRESS:
@@ -63,7 +60,6 @@ static void usb_write_port_complete(struct urb *purb)
 		break;
 	}
 
-check_completion:
 	rtw_sctx_done_err(&pxmitbuf->sctx,
 			  purb->status ? RTW_SCTX_DONE_WRITE_PORT_ERR : RTW_SCTX_DONE_SUCCESS);
 	rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
-- 
2.30.2

