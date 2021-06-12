Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C366D0D
	for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 18:01:00 +0000 (UTC)
Received: from dslb-188-097-213-151.188.097.pools.vodafone-ip.de ([188.97.213.151] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ls7wI-0003B8-1f; Sat, 12 Jun 2021 20:00:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 2/6] staging: rtl8188eu: fix usb_submit_urb error handling
Date: Sat, 12 Jun 2021 20:00:15 +0200
Message-Id: <20210612180019.20387-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210612180019.20387-1-martin@kaiser.cx>
References: <20210612180019.20387-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-EPERM should be handled like any other error.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index ec07b2017fb7..0ceb05f3884f 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -366,7 +366,6 @@ u32 usb_read_port(struct adapter *adapter, u32 addr, struct recv_buf *precvbuf)
 	struct usb_device *pusbd = pdvobj->pusbdev;
 	int err;
 	unsigned int pipe;
-	u32 ret = _SUCCESS;
 
 	if (adapter->bDriverStopped || adapter->bSurpriseRemoved ||
 	    adapter->pwrctrlpriv.pnp_bstop_trx) {
@@ -403,10 +402,10 @@ u32 usb_read_port(struct adapter *adapter, u32 addr, struct recv_buf *precvbuf)
 			  precvbuf);/* context is precvbuf */
 
 	err = usb_submit_urb(purb, GFP_ATOMIC);
-	if ((err) && (err != (-EPERM)))
-		ret = _FAIL;
+	if (err)
+		return _FAIL;
 
-	return ret;
+	return _SUCCESS;
 }
 
 void rtw_hal_inirp_deinit(struct adapter *padapter)
-- 
2.20.1

