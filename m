Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AAD2FB3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 20:22:18 +0000 (UTC)
Received: from ipservice-092-217-077-211.092.217.pools.vodafone-ip.de ([92.217.77.211] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mOn2H-0005Wm-Bz; Fri, 10 Sep 2021 22:22:09 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: remove unused function usb_endpoint_is_int
Date: Fri, 10 Sep 2021 22:21:48 +0200
Message-Id: <20210910202151.4007-2-martin@kaiser.cx>
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

The usb_endpoint_is_int is not used and can be removed.

RT_usb_endpoint_xfer_int was used only by usb_endpoint_is_int. Remove this
function as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index da93512993f1..1eef0423529a 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -83,11 +83,6 @@ static inline int RT_usb_endpoint_dir_out(const struct usb_endpoint_descriptor *
 	return (epd->bEndpointAddress & USB_ENDPOINT_DIR_MASK) == USB_DIR_OUT;
 }
 
-static inline int RT_usb_endpoint_xfer_int(const struct usb_endpoint_descriptor *epd)
-{
-	return (epd->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) == USB_ENDPOINT_XFER_INT;
-}
-
 static inline int RT_usb_endpoint_xfer_bulk(const struct usb_endpoint_descriptor *epd)
 {
 	return (epd->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) == USB_ENDPOINT_XFER_BULK;
@@ -103,11 +98,6 @@ static inline int RT_usb_endpoint_is_bulk_out(const struct usb_endpoint_descript
 	return RT_usb_endpoint_xfer_bulk(epd) && RT_usb_endpoint_dir_out(epd);
 }
 
-static inline int usb_endpoint_is_int(const struct usb_endpoint_descriptor *epd)
-{
-	return RT_usb_endpoint_xfer_int(epd) && RT_usb_endpoint_dir_in(epd);
-}
-
 static inline int RT_usb_endpoint_num(const struct usb_endpoint_descriptor *epd)
 {
 	return epd->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
-- 
2.20.1

