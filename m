Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34766D11
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 20:49:17 +0000 (UTC)
Received: from ipservice-092-217-067-214.092.217.pools.vodafone-ip.de ([92.217.67.214] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lTsdP-0005Yc-QR; Tue, 06 Apr 2021 22:49:15 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/11] staging: rtl8188eu: clean up usb_read16
Date: Tue,  6 Apr 2021 22:48:24 +0200
Message-Id: <20210406204829.18130-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406204829.18130-1-martin@kaiser.cx>
References: <20210406204829.18130-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary variable, summarize declaration and assignment.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index 0172405c815e..915bf86237b0 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -306,13 +306,10 @@ u8 usb_read8(struct adapter *adapter, u32 addr)
 
 u16 usb_read16(struct adapter *adapter, u32 addr)
 {
-	u16 wvalue;
-	u16 len;
+	u16 wvalue = (u16)(addr & 0xffff);
 	__le32 data;
 
-	wvalue = (u16)(addr & 0x0000ffff);
-	len = 2;
-	usbctrl_vendorreq(adapter, wvalue, &data, len, REALTEK_USB_VENQT_READ);
+	usbctrl_vendorreq(adapter, wvalue, &data, 2, REALTEK_USB_VENQT_READ);
 
 	return (u16)(le32_to_cpu(data) & 0xffff);
 }
-- 
2.20.1

