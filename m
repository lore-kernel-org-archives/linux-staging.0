Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FFDA92F
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 19:57:12 +0000 (UTC)
Received: from dslb-188-096-145-172.188.096.pools.vodafone-ip.de ([188.96.145.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFhDe-0005F2-IF; Wed, 11 Jan 2023 20:57:06 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 17/20] staging: r8188eu: pass struct adapter to usb_read
Date: Wed, 11 Jan 2023 20:56:37 +0100
Message-Id: <20230111195640.306748-18-martin@kaiser.cx>
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

The usb_read function takes a struct intf_hdl only to extract the struct
adapter from it. We can pass struct adapter directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 0deaa5c24ab2..f8900b51d750 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -7,9 +7,8 @@
 #include "../include/usb_ops.h"
 #include "../include/rtl8188e_hal.h"
 
-static int usb_read(struct intf_hdl *intf, u16 value, void *data, u8 size)
+static int usb_read(struct adapter *adapt, u16 value, void *data, u8 size)
 {
-	struct adapter *adapt = intf->padapter;
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
 	int status;
@@ -95,20 +94,18 @@ static int usb_write(struct intf_hdl *intf, u16 value, void *data, u8 size)
 
 int __must_check rtw_read8(struct adapter *adapter, u32 addr, u8 *data)
 {
-	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 
-	return usb_read(intf, value, data, 1);
+	return usb_read(adapter, value, data, 1);
 }
 
 int __must_check rtw_read16(struct adapter *adapter, u32 addr, u16 *data)
 {
-	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 	__le16 le_data;
 	int res;
 
-	res = usb_read(intf, value, &le_data, 2);
+	res = usb_read(adapter, value, &le_data, 2);
 	if (res)
 		return res;
 
@@ -119,12 +116,11 @@ int __must_check rtw_read16(struct adapter *adapter, u32 addr, u16 *data)
 
 int __must_check rtw_read32(struct adapter *adapter, u32 addr, u32 *data)
 {
-	struct intf_hdl *intf = &adapter->intf;
 	u16 value = addr & 0xffff;
 	__le32 le_data;
 	int res;
 
-	res = usb_read(intf, value, &le_data, 4);
+	res = usb_read(adapter, value, &le_data, 4);
 	if (res)
 		return res;
 
-- 
2.30.2

