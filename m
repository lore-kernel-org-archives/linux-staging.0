Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E83EA931
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 19:57:02 +0000 (UTC)
Received: from dslb-188-096-145-172.188.096.pools.vodafone-ip.de ([188.96.145.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFhDV-0005F2-Tu; Wed, 11 Jan 2023 20:56:57 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 06/20] staging: r8188eu: remove struct io_queue
Date: Wed, 11 Jan 2023 20:56:26 +0100
Message-Id: <20230111195640.306748-7-martin@kaiser.cx>
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

struct io_queue is not used in the r8188eu driver. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_io.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 6ce099e91e20..7d1f3cc20b57 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -82,7 +82,6 @@
 
 struct intf_priv;
 struct intf_hdl;
-struct io_queue;
 
 struct io_req {
 	struct list_head list;
@@ -188,21 +187,6 @@ struct reg_protocol_wt {
 #endif
 };
 
-/*
-Below is the data structure used by _io_handler
-*/
-
-struct io_queue {
-	spinlock_t lock;
-	struct list_head free_ioreqs;
-	struct list_head pending;	/* The io_req list that will be served
-					 * in the single protocol read/write.*/
-	struct list_head processing;
-	u8	*free_ioreqs_buf; /*  4-byte aligned */
-	u8	*pallocated_free_ioreqs_buf;
-	struct	intf_hdl	intf;
-};
-
 uint register_intf_hdl(u8 *dev, struct intf_hdl *pintfhdl);
 void unregister_intf_hdl(struct intf_hdl *pintfhdl);
 
-- 
2.30.2

