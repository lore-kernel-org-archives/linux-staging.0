Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234886FCF
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 20:56:45 +0000 (UTC)
Received: from dslb-178-004-206-224.178.004.pools.vodafone-ip.de ([178.4.206.224] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFLfk-0001pw-9H; Tue, 10 Jan 2023 21:56:40 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/4] staging: r8188eu: remove unused function parameter
Date: Tue, 10 Jan 2023 21:56:25 +0100
Message-Id: <20230110205626.183516-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230110205626.183516-1-martin@kaiser.cx>
References: <20230110205626.183516-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regs parameter of the usb_write_port_complete function is not used. We
can remove it.

We can also remove the macro to hide the regs parameter when
usb_write_port_complete is used as callback function for an urb transfer.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/usb_ops_linux.h | 2 --
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c  | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops_linux.h b/drivers/staging/r8188eu/include/usb_ops_linux.h
index 966688eedf66..e406a1fccda7 100644
--- a/drivers/staging/r8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/r8188eu/include/usb_ops_linux.h
@@ -19,8 +19,6 @@
 	usb_bulkout_zero_complete(purb)
 #define usb_write_mem_complete(purb, regs)		\
 	usb_write_mem_complete(purb)
-#define usb_write_port_complete(purb, regs)		\
-	usb_write_port_complete(purb)
 #define usb_read_port_complete(purb, regs)		\
 	usb_read_port_complete(purb)
 #define usb_read_interrupt_complete(purb, regs)		\
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 7da13b87d726..3fd080091340 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -35,7 +35,7 @@ void rtw_read_port_cancel(struct adapter *padapter)
 	}
 }
 
-static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
+static void usb_write_port_complete(struct urb *purb)
 {
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)purb->context;
 	struct adapter *padapter = pxmitbuf->padapter;
-- 
2.30.2

