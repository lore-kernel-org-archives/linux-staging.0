Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA242FB2
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 20:22:15 +0000 (UTC)
Received: from ipservice-092-217-077-211.092.217.pools.vodafone-ip.de ([92.217.77.211] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mOn2K-0005Wm-Ft; Fri, 10 Sep 2021 22:22:12 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/4] staging: r8188eu: remove unused function RT_usb_endpoint_num
Date: Fri, 10 Sep 2021 22:21:50 +0200
Message-Id: <20210910202151.4007-4-martin@kaiser.cx>
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

RT_usb_endpoint_num is unused. Remove this function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 1071234d9e5c..d22022b0cc93 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -88,11 +88,6 @@ static inline int RT_usb_endpoint_is_bulk_out(const struct usb_endpoint_descript
 	return RT_usb_endpoint_xfer_bulk(epd) && RT_usb_endpoint_dir_out(epd);
 }
 
-static inline int RT_usb_endpoint_num(const struct usb_endpoint_descriptor *epd)
-{
-	return epd->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
-}
-
 static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
 {
 	u8 rst = _SUCCESS;
-- 
2.20.1

