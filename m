Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B14028FA
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 21:01:36 +0000 (UTC)
Received: from dslb-188-096-139-204.188.096.pools.vodafone-ip.de ([188.96.139.204] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pKQQ1-0001xR-1C; Tue, 24 Jan 2023 22:01:25 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: usb_read_port_complete needs no regs parameter
Date: Tue, 24 Jan 2023 22:01:05 +0100
Message-Id: <20230124210108.62170-2-martin@kaiser.cx>
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

Remove the regs parameter from usb_read_port_complete, it is not used.

Without the regs parameter, there's no need for the define that makes
usb_read_port_complete usable as urb callback function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c     | 2 +-
 drivers/staging/r8188eu/include/usb_ops_linux.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index e122c8ca929c..0f789d5250db 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -344,7 +344,7 @@ void rtl8188eu_recv_tasklet(unsigned long priv)
 	}
 }
 
-static void usb_read_port_complete(struct urb *purb, struct pt_regs *regs)
+static void usb_read_port_complete(struct urb *purb)
 {
 	struct recv_buf	*precvbuf = (struct recv_buf *)purb->context;
 	struct adapter	*adapt = (struct adapter *)precvbuf->adapter;
diff --git a/drivers/staging/r8188eu/include/usb_ops_linux.h b/drivers/staging/r8188eu/include/usb_ops_linux.h
index e406a1fccda7..0a8fefbd4c2e 100644
--- a/drivers/staging/r8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/r8188eu/include/usb_ops_linux.h
@@ -19,8 +19,6 @@
 	usb_bulkout_zero_complete(purb)
 #define usb_write_mem_complete(purb, regs)		\
 	usb_write_mem_complete(purb)
-#define usb_read_port_complete(purb, regs)		\
-	usb_read_port_complete(purb)
 #define usb_read_interrupt_complete(purb, regs)		\
 	usb_read_interrupt_complete(purb)
 
-- 
2.30.2

