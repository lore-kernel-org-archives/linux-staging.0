Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487CF3FC9
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 16:50:06 +0000 (UTC)
Received: from dslb-178-004-175-162.178.004.pools.vodafone-ip.de ([178.4.175.162] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mHUC1-0002Ch-N1; Sat, 21 Aug 2021 18:50:01 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/10] staging: r8188eu: set pipe only once
Date: Sat, 21 Aug 2021 18:48:59 +0200
Message-Id: <20210821164859.4351-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210821164859.4351-1-martin@kaiser.cx>
References: <20210821164859.4351-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the pipe for reading or writing in usbctrl_vendorreq only once.
There's no need to set it again for every retry.

This patch is an adaptation of commit 889ed8b5e374 ("staging: rtl8188eu:
set pipe only once") for the new r8188eu driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 5408383ccec3..5a55ee38d7b8 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -40,15 +40,16 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 		goto release_mutex;
 	}
 
-	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
-		memset(pIo_buf, 0, len);
+	if (requesttype == REALTEK_USB_VENQT_READ)
+		pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
+	else
+		pipe = usb_sndctrlpipe(udev, 0);/* write_out */
 
-		if (requesttype == REALTEK_USB_VENQT_READ) {
-			pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
-		} else {
-			pipe = usb_sndctrlpipe(udev, 0);/* write_out */
+	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
+		if (requesttype == REALTEK_USB_VENQT_READ)
+			memset(pIo_buf, 0, len);
+		else
 			memcpy(pIo_buf, pdata, len);
-		}
 
 		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
 					 requesttype, value, REALTEK_USB_VENQT_CMD_IDX,
-- 
2.20.1

