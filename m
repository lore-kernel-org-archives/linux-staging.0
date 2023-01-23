Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE0880A
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:54:02 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pF-0000Lk-NR; Mon, 23 Jan 2023 21:53:57 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/23] staging: r8188eu: remove struct intf_hdl
Date: Mon, 23 Jan 2023 21:53:22 +0100
Message-Id: <20230123205342.229589-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123205342.229589-1-martin@kaiser.cx>
References: <20230123205342.229589-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no more users of struct intf_hdl in the r8188eu driver. We can
now remove this struct.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/drv_types.h | 1 -
 drivers/staging/r8188eu/include/rtw_io.h    | 6 ------
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 6 ------
 3 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 614673902377..7b170eed66b3 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -152,7 +152,6 @@ struct adapter {
 	struct	mlme_ext_priv mlmeextpriv;
 	struct	cmd_priv	cmdpriv;
 	struct	evt_priv	evtpriv;
-	struct	intf_hdl	intf;
 	struct	xmit_priv	xmitpriv;
 	struct	recv_priv	recvpriv;
 	struct	sta_priv	stapriv;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 0d2aa432f88d..033ea7146861 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -17,12 +17,6 @@
 #include <linux/usb/ch9.h>
 
 struct intf_priv;
-struct intf_hdl;
-
-struct	intf_hdl {
-	struct adapter *padapter;
-	struct dvobj_priv *pintf_dev;
-};
 
 int __must_check rtw_read8(struct adapter *adapter, u32 addr, u8 *data);
 int __must_check rtw_read16(struct adapter *adapter, u32 addr, u16 *data);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 1f70e5fee1b2..1f114b1fc4d5 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -290,7 +290,6 @@ static int rtw_usb_if1_init(struct dvobj_priv *dvobj, struct usb_interface *pusb
 {
 	struct adapter *padapter = NULL;
 	struct net_device *pnetdev = NULL;
-	struct intf_hdl *pintf;
 	int ret;
 
 	padapter = vzalloc(sizeof(*padapter));
@@ -317,11 +316,6 @@ static int rtw_usb_if1_init(struct dvobj_priv *dvobj, struct usb_interface *pusb
 	padapter->intf_start = &usb_intf_start;
 	padapter->intf_stop = &usb_intf_stop;
 
-	/* step init_io_priv */
-	pintf = &padapter->intf;
-	pintf->padapter = padapter;
-	pintf->pintf_dev = adapter_to_dvobj(padapter);
-
 	/* step read_chip_version */
 	rtl8188e_read_chip_version(padapter);
 
-- 
2.30.2

