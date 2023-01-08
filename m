Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E2C28F9
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 18:59:57 +0000 (UTC)
Received: from dslb-188-096-147-053.188.096.pools.vodafone-ip.de ([188.96.147.53] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEari-0003b8-4b; Sun, 08 Jan 2023 19:57:54 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/13] staging: r8188eu: replace switch with if
Date: Sun,  8 Jan 2023 19:57:30 +0100
Message-Id: <20230108185738.597105-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230108185738.597105-1-martin@kaiser.cx>
References: <20230108185738.597105-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The switch statement in usb_write_port_complete has only one single case.
Replace it with an if statement.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 6fe5a4230291..257bcf496012 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -41,13 +41,8 @@ static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 	struct adapter	*padapter = pxmitbuf->padapter;
 	struct xmit_priv	*pxmitpriv = &padapter->xmitpriv;
 
-	switch (pxmitbuf->flags) {
-	case HIGH_QUEUE_INX:
+	if (pxmitbuf->flags == HIGH_QUEUE_INX)
 		rtw_chk_hi_queue_cmd(padapter);
-		break;
-	default:
-		break;
-	}
 
 	if (padapter->bSurpriseRemoved || padapter->bDriverStopped ||
 	    padapter->bWritePortCancel)
-- 
2.30.2

