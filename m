Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E868F63
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 21:01:37 +0000 (UTC)
Received: from dslb-188-096-139-204.188.096.pools.vodafone-ip.de ([188.96.139.204] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pKQQ1-0001xR-Sc; Tue, 24 Jan 2023 22:01:25 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: remove defines that strip regs parameter
Date: Tue, 24 Jan 2023 22:01:06 +0100
Message-Id: <20230124210108.62170-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230124210108.62170-1-martin@kaiser.cx>
References: <20230124210108.62170-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_ops_linux.h has a number of defines that strip the regs parameter from
function that should be used as urb callbacks.

Remove the defines for functions that don't exist in the r8188eu driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/usb_ops_linux.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops_linux.h b/drivers/staging/r8188eu/include/usb_ops_linux.h
index 0a8fefbd4c2e..c7a0dc482761 100644
--- a/drivers/staging/r8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/r8188eu/include/usb_ops_linux.h
@@ -13,13 +13,4 @@
 
 #define RTW_USB_BULKOUT_TIME	5000/* ms */
 
-#define _usbctrl_vendorreq_async_callback(urb, regs)	\
-	_usbctrl_vendorreq_async_callback(urb)
-#define usb_bulkout_zero_complete(purb, regs)		\
-	usb_bulkout_zero_complete(purb)
-#define usb_write_mem_complete(purb, regs)		\
-	usb_write_mem_complete(purb)
-#define usb_read_interrupt_complete(purb, regs)		\
-	usb_read_interrupt_complete(purb)
-
 #endif
-- 
2.30.2

