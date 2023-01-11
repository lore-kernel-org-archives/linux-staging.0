Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB803A92F
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 19:56:57 +0000 (UTC)
Received: from dslb-188-096-145-172.188.096.pools.vodafone-ip.de ([188.96.145.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFhDQ-0005F2-Hi; Wed, 11 Jan 2023 20:56:52 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/20] staging: r8188eu: remove struct io_priv
Date: Wed, 11 Jan 2023 20:56:21 +0100
Message-Id: <20230111195640.306748-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111195640.306748-1-martin@kaiser.cx>
References: <20230111195640.306748-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct io_priv has only one member (and a pointer to the enclosing struct
adapter). We can remove struct io_priv and move its member directly into
struct adapter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 21 +++++++--------------
 drivers/staging/r8188eu/include/drv_types.h |  2 +-
 drivers/staging/r8188eu/include/rtw_io.h    |  5 -----
 drivers/staging/r8188eu/os_dep/usb_intf.c   |  5 +----
 4 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index a238d29a3a46..0deaa5c24ab2 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -95,8 +95,7 @@ static int usb_write(struct intf_hdl *intf, u16 value, void *data, u8 size)
 
 int __must_check rtw_read8(struct adapter *adapter, u32 addr, u8 *data)
 {
-	struct io_priv *io_priv = &adapter->iopriv;
-	struct intf_hdl *intf = &io_priv->intf;
+	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 
 	return usb_read(intf, value, data, 1);
@@ -104,8 +103,7 @@ int __must_check rtw_read8(struct adapter *adapter, u32 addr, u8 *data)
 
 int __must_check rtw_read16(struct adapter *adapter, u32 addr, u16 *data)
 {
-	struct io_priv *io_priv = &adapter->iopriv;
-	struct intf_hdl *intf = &io_priv->intf;
+	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 	__le16 le_data;
 	int res;
@@ -121,8 +119,7 @@ int __must_check rtw_read16(struct adapter *adapter, u32 addr, u16 *data)
 
 int __must_check rtw_read32(struct adapter *adapter, u32 addr, u32 *data)
 {
-	struct io_priv *io_priv = &adapter->iopriv;
-	struct intf_hdl *intf = &io_priv->intf;
+	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 	__le32 le_data;
 	int res;
@@ -138,8 +135,7 @@ int __must_check rtw_read32(struct adapter *adapter, u32 addr, u32 *data)
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
-	struct io_priv *io_priv = &adapter->iopriv;
-	struct intf_hdl *intf = &io_priv->intf;
+	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 	int ret;
 
@@ -150,8 +146,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
-	struct io_priv *io_priv = &adapter->iopriv;
-	struct intf_hdl *intf = &io_priv->intf;
+	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 	__le16 data = cpu_to_le16(val);
 	int ret;
@@ -163,8 +158,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
-	struct io_priv *io_priv = &adapter->iopriv;
-	struct intf_hdl *intf = &io_priv->intf;
+	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 	__le32 data = cpu_to_le32(val);
 	int ret;
@@ -176,8 +170,7 @@ int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 
 int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 {
-	struct io_priv *io_priv = &adapter->iopriv;
-	struct intf_hdl *intf = &io_priv->intf;
+	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 	int ret;
 
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 4803d0c77d70..614673902377 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -152,7 +152,7 @@ struct adapter {
 	struct	mlme_ext_priv mlmeextpriv;
 	struct	cmd_priv	cmdpriv;
 	struct	evt_priv	evtpriv;
-	struct	io_priv	iopriv;
+	struct	intf_hdl	intf;
 	struct	xmit_priv	xmitpriv;
 	struct	recv_priv	recvpriv;
 	struct	sta_priv	stapriv;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index e9744694204b..c15b2e873fd5 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -203,11 +203,6 @@ struct io_queue {
 	struct	intf_hdl	intf;
 };
 
-struct io_priv {
-	struct adapter *padapter;
-	struct intf_hdl intf;
-};
-
 uint ioreq_flush(struct adapter *adapter, struct io_queue *ioqueue);
 void sync_ioreq_enqueue(struct io_req *preq, struct io_queue *ioqueue);
 uint sync_ioreq_flush(struct adapter *adapter, struct io_queue *ioqueue);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 5fbfbcd95de2..1f70e5fee1b2 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -290,7 +290,6 @@ static int rtw_usb_if1_init(struct dvobj_priv *dvobj, struct usb_interface *pusb
 {
 	struct adapter *padapter = NULL;
 	struct net_device *pnetdev = NULL;
-	struct io_priv *piopriv;
 	struct intf_hdl *pintf;
 	int ret;
 
@@ -319,9 +318,7 @@ static int rtw_usb_if1_init(struct dvobj_priv *dvobj, struct usb_interface *pusb
 	padapter->intf_stop = &usb_intf_stop;
 
 	/* step init_io_priv */
-	piopriv = &padapter->iopriv;
-	pintf = &piopriv->intf;
-	piopriv->padapter = padapter;
+	pintf = &padapter->intf;
 	pintf->padapter = padapter;
 	pintf->pintf_dev = adapter_to_dvobj(padapter);
 
-- 
2.30.2

