Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E8D6D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 17:05:58 +0000 (UTC)
Received: from ipservice-092-217-079-185.092.217.pools.vodafone-ip.de ([92.217.79.185] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUBcr-0001Q6-4u; Wed, 07 Apr 2021 19:05:57 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/10] staging: rtl8188eu: set pipe only once
Date: Wed,  7 Apr 2021 19:05:26 +0200
Message-Id: <20210407170531.29356-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407170531.29356-1-martin@kaiser.cx>
References: <20210407170531.29356-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the pipe for reading or writing in usbctrl_vendorreq only once. There's
no need to set it again for every retry.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 .../staging/rtl8188eu/os_dep/usb_ops_linux.c  | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index 13d2733b2b1b..f2fa4fb3595f 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -249,18 +249,20 @@ usbctrl_vendorreq(struct adapter *adapt, u16 value, void *pdata, u16 len, u8 req
 		goto release_mutex;
 	}
 
-	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
-		memset(pIo_buf, 0, len);
+	if (reqtype == REALTEK_USB_VENQT_READ) {
+		pipe = usb_rcvctrlpipe(udev, 0);
+	} else if (reqtype == REALTEK_USB_VENQT_WRITE) {
+		pipe = usb_sndctrlpipe(udev, 0);
+	} else {
+		status = -EINVAL;
+		goto free_buf;
+	}
 
-		if (reqtype == REALTEK_USB_VENQT_READ) {
-			pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
-		} else if (reqtype == REALTEK_USB_VENQT_WRITE) {
-			pipe = usb_sndctrlpipe(udev, 0);/* write_out */
+	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
+		if (reqtype == REALTEK_USB_VENQT_READ)
+			memset(pIo_buf, 0, len);
+		else
 			memcpy(pIo_buf, pdata, len);
-		} else {
-			status = -EINVAL;
-			goto free_buf;
-		}
 
 		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
 					 reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
-- 
2.20.1

