Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E92FAF
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 20:22:14 +0000 (UTC)
Received: from ipservice-092-217-077-211.092.217.pools.vodafone-ip.de ([92.217.77.211] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mOn2I-0005Wm-VF; Fri, 10 Sep 2021 22:22:11 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: remove unused function RT_usb_endpoint_is_bulk_in
Date: Fri, 10 Sep 2021 22:21:49 +0200
Message-Id: <20210910202151.4007-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910202151.4007-1-martin@kaiser.cx>
References: <20210910202151.4007-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the RT_usb_endpoint_is_bulk_in function which is not used.

RT_usb_endpoint_dir_in is no longer used either and can also be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 1eef0423529a..1071234d9e5c 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -73,11 +73,6 @@ static struct rtw_usb_drv rtl8188e_usb_drv = {
 
 static struct rtw_usb_drv *usb_drv = &rtl8188e_usb_drv;
 
-static inline int RT_usb_endpoint_dir_in(const struct usb_endpoint_descriptor *epd)
-{
-	return (epd->bEndpointAddress & USB_ENDPOINT_DIR_MASK) == USB_DIR_IN;
-}
-
 static inline int RT_usb_endpoint_dir_out(const struct usb_endpoint_descriptor *epd)
 {
 	return (epd->bEndpointAddress & USB_ENDPOINT_DIR_MASK) == USB_DIR_OUT;
@@ -88,11 +83,6 @@ static inline int RT_usb_endpoint_xfer_bulk(const struct usb_endpoint_descriptor
 	return (epd->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) == USB_ENDPOINT_XFER_BULK;
 }
 
-static inline int RT_usb_endpoint_is_bulk_in(const struct usb_endpoint_descriptor *epd)
-{
-	return RT_usb_endpoint_xfer_bulk(epd) && RT_usb_endpoint_dir_in(epd);
-}
-
 static inline int RT_usb_endpoint_is_bulk_out(const struct usb_endpoint_descriptor *epd)
 {
 	return RT_usb_endpoint_xfer_bulk(epd) && RT_usb_endpoint_dir_out(epd);
-- 
2.20.1

