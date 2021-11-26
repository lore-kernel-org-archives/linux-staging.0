Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBAB2C82
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 17:32:32 +0000 (UTC)
Received: from dslb-084-059-234-221.084.059.pools.vodafone-ip.de ([84.59.234.221] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqf5J-00083N-O9; Fri, 26 Nov 2021 18:32:29 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/8] staging: r8188eu: remove ep_num array
Date: Fri, 26 Nov 2021 18:32:03 +0100
Message-Id: <20211126173205.21352-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211126173205.21352-1-martin@kaiser.cx>
References: <20211126173205.21352-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ep_num array in struct dvobj_priv is not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/drv_types.h | 1 -
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index c3d8ef134a4d..a3fb509f3f90 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -149,7 +149,6 @@ struct dvobj_priv {
 	u8	ishighspeed;
 	u8	RtNumInPipes;
 	u8	RtNumOutPipes;
-	int	ep_num[5]; /* endpoint number */
 	int	RegUsbSS;
 	struct semaphore usb_suspend_sema;
 	struct mutex  usb_vendor_req_mutex;
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index e66046c82973..8aa22c2f56cd 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -116,7 +116,6 @@ static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
 				ep_num;
 			pdvobjpriv->RtNumOutPipes++;
 		}
-		pdvobjpriv->ep_num[i] = ep_num;
 	}
 
 	if (pusbd->speed == USB_SPEED_HIGH) {
-- 
2.20.1

