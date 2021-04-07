Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13A129CA
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 17:05:51 +0000 (UTC)
Received: from ipservice-092-217-079-185.092.217.pools.vodafone-ip.de ([92.217.79.185] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUBcj-0001Q6-N0; Wed, 07 Apr 2021 19:05:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/10] staging: rtl8188eu: remove unnecessary brackets
Date: Wed,  7 Apr 2021 19:05:23 +0200
Message-Id: <20210407170531.29356-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407170531.29356-1-martin@kaiser.cx>
References: <20210407170531.29356-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ESHUTDOWN is just a number, it needs no brackets.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index 8e9fd9d4afda..74f34440fc8c 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -267,7 +267,7 @@ usbctrl_vendorreq(struct adapter *adapt, u16 value, void *pdata, u16 len, u8 req
 				len, status, *(u32 *)pdata, vendorreq_times);
 
 			if (status < 0) {
-				if (status == (-ESHUTDOWN) || status == -ENODEV)
+				if (status == -ESHUTDOWN || status == -ENODEV)
 					adapt->bSurpriseRemoved = true;
 				else
 					adapt->HalData->srestpriv.wifi_error_status = USB_VEN_REQ_CMD_FAIL;
-- 
2.20.1

